package kr.or.ddit.controller.stu;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.CounselProfListVO;
import kr.or.ddit.dto.stu.CsApplyVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.service.stu.counsel.CounselApplyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu/counsel")
public class StuCounselController {

	
	@Autowired
	private CounselApplyService counselApplyService;
	
	@RequestMapping("list.do")
	public ModelAndView list(CsApplyVO csApply, ModelAndView mnv, HttpServletRequest request) throws SQLException{
		String url = "stu/counsel/list";
		
		HttpSession session  = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memId=member.getMemId();
		
		csApply.setStuId(memId);
		System.out.println(memId);
		
		csApply.setProfId(csApply.getProfId());
		log.debug("학번 들어오나요?>>>>>>>>>>>>>>>>>" + memId);
		log.info("########## 컨트롤러 들어옴.");

		List<CsApplyVO> applyList = counselApplyService.selectCounselApplyList(csApply);
		log.debug("체크" + applyList);
		
		mnv.addObject("applyList", applyList);

		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("applyMain.do")
	public String applyMain(HttpServletRequest request, Model model, CsApplyVO csApply) throws SQLException {
		String url = "stu/counsel/applyMain";
		
		HttpSession session = request.getSession();
		StudentVO student =(StudentVO) session.getAttribute("member");
		String stuId=student.getStuCd();
		
		csApply.setStuId(stuId);
		csApply.setProfId(csApply.getProfId());
		
		List<CounselProfListVO> profList = counselApplyService.selectCounselProfList(stuId);
		List<CsApplyVO> applyList = counselApplyService.selectCounselApplyList(csApply);
	
		model.addAttribute("profList", profList);
		model.addAttribute("applyList", applyList);
		
		return url;
	}
	
	@RequestMapping("registForm")
	public String registForm(String profCd, Model model) throws SQLException {
		String url = "stu/counsel/registForm";
		
		CounselProfListVO prof = counselApplyService.selectCounselProfInfo(profCd);
		model.addAttribute("prof", prof);
		return url;
	}
	
	@RequestMapping("/apply")
	@ResponseBody
	public String apply(CsApplyVO csApply, HttpServletRequest request, Model model) throws SQLException {
		HttpSession session  = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memId=member.getMemId();
		csApply.setStuId(memId);
		csApply.setProfId(csApply.getProfId());
		counselApplyService.insertCounselApply(csApply);
		String successMsg="success";
		return successMsg;
	}
	
}
