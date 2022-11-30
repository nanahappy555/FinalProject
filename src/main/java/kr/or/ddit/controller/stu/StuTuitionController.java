package kr.or.ddit.controller.stu;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.TuitionVO;
import kr.or.ddit.service.stu.tuition.TuitionService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/stu/tuition")
public class StuTuitionController {
	
	@Autowired
	TuitionService tuitionService;

	@RequestMapping("list")
	public String list(Model model,HttpServletRequest request) throws SQLException {
		String url = "stu/tuition/list";
		
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		log.debug("학번 들어오나요?>>>>>>>>>>>>>>>>>" + stuCd);
		log.info("########## 컨트롤러 들어옴.");
		List<TuitionVO> tuitionList = tuitionService.selectStuTuitionList(stuCd);
		log.debug("컨트롤러 보세요>>>>>>>>>>>>>>>>>" + tuitionList);
		model.addAttribute("tuitionList",tuitionList);
		return url;
	}
	
	

	
}
