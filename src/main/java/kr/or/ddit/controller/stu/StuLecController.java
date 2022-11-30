package kr.or.ddit.controller.stu;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.AttachRegistCommand;
import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.controller.MultipartFileUploadResolver;
import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.EvalResVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.common.SemesterVO;
import kr.or.ddit.dto.prof.LecOpenVO;
import kr.or.ddit.dto.prof.MyLecSyllabusVO;
import kr.or.ddit.dto.prof.WeekNoticeVO;
import kr.or.ddit.dto.stu.ApplyPageVO;
import kr.or.ddit.dto.stu.AttendVO;
import kr.or.ddit.dto.stu.LecEvalItemsVO;
import kr.or.ddit.dto.stu.LecQnaVO;
import kr.or.ddit.dto.stu.LecVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.handler.LectureApplyWebSocketHandler;
import kr.or.ddit.service.common.ScoreService;
import kr.or.ddit.service.stu.lec.ApplyPageService;
import kr.or.ddit.service.stu.lec.LecOpenService;
import kr.or.ddit.service.stu.lec.LecQnaService;
import kr.or.ddit.service.stu.lec.LecService;
import kr.or.ddit.service.stu.lec.MyLecAssignmentService;
import kr.or.ddit.service.stu.lec.MyLectureService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu/lec")
public class StuLecController {

	@Autowired
	private LecOpenService lecOpenService;

	@Autowired
	private ApplyPageService applyPageService;

	@Autowired
	private LecService lecService;

	@Autowired
	private MyLecAssignmentService myLecAssginmentService;

	@Autowired
	private AttachDAO attachDAO;
	
	@RequestMapping("/hoverTest")
	public String hoverTest() {
		String url = "stu/lec/hoverTest";
		return url;
	}

	
	@RequestMapping("/slideTest")
	public String slideTest() {
		String url = "stu/lec/slideTest";
		return url;
	}


	@RequestMapping("/main.do")
	public String main() {
		String url = "stu/lec/main";
		return url;
	}

	@RequestMapping("/board/main.do")
	public String boardMain(HttpServletRequest request, Model model) throws Exception {
		String url = "stu/lec/boardListMain";
		HttpSession session = request.getSession();
		MemberVO student = (MemberVO) session.getAttribute("loginUser");
		SemesterVO semester = (SemesterVO) session.getAttribute("semester");
		String stuId = student.getMemId();
		String semeCd =semester.getSemeCd();
		LecVO lec = new LecVO();
		lec.setSemeCd(semeCd);
		lec.setStuCd(stuId);
		List<MyLectureVO> lecList = lecService.selectLecListByStuCd(lec);
		List<LecNoticeVO> boardLecNoticeList = lecService.selectBoardLecNoticeList(stuId);
		CriteriaLec cri = new CriteriaLec();
		cri.setStuCd(stuId);
		List<MyLecAssignmentVO> boardAssignList =  myLecAssginmentService.selectBoardAssignmentList(cri);
		model.addAttribute("lecList", lecList);
		model.addAttribute("boardLecNoticeList", boardLecNoticeList);
		model.addAttribute("boardAssignList", boardAssignList);
		return url;
	}

	// 서비스쪽 구현 필요.

	
	@RequestMapping("/withdrawPage")
	public String withdrawPage(Model model) throws SQLException {
		String url = "stu/lec/withdrawPage";
		List<LecVO> withdraw = lecService.selectWithdrawalList();
		
		model.addAttribute("withdraw",withdraw);
		return url;
	}
	
	@GetMapping("/update")
	public String update(LecVO lceVO, HttpServletRequest request) throws SQLException {
		String url = "redirect:stu/lec/withdrawPage";
		lecService.updateInfo(lceVO);
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		return url;
	}

	@RequestMapping("/eval/main.do")
	public String evalMain(Model model, HttpServletRequest request) throws SQLException {
		String url = "stu/lec/evalMain";
		HttpSession session = request.getSession();
		StudentVO student = (StudentVO) session.getAttribute("member");
		String stuId = student.getStuCd();
		
		List<LecVO> evalList = lecService.selectEvalList(stuId);

		model.addAttribute("evalList", evalList);
		return url;
	}

	@RequestMapping("eval/registForm.do")
	public String evalRegistForm(String lecCd, Model model) throws SQLException{
		String url = "stu/lec/evalRegistForm";
		List<LecEvalItemsVO> lecEvalItem= lecService.selectEvalFormList();
		model.addAttribute("lecCd", lecCd);
		model.addAttribute("lecEvalItem",lecEvalItem);
		return url;
	}

	// 필요한 데이터 넘어오는 거 확인함. 서비스쪽 구현 필요.
	@RequestMapping("eval/evalRegist")
	public String evalRegist(EvalResVO evalVO) {
		String url = "redirect:/stu/lec/eval/main.do";
		log.debug("evalVO : "+evalVO);
		
		
		return url;
	}

