package kr.or.ddit.controller.common;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.staff.ScNoticeVO;
import kr.or.ddit.service.staff.ScNoticeService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/common/notice")
@Slf4j
public class NoticeCotroller {

	@Autowired
	private ScNoticeService scNoticeService;

	@RequestMapping("/list")
	public String list(HttpServletRequest request, Criteria cri, Model model) throws Exception {

		String url = "common/notice/list";

		Map<String, Object> dataMap = scNoticeService.getScNoticeList(cri);
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memClassCd = member.getMemClassCd();
		model.addAttribute("dataMap",dataMap);
		model.addAttribute("memClassCd",memClassCd);
		

		return url;

	}
	

	@GetMapping("/registForm")
	public String registForm(HttpServletRequest request,RedirectAttributes rttr ,Model model) throws SQLException {
		String url = "common/notice/registForm";
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		model.addAttribute("member",member);
		rttr.addFlashAttribute("from", "regist");
		return url;
	}
	
	@RequestMapping("/regist")
	public String regist(ScNoticeVO scNotice, HttpServletRequest request,
						RedirectAttributes rttr) throws Exception{
		String url ="redirect:/common/notice/list";
		
		log.info("##########scNotice content : "+scNotice.getContent());
		scNotice.setTitle(HTMLInputFilter.htmlSpecialChars(scNotice.getTitle()));
		
		scNoticeService.regist(scNotice);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;	
	}
	
	
	@RequestMapping("/modify")
	public String modifyForm(ScNoticeVO scNotice) throws Exception {
		String url ="redirect:/common/notice/detail?scNno="+scNotice.getScNno();
		log.info(""+scNotice);
		scNoticeService.modifyScNotice(scNotice);
		return url;
		
		
	}

	
	@GetMapping("/modifyForm")
	public String modifyForm(String scNno,Model model) throws SQLException {
		String url = "common/notice/modifyForm";
		ScNoticeVO scNotice=scNoticeService.selectOneScNotice(Integer.parseInt(scNno));
		model.addAttribute("scNotice",scNotice);
		return url;
	}
	

	@GetMapping("/detail")
	public String detail(HttpServletRequest request, int scNno,String from, Model model) throws SQLException {
		String url = "common/notice/detail";
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memClassCd = member.getMemClassCd();
		
		ScNoticeVO scNotice = scNoticeService.selectOneScNotice(scNno);
		model.addAttribute("scNotice",scNotice);
		model.addAttribute("memClassCd",memClassCd);
		return url;
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public String remove(int scNno, RedirectAttributes rttr) throws Exception {
		String url="redirect:/common/notice/list";
		
		scNoticeService.remove(scNno);
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("scNno",scNno);
		
		return url;
	}

}
