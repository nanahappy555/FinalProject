package kr.or.ddit.controller.prof;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.ddit.command.AttachRegistCommand;
import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.CriteriaExam;
import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.controller.MultipartFileUploadResolver;
import kr.or.ddit.dao.prof.ExamDAO;
import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.SemesterVO;
import kr.or.ddit.dto.prof.AssignmentVO;
import kr.or.ddit.dto.prof.ExamVO;
import kr.or.ddit.dto.prof.MarkVO;
import kr.or.ddit.dto.prof.WeekNoticeVO;
import kr.or.ddit.dto.stu.AttendVO;
import kr.or.ddit.dto.stu.LecQnaVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import kr.or.ddit.service.common.SemesterServiceImpl;
import kr.or.ddit.service.prof.AssignmentEvalService;
import kr.or.ddit.service.prof.AssignmentService;
import kr.or.ddit.service.prof.ExamService;
import kr.or.ddit.service.prof.LecAttendService;
import kr.or.ddit.service.prof.LectureListForProfService;
import kr.or.ddit.service.prof.LectureNoticeService;
import kr.or.ddit.service.prof.MarkService;
import kr.or.ddit.service.prof.WeekNoticeService;
import kr.or.ddit.service.stu.lec.LecQnaService;
import kr.or.ddit.service.stu.lec.MyLectureService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/prof/lec")
@Slf4j
public class ProfLecController {
	
	@Autowired
	private LectureListForProfService lectureListForProfService;
	
	@Autowired
	private LecAttendService lecAttendService;
	
	@Autowired
	private MyLectureService mylectureService;
	
	@Autowired
	private WeekNoticeService weekNoticeService;
	
	@Autowired
	private LecQnaService lecQnaService;
	
	@Autowired
	private ExamService examService;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mnv,HttpSession session, Criteria cri) throws SQLException {
		String url="prof/lec/lectureList";
		
		List<LecQnaVO> lecQnaList = lecQnaService.getLecQnaListByProfId(session);
		List<ExamVO> upcomingExamList = examService.getUpcomingExamList(session);
		Map<String, Object> dataMap = lectureListForProfService.getLectureListForProfByProfId(session, cri);
		
		
		
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("upcomingExamList",upcomingExamList);
		mnv.addObject("lecQnaList",lecQnaList);
		mnv.setViewName(url);
		return mnv;
	}
	
