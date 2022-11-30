package kr.or.ddit.controller.common;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.service.common.PortletService;
import kr.or.ddit.service.common.ScqnaService;

@Controller
@RequestMapping("/portlet2")
public class PortletController2 {
	@Autowired
	private PortletService portletService;
	
	@Autowired
	private ScqnaService scqnaService;
	
	@GetMapping("/qna")
	@ResponseBody
	public ResponseEntity<Map<String, Integer>> list(Criteria cri)throws SQLException{
		
		Map<String, Integer> dataMap = new HashMap<String, Integer>();
		
		
		int bnoCount = scqnaService.getBnoCount();
		int replyNullCount = scqnaService.getReplyNullCount();
		dataMap.put("bnoCount", bnoCount);
		dataMap.put("replyNullCount", replyNullCount);
		
		ResponseEntity<Map<String, Integer>> entity = new ResponseEntity<Map<String, Integer>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
	
	
	
}