	@RequestMapping("/applyPage")
	public ModelAndView applyPage(ModelAndView mnv) throws SQLException {

		String url = "stu/lec/applyPage";
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/getLecJsonList")
	@ResponseBody
	public ResponseEntity<List<ApplyPageVO>> getLectureListJSON() throws SQLException {

		List<ApplyPageVO> lectureList = applyPageService.getLectureList();
		ResponseEntity<List<ApplyPageVO>> entity = new ResponseEntity<List<ApplyPageVO>>(lectureList, HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/getAppliedLecList")
	@ResponseBody
	public ResponseEntity<List<LecVO>> getAppliedLecList(HttpServletRequest request) throws SQLException {

		List<LecVO> appliedList = lecService.getAppliedLectureListByStuCdSemeCd(request);

		ResponseEntity<List<LecVO>> entity = new ResponseEntity<List<LecVO>>(appliedList, HttpStatus.OK);

		return entity;
	}

	@RequestMapping("/getCredits")
	@ResponseBody
	public ResponseEntity<HashMap<String, String>> getCredits(HttpSession session) throws SQLException {
		HashMap<String, String> credits = applyPageService.getCredits(session);
		ResponseEntity<HashMap<String, String>> entity = new ResponseEntity<HashMap<String, String>>(credits,
				HttpStatus.OK);

		return entity;
	}

	@PutMapping(value = "/apply", produces = "application/json;charset=utf-8")
	@ResponseBody
	public LecOpenVO apply(@RequestParam("lecCd") String lecCd, LectureApplyWebSocketHandler handler,
			HttpServletRequest request) throws SQLException, IOException {
		lecOpenService.addStuNum(lecCd);
		lecService.registLecList(request, lecCd);
		LecOpenVO lecOpenVO = lecOpenService.selectOne(lecCd);
		handler.sendLectureApplicant(lecOpenVO);
		return lecOpenVO;
	}

	@DeleteMapping(value = "/withdrwal", produces = "application/json;charset=utf-8")
	@ResponseBody
	public LecOpenVO withdrwal(@RequestParam("lecCd") String lecCd, LectureApplyWebSocketHandler handler,
			HttpServletRequest request) throws SQLException, IOException {
		lecOpenService.subtractStuNum(lecCd);
		lecService.removeLecList(request, lecCd);
		LecOpenVO lecOpenVO = lecOpenService.selectOne(lecCd);
		handler.sendLectureApplicant(lecOpenVO);
		return lecOpenVO;
	}

	// 학생 강의 게시판 작업
	@Autowired
	MyLectureService myLecService;

	
	@GetMapping("/mylecture/index")
	public String mylectureIndex(CriteriaLec cri, String lecCd, Model model, HttpServletRequest request)
			throws Exception {
		String url = "stu/lec/myLectureIndex";
		HttpSession session = request.getSession();
		SemesterVO seme = (SemesterVO)session.getAttribute("semester");
		log.debug("semeSter : "+seme);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		MyLectureVO myLecture = myLecService.selectMyLectureInfo(lecCd);
		AttendVO attendVO = new AttendVO();
		attendVO.setLecCd(lecCd);
		attendVO.setStuCd(stuCd);
		cri.setPerPageNum(5);
		cri.setStuCd(stuCd);
		List<AttendVO> attendList = myLecService.selectTotalAttendInfo(attendVO);
		Map<String, Object> dataMap = myLecService.selectLecNoticeList(cri);
		List<WeekNoticeVO> weekNoticeList = myLecService.selectMyLecWeekNotice(lecCd);
		Map<String,Object> assignMap = myLecAssginmentService.selectMyAssignmentList(cri);
		log.info("assignMap : "+assignMap);
		
		model.addAttribute("lecCd", lecCd);
		model.addAttribute("myLecture", myLecture);
		model.addAttribute("attendList", attendList);
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("seme",seme);
		model.addAttribute("weekNoticeList",weekNoticeList);
		model.addAttribute("assignMap",assignMap);
		return url;
	}

	@GetMapping("/mylecture/assign/list")
	public String myLectureAssignList(CriteriaLec cri, Model model, HttpServletRequest request) throws SQLException {
		String url = "stu/lec/myLectureAssignList";
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		String lecCd = cri.getLecCd();
		if (cri.getPerPageNum() < 20) {
			cri.setPerPageNum(20);
		}
		cri.setStuCd(stuCd);
		Map<String, Object> dataMap = myLecAssginmentService.selectMyAssignmentList(cri);
		model.addAttribute("lecCd", lecCd);
		model.addAttribute("dataMap", dataMap);
		log.debug("dataMap : "+dataMap);
		return url;
	}

	@GetMapping("/mylecture/assign/detail")
	public String myLectureAssignDetail(String lecCd, int assBno, String from, Model model,HttpServletRequest request) throws SQLException {
		String url = "stu/lec/myLectureAssignDetail";
		log.debug("lecCd : " + lecCd);
		log.debug("assBno : " + assBno);
		MyLecAssignmentVO myLecAssign;
		HttpSession session = request.getSession();
		MemberVO student = (MemberVO) session.getAttribute("loginUser");
		String stuCd = student.getMemId();
		if (from != null && from.equals("list")) {
			myLecAssign = myLecAssginmentService.selectMyAssignMentFromList(assBno);
			url = "redirect:/stu/lec/mylecture/assign/detail?assBno=" + assBno;
		} else {
			myLecAssign = myLecAssginmentService.selectMyAssignMent(assBno);
		}
		MyLecAssignmentVO assSub= new MyLecAssignmentVO();
		assSub.setAssBno(assBno);
		assSub.setLecCd(lecCd);
		assSub.setStuCd(stuCd);
		MyLecAssignmentVO myAssignSub = myLecAssginmentService.selectAssSubmit(assSub);
		
		
		log.debug("myAssignSub : "+myAssignSub);
		log.debug("myLecAssign : "+myLecAssign);
		model.addAttribute("lecCd", lecCd);
		model.addAttribute("myLecAssign", myLecAssign);
		model.addAttribute("myAssignSub", myAssignSub);
		model.addAttribute("assBno",assBno);
		return url;
	}
	@PostMapping("/mylecture/assign/delete")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> myLecAssignDelete(AttachVO attach) throws SQLException,Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		myLecAssginmentService.deleteAssSubmit(attach);
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("msg","성공");
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/mylecture/assign/submitForm")
	public String assignSubmit(Model model,String lecCd, int assBno,HttpServletRequest request) throws Exception{
		String url = "/stu/lec/myLectureAssignSubmitForm";
		MyLecAssignmentVO assSub= new MyLecAssignmentVO();
		HttpSession session = request.getSession();
		MemberVO student = (MemberVO) session.getAttribute("loginUser");
		String stuCd = student.getMemId();
		assSub.setAssBno(assBno);
		assSub.setLecCd(lecCd);
		assSub.setStuCd(stuCd);
		MyLecAssignmentVO myAssignSub = myLecAssginmentService.selectAssSubmit(assSub);
		model.addAttribute("myAssignSub", myAssignSub);
		model.addAttribute("lecCd",lecCd);
		model.addAttribute("assBno",assBno);
		return url;
	}
	
	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	@PostMapping("/mylecture/assign/regist")
	public ResponseEntity<MyLecAssignmentVO> assignRegist(MyLecAssignmentVO assSub,AttachRegistCommand registReq,HttpServletRequest request)throws Exception {
		ResponseEntity<MyLecAssignmentVO> entity = null;
		HttpSession session = request.getSession();
		StudentVO student = (StudentVO)session.getAttribute("member");
		String stuId= student.getStuCd();
		String savePath = this.fileUploadPath;
		//file 저장 -> List<AttachVO>
		List<AttachVO> attachList 
		= MultipartFileUploadResolver.fileUpload(registReq.getUploadFile(), savePath);
		assSub.setAttachList(attachList);
		assSub.setStuCd(stuId);
		log.debug("assSub : "+assSub);
		myLecAssginmentService.submitAssign(assSub);
		MyLecAssignmentVO myAssSub = myLecAssginmentService.selectAssSubmit(assSub);
		entity = new ResponseEntity<MyLecAssignmentVO>(myAssSub,HttpStatus.OK);
		return entity;
	}

	@RequestMapping("/getFile")
	public String getFile(AttachVO attach, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String url = "downloadFile";
		AttachVO attachVO = attachDAO.selectAttach(attach);

		model.addAttribute("savedPath", attachVO.getUploadpath());
		model.addAttribute("fileName", attachVO.getFilename());

		return url;
	}

	@GetMapping("/mylecture/assign/summaryPage")
	public String myLectureAssignSummaryPage(String lecCd, Model model) {
		String url = "stu/lec/myLectureAssignSummaryPage";
		model.addAttribute("lecCd", lecCd);
		return url;
	}
	
	@GetMapping("/mylecture/assign/syllabus")
	public String myLectureAssignsyllabus(String lecCd, Model model) throws Exception {
		String url = "stu/lec/myLectureAssignsyllabus";
		MyLecSyllabusVO syllabus = myLecService.selectMyLecSyllabus(lecCd);
		List<MyLecSyllabusVO> weekLearningList = myLecService.selectMyLecWeekLearning(lecCd);
		model.addAttribute("lecCd", lecCd);
		model.addAttribute("syllabus", syllabus);
		model.addAttribute("weekLearningList", weekLearningList);
		return url;
	}
	
	@GetMapping("/mylecture/syllabusWithoutTab")
	public String syllabusWithoutTab(String lecCd, Model model) throws Exception {
		String url = "stu/lec/myLectureSyllabusWithoutTab";
		MyLecSyllabusVO syllabus = myLecService.selectMyLecSyllabus(lecCd);
		List<MyLecSyllabusVO> weekLearningList = myLecService.selectMyLecWeekLearning(lecCd);
		model.addAttribute("lecCd", lecCd);
		model.addAttribute("syllabus", syllabus);
		model.addAttribute("weekLearningList", weekLearningList);
		return url;
	}
	

	@GetMapping("/mylecture/assign/pds/detail")
	public String myLectureAssignPdsDetail(String lecCd, Model model) {
		String url = "stu/lec/myLectureAssignPdsDetail";
		model.addAttribute("lecCd", lecCd);
		return url;
	}

	@GetMapping("/mylecture/assign/pds/list")
	public String myLectureAssignPdsList(String lecCd, Model model) {
		String url = "stu/lec/myLectureAssignPdsList";
		model.addAttribute("lecCd", lecCd);
		return url;
	}

	@Autowired
	private LecQnaService lecQnaService;
	
	@RequestMapping("/mylecture/assign/qna/list")
	public String myLectureAssignQnaList(CriteriaLec cri, Model model) throws SQLException {
		String url = "stu/lec/myLectureAssignQnaList";
		Map<String, Object> dataMap = lecQnaService.getLecQnaList(cri);
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("lecCd", cri.getLecCd());
		return url;
	}

	@RequestMapping("/mylecture/assign/qna/detail")
	public String myLectureAssignQnaDetail(int lecqBno, Model model) throws SQLException {
		String url = "stu/lec/myLectureAssignQnaDetail";
		
		LecQnaVO detail = lecQnaService.getLecQnaDetail(lecqBno);
		
		model.addAttribute("detail", detail);
		return url;
	}

	@RequestMapping("/mylecture/assign/qna/registForm")
	public String myLectureAssignQnaRegist(LecQnaVO vo, Model model) throws SQLException {
		String url = "stu/lec/myLectureAssignQnaRegist";
		model.addAttribute("lecCd", vo.getLecCd());
		return url;
	}
	
	@PostMapping("/mylecture/assign/qna/regist")
	@ResponseBody
	public String qnaRegist(@RequestBody LecQnaVO vo)throws Exception {
		
		
		log.debug("컨틀롤러 VO" + vo);
		lecQnaService.registLecQna(vo);
		return "OK";
	}
	
	
	@RequestMapping("/mylecture/assign/qna/delete")
	public String myLectureAssignQnadelete(String lecCd,int lecqBno, Model model) throws SQLException {
		String url = "stu/lec/myLectureAssignQnalist?lecCd="+lecCd;
		lecQnaService.removeLecQna(lecqBno);
		model.addAttribute("lecCd", lecCd);
		return url;
	}

	@RequestMapping("/changePage")
	public String changePage() {
		String url = "stu/lec/changePage";
		return url;
	}
	@Autowired
	ScoreService scoreService;

	@RequestMapping("/timetable")
	public String timetable(HttpServletRequest request, Model model) throws Exception {
		String url = "stu/lec/timetable";

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		SemesterVO seme = (SemesterVO)session.getAttribute("semester");
		String stuCd = member.getMemId();
		String semeCd = seme.getSemeCd();
		LecVO lec = new LecVO();
		lec.setStuCd(stuCd);
		lec.setSemeCd(semeCd);
		List<MyLectureVO> lecList = lecService.selectLecListByStuCd(lec);
		List<String> gradeSemesterList = scoreService.selectStuSubjGradeSeme(stuCd);
		
		model.addAttribute("lecList",lecList);
		model.addAttribute("gradeSemesterList",gradeSemesterList);
		log.debug("gradeSemesterList : "+gradeSemesterList);
		return url;
	}
	
	@RequestMapping("/timetable/changeSeme")
	@ResponseBody
	public ResponseEntity<List<MyLectureVO>> changeSeme(HttpServletRequest request, Model model,String gradeSemeCd) throws Exception {
		ResponseEntity<List<MyLectureVO>> entity=null;
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		SemesterVO seme = (SemesterVO)session.getAttribute("semester");
		String stuCd = member.getMemId();
		String semeCd = seme.getSemeCd();
		LecVO lec = new LecVO();
		lec.setStuCd(stuCd);
		lec.setSemeCd(semeCd);
		lec.setGradeSemeCd(gradeSemeCd);
		List<MyLectureVO> lecList = scoreService.selectSubScorejInfo(lec);
		entity=new ResponseEntity<List<MyLectureVO>>(lecList,HttpStatus.OK);
		return entity;
	}

}