//	@GetMapping("/main.do")
//	public String main(String lecCode,Model model){
//		String url="prof/lec/lecBoardMain";
//		model.addAttribute("lecCode",lecCode);
//		return url;
//	}
	
	
	@Autowired
	private LectureNoticeService lectureNoticeService;
	
	@Autowired
	private AssignmentService assignmentService;
	
	@GetMapping("/main")
	public ModelAndView main(String lecCd,ModelAndView mnv) throws SQLException{
		String url="prof/lec/lecBoardMain";
		
		mnv.addObject("lecCd", lecCd);
		mnv.setViewName(url);
		
		return mnv;
	}
    
	
	
	@RequestMapping(value="/notice/list",produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getNoticeList(CriteriaLec cri,int notPage) throws SQLException {
		
		
		cri.setPage(notPage);
		Map<String, Object> lectureNoticeList = lectureNoticeService.getLectureNoticeList(cri);
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(lectureNoticeList, HttpStatus.OK);
		
		return entity;
	}
	
	
	
	
	@GetMapping("/notice/detail")
	public ModelAndView noticeDetail(LecNoticeVO lecNotice, @RequestParam(defaultValue="") String from,ModelAndView mnv) throws SQLException {
		String url = "prof/lec/noticeDetail";
		
		int lecNoticeNo = lecNotice.getLecNoticeNo();
		String lecCd = lecNotice.getLecCd();
		
		LecNoticeVO notice = null;
		if(from!=null && from.equals("list")) {
			notice = lectureNoticeService.getLectureNotice(lecNotice);
			url = "redirect:/prof/lec/notice/detail?lecCd="+lecCd+"&lecNoticeNo="+lecNoticeNo;
		}else {
			notice = lectureNoticeService.getLectureNoticeForModify(lecNotice);
		}

		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@GetMapping("/notice/registForm")
	public ModelAndView registForm(String lecCd, ModelAndView mnv) throws SQLException {
		String url = "mylecture/noticeRegistForm";
		
		mnv.addObject("lecCd",lecCd);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
	
	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	//파일첨부 구현용 참고
//	@PostMapping("/notice/regist")
//	public String regist(LectureNoticeCommand registReq, HttpServletRequest request,RedirectAttributes rttr)throws Exception{
//		return null;
//	}
	@PostMapping(value="/notice/regist", produces = "text/plain;charset=utf-8")
	public String regist(LecNoticeVO lecNotice, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		String url = "redirect:/prof/lec/main";
		
		log.debug("lecCd확인 : " + lecNotice.getLecCd());
		
		lecNotice.setTitle(HTMLInputFilter.htmlSpecialChars(lecNotice.getTitle()));
		
		lectureNoticeService.regist(lecNotice);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	@GetMapping("/notice/modifyForm")
	public ModelAndView modifyForm(LecNoticeVO lecNotice,ModelAndView mnv) throws SQLException {
		String url = "mylecture/noticeModifyForm";
		
		int lecNoticeNo = lecNotice.getLecNoticeNo();
		log.info("lecNoticeNo:"+lecNoticeNo);
		
		//lecNotice.setLecCd(this.lecCd); //없어질 코드
		
		LecNoticeVO notice = lectureNoticeService.getLectureNoticeForModify(lecNotice);
		
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
//	@GetMapping("/lecBoardMainIndex.do") //얘뭐임?
//	public String lecBoardIndex(String lectureCD) {
//		String url = "prof/lec/lecBoardMainIndex";
//		return url;
//	}
	
	
	
		
	
	
	@RequestMapping(value="/qna/list",produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> QnaList(CriteriaLec cri,int qnaPage) throws SQLException {
		
		cri.setPage(qnaPage);
		Map<String, Object> lecQnaList = lecQnaService.getLecQnaList(cri);
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(lecQnaList, HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/qna/detail")
	public ModelAndView QnaDetail(int lecqBno,ModelAndView mnv,HttpServletRequest request) throws SQLException {
		String url = "prof/lec/qnaDetail";
		
		HttpSession session=request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String memId =member.getMemId();
		String memClassCd = member.getMemClassCd();
		
		LecQnaVO detail = lecQnaService.getLecQnaDetail(lecqBno);
		mnv.addObject("detail",detail);
		mnv.addObject("memClassCd",memClassCd);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("qna/delete")
	public void qnaDelete(int lecqBno)throws SQLException{
		lecQnaService.removeLecQna(lecqBno);
	}
	
	@PostMapping("/qna/updateReply")
	public String updateReply(LecQnaVO vo) throws SQLException {
		String url = "redirect:/prof/lec/qna/detail?lecCd=" + vo.getLecCd() + "&lecqBno="+vo.getLecqBno();	
		lecQnaService.modifyReply(vo);
		return url;
	}
	

	
	
	@RequestMapping(value="/exam/list",produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> ScheduleList(CriteriaExam cri) throws SQLException {
		
		cri.setPage(cri.getPage());
		
        Map<String, Object> examList = examService.getExamList(cri);
		
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(examList, HttpStatus.OK);

		return entity;
	}
	
	
	
	@RequestMapping(value="/assignment/list",produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getAssignmentList(CriteriaLec cri,int assPage) throws SQLException {
		
		cri.setPage(assPage);
		Map<String, Object> assignmentList = assignmentService.getAssignemtList(cri);
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(assignmentList, HttpStatus.OK);
		
		
		return entity;
	}
	
	
	
	
	
	@GetMapping("/assignment/detail")
	public ModelAndView assignmentDetail(AssignmentVO vo,ModelAndView mnv) throws SQLException {
		String url = "prof/lec/assignmentDetail";
		
		AssignmentVO detail = assignmentService.getDetail(vo);
		
		mnv.addObject("detail",detail);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/assignment/registForm")
	public ModelAndView assignmentRegistForm(String lecCd,ModelAndView mnv) {
		String url = "prof/lec/assignmentRegist";
		
		
		mnv.addObject("lecCd",lecCd);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PostMapping(value="/assignment/regist", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String assignmentRegist(AssignmentVO vo,AttachRegistCommand registReq) throws Exception {
		
		log.debug("assignmentRegist VO : "+ vo);
		log.debug("assignmentRegist registReq : "+ registReq);
		
		
		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = null;
		if (registReq != null) {
			attachList = MultipartFileUploadResolver.fileUpload(registReq.getUploadFile(), savePath);
			vo.setAttachList(attachList);
		}
		
		assignmentService.registAssignment(vo);
		
		return "성공";
	}
	
	@PostMapping(value="/assignment/remove", produces = "text/plain;charset=utf-8")
	public String assignmentDelete(int assBno,String lecCd,RedirectAttributes rttr) throws SQLException {
		assignmentService.removeAssignment(assBno);
		
		String url = "redirect:/prof/lec/assignment/detail";
		rttr.addFlashAttribute("from", "remove");
		return url;
	}
	
	@GetMapping("/assignment/modifyForm")
	public ModelAndView assignmentModify(ModelAndView mnv,AssignmentVO vo) throws SQLException {
		String url = "prof/lec/assignmentModifyForm";
		
		AssignmentVO detail = assignmentService.getDetail(vo);
		mnv.addObject("detail",detail);
		mnv.setViewName(url);
		return mnv;
	}
	
	@Autowired
	private AssignmentEvalService assignmnetEvalService;
	
	@GetMapping("/assignment/eval/list")
	public String assignmentEvalList(MyLecAssignmentVO vo,Model model) throws SQLException {
		String url = "prof/lec/assignmentEvalList";
		List<MyLecAssignmentVO> evalStuList = assignmnetEvalService.getLecStuListByLecCdAssBno(vo);
		model.addAttribute("evalStuList", evalStuList);
		return url;
	}
	
	@GetMapping("/assignment/eval/detail")
	public ResponseEntity<MyLecAssignmentVO> assignmentEvalDetail(MyLecAssignmentVO vo) throws SQLException {
		
		MyLecAssignmentVO stuAssDetail = assignmnetEvalService.getStuAssDetail(vo);
		log.debug("과제과제과제" + stuAssDetail);
		ResponseEntity<MyLecAssignmentVO> entity = new ResponseEntity<MyLecAssignmentVO>(stuAssDetail,HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/assignment/eval/modify")
	public ResponseEntity<MyLecAssignmentVO> assignmentEvalModify(MyLecAssignmentVO vo,ModelAndView mnv) throws SQLException {
		
		assignmnetEvalService.modifyAssignment(vo);
		
		
		ResponseEntity<MyLecAssignmentVO> entity = new ResponseEntity<MyLecAssignmentVO>(vo,HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/attend/list")
	public String attendList(String lecCd, HttpServletRequest request) throws SQLException{
		String url = "prof/lec/attendList";
		
		request.setAttribute("lecCd", lecCd);
		return url;
	}
	
	@GetMapping(value="/attend/attendList",produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<AttendVO> getAttendList(String lecCd,Date attendDate, HttpServletRequest request) throws SQLException{
		
		HttpSession session = request.getSession();
		SemesterVO semester = (SemesterVO)session.getAttribute("semester");
		String semeCd = semester.getSemeCd();
		
		AttendVO attend = new AttendVO();
		attend.setLecCd(lecCd);
		attend.setSemeCd(semeCd);
		attend.setAttendDate(attendDate);
		
		log.debug("컨트롤러 어텐드확인"+attend);
		List<AttendVO> attendList = lecAttendService.getAttendList(attend);
		
		return attendList;
	}
	
	@GetMapping(value="/attend/stuAttendList",produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<AttendVO> getStuAttendList(AttendVO attend,HttpServletRequest request) throws SQLException{
		
		HttpSession session = request.getSession();
		SemesterVO semester = (SemesterVO)session.getAttribute("semester");
		String semeCd = semester.getSemeCd();
		Date semeStartDate = semester.getSemeStartDate();
		
		attend.setSemeCd(semeCd);
		
		List<AttendVO> attendList = lecAttendService.getStuAttendList(attend);
		for(AttendVO vo : attendList) {
			int semeWeek = SemesterServiceImpl.getCurrentSemeWeek(semeStartDate,vo.getAttendDate());
			vo.setSemeWeek(semeWeek);
		}
		return attendList;
	}
	
	@PutMapping(value="/attend/modify", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String modifyAttend(@RequestBody AttendVO attend) throws SQLException{
		String msg = "";
		
		lecAttendService.modifyAttend(attend);
		
		return msg;
	}
	
	@PutMapping(value="/attend/modifyList", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String modifyAttendList(@RequestBody List<AttendVO> attendList) throws SQLException{
		String msg = "";
		
		for(AttendVO attend : attendList) {
			
			lecAttendService.modifyAttend(attend);
		}
		
		return msg;
	}
	
	@PostMapping("/attend/regist")
	@ResponseBody
	public String registList(@RequestBody AttendVO attend, HttpServletRequest request) throws SQLException{
		HttpSession session = request.getSession();
		SemesterVO semester = (SemesterVO)session.getAttribute("semester");
		String semeCd = semester.getSemeCd();
		
		attend.setSemeCd(semeCd);
		lecAttendService.registAttend(attend);
		
		return "성공";
	}
	
	
	@Autowired
	private MarkService markService;
	
	
	@GetMapping("/marks/list")
	public String marksList(Model model,String lecCd) {
		String url = "prof/lec/marksList";
		model.addAttribute("lecCd", lecCd);
		return url;
	}
	
	@GetMapping(value= "/marks/gradeList", produces = "application/json")
	@ResponseBody
	public ResponseEntity<List<MarkVO>> marksList(String lecCd) throws SQLException {
		String url = "prof/lec/marksList";
		List<MarkVO> markList = markService.getMarkList(lecCd);
		
		ResponseEntity<List<MarkVO>> entity = new ResponseEntity<List<MarkVO>>(markList,HttpStatus.OK);
		return entity;
	}
	
	@PostMapping(value="/marks/update",produces = "application/json")
	@ResponseBody
	public String markUpdate(@RequestBody MarkVO vo) throws SQLException {
		
		markService.modifyScore(vo);
		return "성공";
	}
	
	@GetMapping("/materials/list")
	public String materialsList(String lecCd,Model model) throws SQLException {
		String url = "prof/lec/materialsList";
		List<WeekNoticeVO> weekNoticeList = mylectureService.selectMyLecWeekNotice(lecCd);
		
		model.addAttribute("weekNoticeList",weekNoticeList);
		model.addAttribute("lecCd",lecCd);
		return url;
	}
	
	@GetMapping("/materials/registForm")
	public String materialsRegistForm(String lecCd,Model model) throws SQLException {
		String url = "prof/lec/materialsRegist";
		
		model.addAttribute("lecCd",lecCd);
		return url;
	}
	@GetMapping("/materials/modifyForm")
	public String materialsmodifyForm(WeekNoticeVO vo,Model model) throws SQLException {
		String url = "prof/lec/materialsModify";
		WeekNoticeVO detail = weekNoticeService.getMaterialDetail(vo);
		log.debug("디테일"+detail);
		model.addAttribute("detail",detail);
		model.addAttribute("lecCd",vo.getLecCd());
		return url;
	}
	
	
	@PostMapping(value="materials/regist")
	@ResponseBody
	public String materialsRegist(WeekNoticeVO vo,AttachRegistCommand registReq) throws Exception {
				
		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = null;
		if (registReq != null) {
			attachList = MultipartFileUploadResolver.fileUpload(registReq.getUploadFile(), savePath);
			vo.setAttachList(attachList);
		}
		weekNoticeService.registWeekNotice(vo);
		return "ok";
	}
	
	@PostMapping(value="materials/modify")
	@ResponseBody
	public String materialsmodify(WeekNoticeVO vo,AttachRegistCommand registReq) throws Exception {
		
		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = null;
		if (registReq != null) {
			attachList = MultipartFileUploadResolver.fileUpload(registReq.getUploadFile(), savePath);
			vo.setAttachList(attachList);
		}
		weekNoticeService.modifyWeekNotice(vo);
		return "ok";
	}
}
