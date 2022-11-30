package kr.or.ddit.controller.common;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.service.common.ScheduleService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common/scSchedule")
public class ScScheduleController {
	
	@Autowired
	ScheduleService scheduleService;

	@GetMapping("/calendar")
	public String list(Model model,HttpServletRequest request) throws SQLException,Exception {
		String url="common/scSchedule/calendar";
		Map<String,Object> dataMap = scheduleService.selectScheduleById();
		log.debug("확인 : "+dataMap);
		
		ObjectMapper mapper = new ObjectMapper();
		String scheduleList =mapper.writeValueAsString(dataMap.get("scheduleListForCalendar"));
		int maxSeq = (Integer)dataMap.get("maxScheSeq");
		model.addAttribute("scheduleList",scheduleList);
		model.addAttribute("maxSeq",maxSeq);
		return url;
	}
	
	@RequestMapping("/calendar/insert")
	@ResponseBody
	public Map<String,Object> calendarInsert(@RequestBody Map<String,Object> calendarData,HttpServletRequest request) throws SQLException,Exception{
		log.debug("calendar calendarData : "+calendarData);
		Map<String,Object> dataMap = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String id = member.getMemId();
		calendarData.put("memId",id);
		scheduleService.insertCalendar(calendarData);
		dataMap.put("msg","성공");
		return dataMap;
	}
	
	@PostMapping("/calendar/update")
	@ResponseBody
	public Map<String,Object> scScheduleUpdate(@RequestBody Map<String,Object> changeData,HttpServletRequest request)throws SQLException,Exception {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String id = member.getMemId();
		changeData.put("memId",id);
		scheduleService.updateCalendar(changeData);
		
		dataMap.put("msg","성공");
		return dataMap;
	}

	
	@PostMapping("/calendar/delete")
	@ResponseBody
	public Map<String,Object> calendarDelete(String scheId) throws SQLException,Exception{
		Map<String,Object> dataMap = new HashMap<String,Object>();
		scheduleService.deleteCalendar(scheId);
		dataMap.put("msg","성공");
		return dataMap;
	}
	
	@RequestMapping("/calendar/mini")
	public String miniCalendar(Model model,HttpServletRequest request) throws SQLException,Exception {
		String url="common/scSchedule/miniCalendar";
		Map<String,Object> dataMap = scheduleService.selectScheduleById();
		log.debug("확인 : "+dataMap);
		
		ObjectMapper mapper = new ObjectMapper();
		String scheduleList =mapper.writeValueAsString(dataMap.get("scheduleListForCalendar"));
		int maxSeq = (Integer)dataMap.get("maxScheSeq");
		model.addAttribute("scheduleList",scheduleList);
		model.addAttribute("maxSeq",maxSeq);
		return url;
	}
	
	@GetMapping("/calendar/mini2")
	@ResponseBody
	public String miniCalendar2(Model model,HttpServletRequest request) throws SQLException,Exception {
		Map<String,Object> dataMap = scheduleService.selectScheduleById();
		log.debug("확인 : "+dataMap);
		
		ObjectMapper mapper = new ObjectMapper();
		String scheduleList =mapper.writeValueAsString(dataMap.get("scheduleListForCalendar"));
		int maxSeq = (Integer)dataMap.get("maxScheSeq");
//		model.addAttribute("scheduleList",scheduleList);
//		model.addAttribute("maxSeq",maxSeq);
		return scheduleList;
	}

	
	
	@GetMapping("/list")
	public String scScheduleList() {
		String url="common/scSchedule/list";
		return url;
	}

	
}
