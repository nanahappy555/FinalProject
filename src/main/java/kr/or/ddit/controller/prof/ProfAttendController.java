package kr.or.ddit.controller.prof;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dto.common.SemesterVO;
import kr.or.ddit.dto.stu.AttendVO;
import kr.or.ddit.service.common.SemesterServiceImpl;
import kr.or.ddit.service.prof.LecAttendService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/imsi")
public class ProfAttendController {

	@Autowired
	private LecAttendService lecAttendService;
	
	
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
}
