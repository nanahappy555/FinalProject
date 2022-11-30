package kr.or.ddit.controller.common;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.common.PortletListVO;
import kr.or.ddit.dto.common.PortletVO;
import kr.or.ddit.dto.common.ScoreVO;
import kr.or.ddit.dto.common.SemesterVO;
import kr.or.ddit.dto.prof.LecOpenVO;
import kr.or.ddit.dto.prof.ProfVO;
import kr.or.ddit.dto.staff.StaffVO;
import kr.or.ddit.dto.stu.AttendVO;
import kr.or.ddit.dto.stu.LecVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import kr.or.ddit.dto.stu.StuColMajor;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.service.common.PortletService;
import kr.or.ddit.service.common.ScoreService;
import kr.or.ddit.service.common.ScqnaService;
import kr.or.ddit.service.prof.LectureListForProfService;
import kr.or.ddit.service.prof.ProfInfoService;
import kr.or.ddit.service.staff.ScNoticeService;
import kr.or.ddit.service.staff.StaffInfoService;
import kr.or.ddit.service.stu.InfoService;
import kr.or.ddit.service.stu.lec.LecService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/portlet")
public class PortletController {

	@Autowired
	private PortletService portletService;
	
	@Autowired
	private InfoService infoService;
	
	@Autowired
	private ProfInfoService profInfoService;
	
	@Autowired
	private StaffInfoService staffInfoService;
	
	@Autowired
	private ScNoticeService scNoticeService;
	
	@Autowired
	private LectureListForProfService lectureListForProfService;
	
	@Autowired
	private ScoreService scoreService;
	
	@Autowired
	private LecService lecService;
	
	@Autowired
	private ScqnaService scqnaService;
	
	@GetMapping("/list")
	@ResponseBody
	public Map<String, Object> getWidgetList(HttpServletRequest request) throws SQLException{
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memId = member.getMemId();
		String memClassCd = member.getMemClassCd();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		//기본위젯List
		List<PortletListVO> allPoList = portletService.getAllWidgetList(memClassCd);
		dataMap.put("allPoList", allPoList);
		//사용중인
		List<PortletVO> poList = portletService.getWidgetList(memId);
		dataMap.put("poList", poList);
		
		return dataMap;
	}
	
	@PostMapping("/save")
	@ResponseBody
	public String saveWidgetList(@RequestBody List<PortletVO> poList, HttpServletRequest request)throws SQLException{
		String msg = "성공";
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memId = member.getMemId();
		String memClassCd = member.getMemClassCd();
		
		int count = portletService.getTotalCountWidgetList(memId);
		if(count == 0) {
			//전체목록 insert
			portletService.saveWidgetNewUser(memId,memClassCd,poList);
			
		}else {
			portletService.saveWidgetExistingUser(memId,memClassCd,poList);
			
		}
		
		
		return msg;
	}
	
	@GetMapping("/profile")
	@ResponseBody
	public Map<String, Object> getInitWidgetList(HttpServletRequest request) throws SQLException{
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memId = member.getMemId();
		String userClass = member.getMemClassCd();
		if(userClass.equals("prof")) {
			ProfVO prof = profInfoService.getColNameMajorNameByProfCd(memId);
			String colName = prof.getColName();
			String majorName = prof.getMajorName();
			String profPosiCd = prof.getProfPosiCd();
			String anoCd = prof.getAnoCd();
//			log.debug("파일번호"+anoCd);
			dataMap.put("colName", colName);
			dataMap.put("majorName", majorName);
			dataMap.put("profPosiCd", profPosiCd);
			dataMap.put("anoCd", anoCd);
		}else if(userClass.equals("stu")) {
			StuColMajor stuColMajor =infoService.getStuColMajorInfo(memId);
			StudentVO student = infoService.getInfo(memId);
			String colName = stuColMajor.getColName();
			String major = stuColMajor.getFirMajName();
			String grade = student.getGrade();
			String acaStateCd = student.getAcaStateCd();
			
			dataMap.put("colName", colName);
			dataMap.put("major", major);
			dataMap.put("grade", grade);
			dataMap.put("acaStateCd", acaStateCd);
		}else if(userClass.equals("staff")) {
			StaffVO staff = staffInfoService.getStaffInfo(memId);
			String anoCd = staff.getAnoCd();
			dataMap.put("anoCd", anoCd);
		}
		
		
		return dataMap;
	}
	
	@GetMapping("/notice")
	@ResponseBody
	public Map<String, Object> noticeList(HttpServletRequest request) throws Exception {
		
		Criteria cri = new Criteria();
		cri.setPerPageNum(5);
		Map<String, Object> noticeMap = scNoticeService.getScNoticeList(cri);
		
		
		return noticeMap;
	}
	
