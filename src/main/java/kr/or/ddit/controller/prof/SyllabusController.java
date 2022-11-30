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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.controller.common.WeekLearningCommand;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.prof.MarksStdVO;
import kr.or.ddit.dto.prof.SyllabusVO;
import kr.or.ddit.dto.prof.WeekLearningVO;
import kr.or.ddit.dto.staff.SyllabusDetailVO;
import kr.or.ddit.service.prof.MarksStdService;
import kr.or.ddit.service.prof.SyllabusService;
import kr.or.ddit.service.prof.WeekLearningService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/prof/syllabus")
public class SyllabusController {
	
	
	@Autowired
	private SyllabusService syllabusService;
	
	@Autowired
	private WeekLearningService weekLearningService;
	
	@Autowired
	private MarksStdService marksStdService;
	
	@GetMapping("/apply/main")
	public ModelAndView main(CriteriaLec cri,ModelAndView mnv,HttpServletRequest req){
		String url="prof/syllabus/main";
		
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		cri.setProfId(memberVO.getMemId());
		
		Map<String, Object> dataMap = syllabusService.getSyllabusListByProfId(cri);
		
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/apply/detail")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getSyllabusDetail(String sylCd)throws SQLException{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		log.debug("코드" + sylCd);
		
		
		SyllabusDetailVO syllabusDetail = syllabusService.getSyllabusDetail(sylCd);
		List<WeekLearningVO> detailWeek = syllabusService.getDetailWeek(sylCd);
		
		
		log.debug("디테일" + syllabusDetail);
		log.debug("주차" + detailWeek);
		
		map.put("syllabusDetail", syllabusDetail);
		map.put("detailWeek", detailWeek);
		
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(map,HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("apply/regist")
	public String createSyllabus(RedirectAttributes rttr,HttpServletRequest request,SyllabusVO syllabusVO, WeekLearningCommand weekCommand,MarksStdVO markStdVO,String profId)throws SQLException{
		String url="redirect:/prof/syllabus/apply/main";

		List<WeekLearningVO> toWeekLearningVOList = weekCommand.ToWeekLearningVOList();

		String sylCd = syllabusService.registSyllabus(syllabusVO,request);
		
		weekLearningService.registWeekLearning(toWeekLearningVOList,sylCd);
		
		marksStdService.registMarksStd(markStdVO,sylCd);
		
		rttr.addFlashAttribute("from","apply");
		
		return url;
		
	}

	
}
