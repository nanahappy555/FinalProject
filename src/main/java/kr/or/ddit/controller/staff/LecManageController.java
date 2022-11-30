package kr.or.ddit.controller.staff;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.prof.SyllabusVO;
import kr.or.ddit.dto.prof.WeekLearningVO;
import kr.or.ddit.dto.staff.SyllabusDetailVO;
import kr.or.ddit.service.prof.SyllabusService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/staff/lecManage")
public class LecManageController {

	@Autowired
	private SyllabusService syllabusService;

	@GetMapping("/applyList.do")
	public ModelAndView list(Criteria cri, ModelAndView mnv) throws SQLException {
		String url = "staff/lecManage/applyList";
		
		Map<String, Object> dataMap = syllabusService.getSyllabusManegeList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;

	}
	
	@PostMapping(value="/syllaListStatus", consumes="application/json; charset=utf-8")
	@ResponseBody
	public String syllaListChangeStatus(@RequestBody Map<String, Object> param)throws SQLException{

		
		
		syllabusService.updateSyllabusStatus(param);
		
		return "yees";
	}

	@GetMapping("/list.do")
	public String lecManageList() {
		String url = "staff/lecManage/applyList";
		return url;
	}

	@GetMapping("/applyDetail.do")
	public ModelAndView applyDetail(String sylCd,ModelAndView mnv)throws SQLException {
		String url = "staff/lecManage/applyDetail";
		SyllabusDetailVO syllaDetail = syllabusService.getSyllabusDetail(sylCd);
		List<WeekLearningVO> WeekDetail = syllabusService.getDetailWeek(sylCd);
			
		mnv.addObject("syllaDetail",syllaDetail);
		mnv.addObject("WeekDetail",WeekDetail);
		mnv.setViewName(url);
		
		
		return mnv;

	}
	
//	@PostMapping("/applyDetail/rejReason")
//	public void disapproveReason(SyllabusVO vo)throws SQLException{
//		syllabusService.updateRejReason(vo);
//		
//	}
	
	
	
	@PostMapping(value="/changeStatus", consumes="application/json; charset=utf-8")
	@ResponseBody
	public String changeDetailStatus(@RequestBody SyllabusVO sylla)throws SQLException{
		log.debug("승인반려상태임"+sylla.toString());
		
		
		syllabusService.updateSyllabusDetailStatus(sylla);
		
		
		return "yes";
		
	}
	
	@PostMapping("/applySyllabus")
	public String syllabusApplyCheck(HttpServletRequest requst,String applyStatus)throws SQLException{
		String url = "redirect:/staff/lecManage/applyList.do";
		String[] syllabusList = (String[])requst.getParameterValues("sListCd");
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("applyStatus", applyStatus);
		dataMap.put("syllabusList", syllabusList);
		
		syllabusService.updateSyllabusStatus(dataMap);
		
		
		
		return url;
	}

}