	@GetMapping("/proftimetable")
	@ResponseBody
	public Map<String, Object> profTimetable(HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		SemesterVO seme = (SemesterVO)session.getAttribute("semester");
		String memId = member.getMemId();
		String semeCd = seme.getSemeCd();
		
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(100);
		Map<String, Object> lecMap = lectureListForProfService.getLectureListForProfByProfId(session, cri);
		
		
		return lecMap;
	}
	@GetMapping("/assignment")
	@ResponseBody
	public List<LecOpenVO> profAssignment(HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		SemesterVO seme = (SemesterVO)session.getAttribute("semester");
		String memId = member.getMemId();
		
		List<LecOpenVO> lecList = portletService.getLecAssSubmitStuList(memId);
		
		return lecList;
	}
	
	
	@GetMapping("/stutimetable")
	@ResponseBody
	public Map<String, Object> stuTimetable(HttpServletRequest request)throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		SemesterVO seme = (SemesterVO)session.getAttribute("semester");
		String stuCd = member.getMemId();
		String semeCd = seme.getSemeCd();
		LecVO lec = new LecVO();
		lec.setStuCd(stuCd);
		lec.setSemeCd(semeCd);
		
		Map<String, Object> lecMap = new HashMap<String, Object>();
		
		List<MyLectureVO> lectureList = lecService.selectLecListByStuCd(lec);
		List<String> gradeSemesterList = scoreService.selectStuSubjGradeSeme(stuCd);
		
		lecMap.put("lectureList",lectureList);
		lecMap.put("gradeSemesterList",gradeSemesterList);
		
		return lecMap;
	}
	
	@GetMapping("/attend")
	@ResponseBody
	public List<AttendVO> attend(HttpServletRequest request)throws SQLException{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		SemesterVO seme = (SemesterVO)session.getAttribute("semester");
		String stuCd = member.getMemId();
		String semeCd = seme.getSemeCd();
		
		AttendVO attend = new AttendVO();
		attend.setStuCd(stuCd);
		attend.setSemeCd(semeCd);
		
		List<AttendVO> attendList = portletService.getAllAttendByStuCd(attend);
		return attendList;
	}
	
	@GetMapping("/score")
	@ResponseBody
	public Map<String,Object> score(HttpServletRequest request)throws SQLException{
		
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO)session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		StudentVO student = scoreService.selectStuInfo(stuCd);
		String grade = student.getGrade();
		String stuSemester = student.getStuSemester();
		String gradeSemester = "0"+grade+"0"+stuSemester;
		LecVO lec= new LecVO();
		lec.setStuCd(stuCd);
		lec.setGradeSemeCd(gradeSemester);
		List<MyLectureVO> scoreList = scoreService.selectSubScorejInfo(lec);
		//점수 확인 용
	//	List<ScoreVO> sss = scoreService.selectSubjTotalScore(lec);
		//
		List<String> gradeSemesterList = scoreService.selectStuSubjGradeSeme(stuCd);
		String firstLecCd = scoreList.get(0).getLecCd();
		LecVO lec2= new LecVO();
		lec2.setLecCd(firstLecCd);
		lec2.setStuCd(stuCd);
		ScoreVO subjStd = scoreService.selectSubjScoreStd(lec2);
		LecVO lecture = scoreService.selectLecInfo(lec2);
		AttendVO attend = scoreService.selectAttendScore(lec2);
		List<MyLecAssignmentVO> assList = scoreService.selectAssList(lec2);
		Map<String,Object> semeScoreMap = scoreService.selectStuSemeScore(stuCd);
		lec2.setGradeSemeCd(gradeSemester);
		Map<String,Object> subScoreDist =  scoreService.selectSubScoreDist(lec2);
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("gradeSemesterList",gradeSemesterList);
		dataMap.put("subjStd",subjStd);
		dataMap.put("scoreList",scoreList);
		dataMap.put("lecture",lecture);
		dataMap.put("attend",attend);
		dataMap.put("assList",assList);
		dataMap.put("semeScoreMap",semeScoreMap);
		dataMap.put("subScoreDist",subScoreDist);
		
		return dataMap;
	}
	
	@GetMapping("/tuition")
	@ResponseBody
	public String tuition()throws SQLException{
		return "";
	}
	
	@GetMapping("/qna")
	@ResponseBody
	public ResponseEntity<Map<String, Integer>> list()throws SQLException{
		
		Map<String, Integer> dataMap = new HashMap<String, Integer>();
		
		
		int bnoCount = scqnaService.getBnoCount();
		int replyNullCount = scqnaService.getReplyNullCount();
		dataMap.put("bnoCount", bnoCount);
		dataMap.put("replyNullCount", replyNullCount);
		
		ResponseEntity<Map<String, Integer>> entity = new ResponseEntity<Map<String, Integer>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
}
