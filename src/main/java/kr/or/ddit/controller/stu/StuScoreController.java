package kr.or.ddit.controller.stu;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.common.ScoreVO;
import kr.or.ddit.dto.stu.AttendVO;
import kr.or.ddit.dto.stu.LecVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.service.common.ScoreService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu/score")
public class StuScoreController {
	@Autowired
	ScoreService scoreService;

	@RequestMapping("/semester/list")
	public String semester(HttpServletRequest request,Model model) throws SQLException {
		String url = "stu/score/semester";
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
		log.debug(attend+" : attend");
		List<MyLecAssignmentVO> assList = scoreService.selectAssList(lec2);
		Map<String,Object> semeScoreMap = scoreService.selectStuSemeScore(stuCd);
		lec2.setGradeSemeCd(gradeSemester);
		Map<String,Object> subScoreDist =  scoreService.selectSubScoreDist(lec2);
		model.addAttribute("gradeSemesterList",gradeSemesterList);
		model.addAttribute("subjStd",subjStd);
		model.addAttribute("scoreList",scoreList);
		model.addAttribute("lecture",lecture);
		model.addAttribute("attend",attend);
		model.addAttribute("assList",assList);
		model.addAttribute("semeScoreMap",semeScoreMap);
		model.addAttribute("subScoreDist",subScoreDist);
		return url;
	}
	
	@RequestMapping("/subjectGraphdata")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> semesterGraphdata(LecVO lec, HttpServletRequest request) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		HttpSession session = request.getSession();
		MemberVO student = (MemberVO)session.getAttribute("loginUser");
		String stuCd = student.getMemId();
		lec.setStuCd(stuCd);
		Map<String,Object> subScoreDist = scoreService.selectSubScoreDist(lec);
		entity = new ResponseEntity<Map<String,Object>>(subScoreDist,HttpStatus.OK);
		return entity;
	}
	@RequestMapping("/subjectInfoList")
	@ResponseBody
	public ResponseEntity<List<MyLectureVO>> subjectInfoList(LecVO lec, HttpServletRequest request) throws Exception{
		ResponseEntity<List<MyLectureVO>> entity = null;
		HttpSession session = request.getSession();
		MemberVO student = (MemberVO)session.getAttribute("loginUser");
		String stuCd = student.getMemId();
		lec.setStuCd(stuCd);
		List<MyLectureVO>  subjScoreInfo= scoreService.selectSubScorejInfo(lec);
		entity = new ResponseEntity<List<MyLectureVO>>(subjScoreInfo,HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/subStd")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> subStd(LecVO lec, HttpServletRequest request) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		HttpSession session = request.getSession();
		MemberVO student = (MemberVO)session.getAttribute("loginUser");
		String stuCd = student.getMemId();
		lec.setStuCd(stuCd);
		ScoreVO  subjStd= scoreService.selectSubjScoreStd(lec);
		LecVO lecture = scoreService.selectLecInfo(lec);
		Map<String,Object> subjStdScoreMap = new HashMap<String,Object>();
		subjStdScoreMap.put("subjStd",subjStd);
		subjStdScoreMap.put("lecture",lecture);
		entity = new ResponseEntity<Map<String,Object>>(subjStdScoreMap,HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/changeAttend")
	@ResponseBody
	public ResponseEntity<AttendVO> changeAttend(LecVO lec, HttpServletRequest request) throws Exception{
		ResponseEntity<AttendVO> entity = null;
		HttpSession session = request.getSession();
		MemberVO student = (MemberVO)session.getAttribute("loginUser");
		String stuCd = student.getMemId();
		lec.setStuCd(stuCd);
		AttendVO  subjStd= scoreService.selectAttendScore(lec);
		entity = new ResponseEntity<AttendVO>(subjStd,HttpStatus.OK);
		return entity;
	}
	
	
	@RequestMapping("/changeAssList")
	@ResponseBody
	public ResponseEntity<List<MyLecAssignmentVO> > changeSubScore(LecVO lec, HttpServletRequest request) throws Exception{
		ResponseEntity<List<MyLecAssignmentVO> > entity = null;
		HttpSession session = request.getSession();
		MemberVO student = (MemberVO)session.getAttribute("loginUser");
		String stuCd = student.getMemId();
		lec.setStuCd(stuCd);
		List<MyLecAssignmentVO> assList= scoreService.selectAssList(lec);
		entity = new ResponseEntity<List<MyLecAssignmentVO> >(assList,HttpStatus.OK);
		return entity;
	}
	
	
	@RequestMapping("/subjectInfo")
	@ResponseBody
	public ResponseEntity<LecVO > subjectInfo(LecVO lec, HttpServletRequest request) throws Exception{
		ResponseEntity<LecVO > entity = null;
		HttpSession session = request.getSession();
		MemberVO student = (MemberVO)session.getAttribute("loginUser");
		String stuCd = student.getMemId();
		lec.setStuCd(stuCd);
		LecVO lecture = scoreService.selectLecInfo(lec);
		entity = new ResponseEntity<LecVO>(lecture,HttpStatus.OK);
		return entity;
	}
	
	
	@RequestMapping("/total/list")
	public String total() {
		String url = "stu/score/total";
		return url;
	}

	
}
