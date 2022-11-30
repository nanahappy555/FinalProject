package kr.or.ddit.controller.common;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dto.common.AlarmVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.service.common.AlarmService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/alarm")
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping(value="/getAlarmList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String,List<AlarmVO>>> getAlarmList(HttpServletRequest request,Model model) throws Exception{
		//알림가져오기
		ResponseEntity<Map<String,List<AlarmVO>> > entity =null;
		HttpSession session  = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		//알림Map 보내주기
		String memId=member.getMemId();
		Map<String,List<AlarmVO>>  alarmMap = alarmService.getAlarmList(memId);
		model.addAttribute("alarmMap",alarmMap);
		
		log.debug("알람리스트 :" + alarmMap);
		entity=new ResponseEntity<Map<String,List<AlarmVO>> >(alarmMap,HttpStatus.OK);
		
		//소켓
		
		
		return entity;
	}
	
	@PutMapping(value="/updateCheck", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String updateCheckAlarm(HttpServletRequest request)throws SQLException{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		alarmService.updateCheckAlarm(memId);
		
		String successMsg = "성공";
		
		return successMsg;
	}
}
