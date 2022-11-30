package kr.or.ddit.controller.stu;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.SemesterVO;
import kr.or.ddit.dto.stu.ScholApplyVO;
import kr.or.ddit.dto.stu.ScholManageVO;
import kr.or.ddit.dto.stu.StuScholApplyListVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.service.stu.schol.ManageService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/stu/schol")
public class StuScholController {
	
	@Autowired
	public ManageService manageService;
	
	@RequestMapping("list")
	public String list(Model model) throws SQLException {
		String url = "stu/schol/list";
		
		List<ScholManageVO> manageList = manageService.selectManageList();
		model.addAttribute("manageList",manageList);
		log.debug("여기 보세요>>>>>>>>>>>>>>>>>" + manageList);
		return url;
	}
	
	@RequestMapping("registForm")
	public String registForm(Model model,HttpServletRequest request,String scholCd) throws SQLException {
		String url = "stu/schol/registForm";
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		StudentVO stuInfo = manageService.selectManageRegistList(stuCd);
		model.addAttribute("stuInfo",stuInfo);
		model.addAttribute("scholCd",scholCd);
		
		return url;
	}
	@RequestMapping("apply")
	public String apply(ScholApplyVO scholApply, HttpServletRequest request,
		RedirectAttributes rttr) throws SQLException {
		String url = "stu/schol/apply_success";
		log.debug("scholApply확인"+scholApply);
		log.debug("getScholCd-----------------------======" + scholApply.getScholCd());
		HttpSession session=request.getSession();
		SemesterVO semester = (SemesterVO) session.getAttribute("semester");
		log.debug("Semester데이터"+(SemesterVO)session.getAttribute("semester"));
		String semeCd = semester.getSemeCd();
		
		StudentVO student = (StudentVO)session.getAttribute("member");
		log.debug("서비스에 들어오는 세션 student정보"+student);
		String stuId= student.getStuCd();
		log.info("########## 컨트롤러 들어옴.");
		
		scholApply.setStuId(stuId);
		scholApply.setSemeCd(semeCd);
		manageService.insertInfo(scholApply);
		rttr.addFlashAttribute("from", "apply");
		
		return url;
	}
	
	@RequestMapping("/applyList")
	public String applyList(Model model, HttpServletRequest request) throws SQLException{
		String url = "stu/schol/applyList";
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		List<StuScholApplyListVO> applyInfo = manageService.selectApplyInfo(stuCd);
		
		
		/* log.debug("학번 들어오나요?>>>>>>>>>>>>>>>>>" + stuCd); */
		model.addAttribute("applyInfo",applyInfo);
		/* log.debug("여기 보세요>>>>>>>>>>>>>>>>>" + applyInfo); */
		return url;
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public String delete(ScholApplyVO scholApply, HttpServletRequest request) throws SQLException {
//		String url = "redirect:stu/schol/applyList";
		String url = "성공";
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		scholApply.setStuId(stuCd);
		log.debug("학번 들어오나요?>>>>>>>>>>>>>>>>>" + stuCd);
		log.debug("여기 보세요>>>>>>>>>>>>>>>>>" + scholApply);
		
		manageService.deleteInfo(scholApply);
		
		return url;
	}
	

	
}
