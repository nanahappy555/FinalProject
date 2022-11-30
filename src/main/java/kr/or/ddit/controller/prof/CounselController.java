package kr.or.ddit.controller.prof;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.CriteriaCounsel;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.prof.ClassAttitudeVO;
import kr.or.ddit.dto.prof.SpecialNoteVO;
import kr.or.ddit.dto.stu.CsApplyVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.service.common.ClassroomService;
import kr.or.ddit.service.common.ScoreService;
import kr.or.ddit.service.prof.ProfCounselService;
import kr.or.ddit.service.stu.StudentService;
import kr.or.ddit.service.stu.counsel.CounselApplyService;
import lombok.extern.slf4j.Slf4j;
@Controller
@RequestMapping("/prof/counsel")
@Slf4j
public class CounselController {
	
	
	@Autowired
	private CounselApplyService counselApplyService;

	@Autowired
	private ClassroomService classroomService;
	
	@Autowired
	private ProfCounselService profCounselService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ScoreService scoreService;
	
	@GetMapping("/main")
	public String main() {
		String url="prof/counsel/main";
		return url;
	}
	
	@GetMapping("/apply/list")
	public ModelAndView applyList(HttpServletRequest request,ModelAndView mnv,CriteriaCounsel cri) throws SQLException {
		String url="prof/counsel/applyList";
		
		HttpSession session=request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String profId =member.getMemId();
		
		cri.setProfId(profId);
		
		Map<String, Object> dataMap = counselApplyService.selectCounselApplyListByProfId(cri);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("profId", profId);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/apply/detail")
	public ModelAndView applyDetail(ModelAndView mnv,int counselNo) throws SQLException {
		String url="prof/counsel/applyDetail";
		
		CsApplyVO detail = counselApplyService.getCounselDetail(counselNo);
		
		log.debug("디테일" + detail);
		
		mnv.addObject("detail",detail);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@PostMapping(value = "/apply/change")
	@ResponseBody
	public String changeStatus(@RequestBody Map<String, Object> params, HttpServletRequest request) throws SQLException{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String profCd = member.getMemId();
		String name = member.getName();
		
		counselApplyService.modifyStatus(params,profCd, name);
		
		return "ok";
	}
	
	@PostMapping(value = "/apply/changeClassroom")
	@ResponseBody
	public String changeClassroom(@RequestBody Map<String, Object> params) throws SQLException{
		
		
		counselApplyService.modfiyClassroom(params);
		
		return "ok";
	}
	@PostMapping(value = "/apply/updateCounselContent")
	@ResponseBody
	public String updateCounselContent(@RequestBody Map<String, Object> params) throws SQLException{
		
		
		counselApplyService.modifyCounselContent(params);
		
		return "ok";
	}
	
	
	
	@GetMapping("/getClassroomList")
	@ResponseBody
	public ResponseEntity<List<String>> getClassroomList()throws SQLException{
		
		
		List<String> classroomList = classroomService.getClassroomList();
		log.debug("강의실"+classroomList);
		ResponseEntity<List<String>> entitiy = new ResponseEntity<List<String>>(classroomList,HttpStatus.OK);
		return entitiy;
	}
	
	
	@GetMapping("/complete/list")
	public String completeList() {
		String url="prof/counsel/completeList";
		return url;
	}
	@GetMapping("/complete/detail")
	public String completeDetail() {
		String url="prof/counsel/completeDetail";
		return url;
	}
	
	@GetMapping("/stu/list")
	public String stuList(HttpSession session,Model model) throws SQLException {
		String url="prof/counsel/stulist";
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String profId = member.getMemId();
		List<StudentVO> stuList = profCounselService.getStuListByMajorCd(session);
		List<ClassAttitudeVO> classAttitudeList = profCounselService.selectClassAttitudeList(profId);
		log.debug("classAttitudeList : "+classAttitudeList);
		
		model.addAttribute("stuList",stuList);
		
		model.addAttribute("classAttitudeList",classAttitudeList);
		
		return url;
	}
	@RequestMapping("/stu/detail")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> stuDetail(String stuCd) throws SQLException,Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> dataMap= new HashMap<String, Object>();
		
		StudentVO student = studentService.getStudentByStuCd(stuCd);
		
		Map<String,Object> semeScoreMap = scoreService.selectStuSemeScore(stuCd);
		List<SpecialNoteVO> speicalNoteList = profCounselService.selectSpecialNoticeList(stuCd);
		log.debug("speicalNoteList"+speicalNoteList);
		dataMap.put("student",student);
		dataMap.put("label",semeScoreMap.get("label"));
		log.debug("data : "+semeScoreMap.get("data"));
		dataMap.put("data",semeScoreMap.get("data"));
		
		dataMap.put("speicalNoteList",speicalNoteList);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
	
	@RequestMapping("/stu/speDetail")
	@ResponseBody
	public ResponseEntity<SpecialNoteVO> speDetail(int specialSeq) throws SQLException,Exception{
		ResponseEntity<SpecialNoteVO> entity = null;
		SpecialNoteVO specialNote =  profCounselService.selectSpecialNotice(specialSeq);
		entity = new ResponseEntity<SpecialNoteVO>(specialNote,HttpStatus.OK);
		return entity;
	}
	@RequestMapping("/stu/speRegist")
	@ResponseBody
	public String speRegist(HttpSession session,SpecialNoteVO special) throws SQLException,Exception{
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String profId = member.getMemId();
		special.setWriter(profId);
		profCounselService.registSpecialNotice(special);
		return "성공";
	}
	
	@RequestMapping("/stu/speList")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> speList(String stuCd) throws SQLException,Exception{
		
		ResponseEntity<Map<String,Object>> entity =null;
		List<SpecialNoteVO> speicalNoteList = profCounselService.selectSpecialNoticeList(stuCd);
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("speicalNoteList",speicalNoteList);
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
	
}
