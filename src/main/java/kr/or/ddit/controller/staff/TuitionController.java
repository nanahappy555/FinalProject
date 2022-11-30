package kr.or.ddit.controller.staff;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.dto.staff.StaffTuitionVO;
import kr.or.ddit.service.staff.StaffTuitionService;




@Controller
@RequestMapping("/staff/tuition")
public class TuitionController {

@Autowired
private StaffTuitionService staffTuitionService;
	
	@GetMapping("/list")
	public String tuitionList(Model model) throws SQLException {
		String url="staff/tuition/payList";
		
		List<StaffTuitionVO> stList = staffTuitionService.selectStaffTuitionList();
		
		model.addAttribute("stList",stList);
		
		return url;
	}
	
	/*
	 * @GetMapping("/list") public String tuitionList(Model model) throws Exception{
	 * String url="staff/tuition/payList2";
	 * 
	 * List<StaffTuitionVO> stList = staffTuitionService.selectStaffTuitionList();
	 * 
	 * model.addAttribute("stList",stList); return url; }
	 */
	
	
}
