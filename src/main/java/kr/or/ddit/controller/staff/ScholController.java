package kr.or.ddit.controller.staff;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.service.staff.ScholApplyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/staff/schol")
public class ScholController {
	
	@Autowired
	private ScholApplyService scholApplyService;
	
	@GetMapping("/list")
	public ModelAndView schoApplyList(Criteria cri,ModelAndView mnv)throws SQLException {
		String url="staff/schol/list";
		
		Map<String, Object> dataMap = scholApplyService.getList(cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@PostMapping("/applyScholList")
	public String scholApplyCheck(HttpServletRequest request,RedirectAttributes rttr,String applyStatus)throws SQLException{
		String url = "redirect:/staff/schol/list";
		String[] scholList = (String[])request.getParameterValues("scholCd");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("applyStatus", applyStatus);
		dataMap.put("scholList", scholList);
		
		scholApplyService.updateScholApply(dataMap);
		rttr.addFlashAttribute("from","apply");
		
		return url;
	}
}
 