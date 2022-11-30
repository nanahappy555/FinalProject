package kr.or.ddit.controller.common;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.AttachRegistCommand;
import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.controller.MultipartFileUploadResolver;
import kr.or.ddit.dto.common.AddressBook;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.MailVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.ScQnaVO;
import kr.or.ddit.service.common.AccountService;
import kr.or.ddit.service.common.EmailService;
import kr.or.ddit.service.common.MemberService;
import kr.or.ddit.service.common.ScqnaService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/common")
@Slf4j
public class CommonController {
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	AccountService accountService;
	
	@GetMapping("/loginForm.do")
	public String loginForm(@RequestParam(defaultValue = "") String error, 
			@ModelAttribute("retUrl") String retUrl,
			HttpServletResponse response) {
		String url = "/common/login/loginForm";
		if(error!=null && error.equals("-1")) {
			response.setStatus(302);
		}

		return url;
				
	}
	

	

	//주소록 데이터 보내기
	@RequestMapping("/addressBook")
	@ResponseBody
	public ResponseEntity<List<AddressBook>> addressBookList(HttpSession session) throws SQLException,Exception {
		ResponseEntity<List<AddressBook>> entity = null;
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		List<AddressBook> addressBookList = emailService.getAddressBookListByMemId(member);
		entity = new ResponseEntity<List<AddressBook>> (addressBookList,HttpStatus.OK);
		return entity;
	}
	
	
	


////////	아이디 비밀번호 찾기          /////////////////////////////
	
	
	
	@RequestMapping("/login/resetPwd.do")//1.비밀번호 재설정 체크 화면
	public String resetPwd(HttpServletRequest request) throws Exception {
		String url = "/common/login/resetPwd";
		return url;
	}
	
	@RequestMapping("/login/resetPwdForm.do")//3.비밀번호 재설정 화면
	public String resetPwdForm(HttpServletRequest request) throws Exception { 
		String url = "/common/login/resetPwdForm";
		return url;
	}
	
	@RequestMapping("/login/resetPwdFormBtn.do")//4.비밀번호 재설정 화면 버튼
	public String resetPwdFormBtn(HttpServletRequest request, Model model, MemberVO member,
			@RequestParam(required = true, value = "memPwd") String memPwd ) throws Exception {
		String url = "/common/login/resetPwd_success";
		member.setMemPwd(memPwd);
		accountService.updatePwd(member);
		log.debug("memId memPwd 정보 들어오나요."+ member);
		model.addAttribute("member",member);
		return url;
	}
	
	
	
	@RequestMapping("/login/resetPwdCheck.do")//2.비밀번호 재설정 확인 버튼
	public String resetPwdCheck(HttpServletRequest request, Model model, MemberVO member, RedirectAttributes rttr, 
			@RequestParam(required = true, value = "name") String name, 
		    @RequestParam(required = true, value = "phone") String phone, 
		    @RequestParam(required = true, value = "memId") String memId) throws Exception {
		String url = "";
		    
		member.setName(name);
		member.setPhone(phone);
		member.setMemId(memId);
		
		log.debug("member : "+member);
		
	    int memberSearch = accountService.selectResetPwd(member);
	    
	    if(memberSearch == 0) {
	        url = "redirect:/common/login/resetPwd.do"; //정보 불일치
	        rttr.addFlashAttribute("from", "check");
	        return url;
	    } else {
	    	url = "redirect:/common/login/resetPwdForm.do"; //정보 일치
	    	 
	    	rttr.addFlashAttribute("mem", member);
	    	return url;
	    }
		 
	}	

///////////////////////////////////////////////////////////	
	@GetMapping("/loginTimeOut")
	public String loginTimeOut(Model model) {
		String url = "security/sessionOut";
		model.addAttribute("message","세션이 만료되었습니다.\\n다시 로그인 하세요!");
		return url;
	}
	
	@GetMapping("/getCameraLogin")
	public String getCameraPage() {
		String url = "common/login/cameraLogin";
		return url;
	}
	
	
	
	@RequestMapping("/loginExpired")
	public String loginExpired(Model model)throws Exception{
		String url = "security/sessionOut";
		model.addAttribute("message","다른 장치에서 중복 로그인이 감지되어 로그아웃합니다.\\n다시 로그인 하세요!");
		return url;
	}


	@Autowired
	private ScqnaService scqnaService;
	@GetMapping("/scqna/list.do")
		   public ModelAndView list(Criteria cri,ModelAndView mnv) throws SQLException {
		      String url = "common/scqna/qnaList";
		      
		      Map<String, Object> dataMap = scqnaService.getScqnaList(cri);
		      
		      mnv.addObject("dataMap",dataMap);
		      mnv.setViewName(url);
		      
		      return mnv;
		   }
		   

	
	@GetMapping("/scqna/detail")
	public ModelAndView scqnaDetail(int scqBno,HttpServletRequest request,ModelAndView mnv)throws SQLException{
		String url="common/scqna/qnaDetail";
		ScQnaVO scqnaDetail = scqnaService.getSelectScqnaDetail(scqBno);

		HttpSession session=request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String memId =member.getMemId();
		String memClassCd = member.getMemClassCd();
		
		
		mnv.addObject("scqnaDetail",scqnaDetail);
		mnv.addObject("memId", memId);
		mnv.addObject("memClassCd",memClassCd);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/scqna/registReply")
	public String registReply(ScQnaVO vo)throws SQLException{
		String url = "redirect:/common/scqna/detail?scqBno="+vo.getScqBno();
		scqnaService.registReply(vo);
		
		return url;
	}
	
	@PostMapping("/scqna/modifyReply")
	public String modifyReply(ScQnaVO vo)throws SQLException{
		String url = "redirect:/common/scqna/detail?scqBno="+vo.getScqBno();
		scqnaService.modifyReply(vo);
		
		return url;
	}
	
	
	
	@GetMapping("/scqna/registForm")
	public String scqnaRegist(HttpServletRequest request,Model model){
		String url="common/scqna/qnaRegist";
		HttpSession session=request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String memId =member.getMemId();
		log.info("memId"+memId);
		model.addAttribute("memId",memId);
		return url;
	}
	
	@PostMapping("/scqna/regist")
	public String regist(ScQnaVO scQna, RedirectAttributes rttr) throws SQLException {
		String url = "redirect:/common/scqna/list.do";	
		scqnaService.regist(scQna);
		rttr.addFlashAttribute("from","regist");
		
		return url;
	}
	
	
	@GetMapping("/scqna/delete")
	public String delete(int scqBno,RedirectAttributes rttr)throws SQLException {
		String url = "redirect:/common/scqna/list.do";
		scqnaService.removeScqna(scqBno);
		rttr.addFlashAttribute("from","delete");
		
		return url;
	}
	
	@RequestMapping("/mail/count")
	@ResponseBody
	public int mailCounting(HttpServletRequest request) throws SQLException {
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		int count = emailService.getCountMail(memId);
	
		return count;
	}
	
	
	
	@RequestMapping("/mail/received/list")
	public String maliReceivedList(CriteriaLec cri, MailVO mail, Model model, HttpServletRequest request) throws SQLException {
		String url = "common/mail/receiveMail";
		
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		int count = emailService.getCountMail(memId);
		cri.setPerPageNum(10);
		cri.setReceiverId(memId);
		cri.setMemId(memId);
		emailService.updateReceiveToBin(mail);
		Map<String, Object> dataMap = emailService.selectReceiveList(cri);
		
		
		model.addAttribute("count", count);
		model.addAttribute("dataMap",dataMap);
		return url;
	}

	@GetMapping("/mail/sent/list")
	public String maliSentList(CriteriaLec cri, MailVO mail, Model model, HttpServletRequest request) throws SQLException {
		String url = "common/mail/sentMail";
		
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		int count = emailService.getCountMail(memId);
		cri.setPerPageNum(10);
		cri.setSenderId(memId);
		cri.setMemId(memId);
		Map<String, Object> dataMap = emailService.selectSendList(cri);
		
		model.addAttribute("count", count);
		model.addAttribute("dataMap",dataMap);
		return url;
	}
	@PostMapping("/receive/moveBin")
	@ResponseBody
	public void receiveMailMoveBin(Model model, MailVO mail, HttpServletRequest request, @RequestBody ArrayList<String> mailList) throws SQLException {
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		for(int i =0; i<mailList.size(); i++) {
			System.out.println(mailList.get(i));
			log.debug("number ");
			mail.setNoteSeq(Integer.parseInt(mailList.get(i)));
			mail.setMemId(memId);
			emailService.updateReceiveToBin(mail); 
		}
		model.addAttribute(mail);
		model.addAttribute(mailList);
		log.debug("mailList====================="+mailList);
	}
	
	@PostMapping("/sent/moveBin")
	@ResponseBody
	public void sentMailMoveBin(Model model, MailVO mail, HttpServletRequest request, @RequestBody ArrayList<String> mailList) throws SQLException {
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		for(int i =0; i<mailList.size(); i++) {
			System.out.println(mailList.get(i));
			log.debug("number ");
			mail.setSentNoteSeq(Integer.parseInt(mailList.get(i)));
			mail.setMemId(memId);
			emailService.updateSentToBin(mail); 
		}
		model.addAttribute(mail);
		model.addAttribute(mailList);
		log.debug("mailList====================="+mailList);
	}
	
	@PostMapping("/returnReseive")
	@ResponseBody
	public void receiveMailMoveOutBin
	(Model model, MailVO mail, HttpServletRequest request, @RequestBody ArrayList<String> mailList) throws SQLException {
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		for(int i =0; i<mailList.size(); i++) {
			System.out.println(mailList.get(i));
			log.debug("number ");
			mail.setNoteSeq(Integer.parseInt(mailList.get(i)));
			mail.setMemId(memId);
			emailService.updateReturnReceive(mail); 
		}
		model.addAttribute(mail);
		model.addAttribute(mailList);
		log.debug("mailList====================="+mailList);
	}
	
	@PostMapping("/returnSent")
	@ResponseBody
	public void sentMailMoveOutBin
	(Model model, MailVO mail, HttpServletRequest request, @RequestBody ArrayList<String> mailList) throws SQLException {
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		for(int i =0; i< mailList.size(); i++) {
			System.out.println(mailList.get(i));
			log.debug("number ");
			mail.setSentNoteSeq(Integer.parseInt(mailList.get(i)));
			mail.setMemId(memId);
			emailService.updateReturnSent(mail); 
		}
		model.addAttribute(mail);
		model.addAttribute(mailList);
		log.debug("mailList====================="+mailList);
	}

	
	@RequestMapping("/mail/detail")
	public String mailDetail(Model model, HttpServletRequest request, int noteSeq, MailVO mail) throws SQLException {
		String url = "common/mail/mailDetail";
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		emailService.updateReadCheck(mail);
		
		int count = emailService.getCountMail(memId);
		
		
		
		MailVO detail = emailService.selectMailDetail(noteSeq);
		
		
		
		model.addAttribute("detail",detail);
		log.debug("디테일 들어오나요?>>>>>>>>>>>>>>>>>" + detail);
		model.addAttribute("recvChk",mail);
		
		model.addAttribute("noteSeq",noteSeq);
		
		model.addAttribute("count", count);
		
		return url;
	} 
	
	@RequestMapping("/mail/sentDetail")
	public String sentDetail(Model model, HttpServletRequest request,int sentNoteSeq, MailVO mail) throws SQLException {
		String url = "common/mail/sentMailDetail";
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		emailService.updateReadCheck(mail);
		
		int count = emailService.getCountMail(memId);
		
		log.debug("null2{}"+ sentNoteSeq);
		
		MailVO detail = emailService.selectSentMailDetail(sentNoteSeq);
		
		log.debug("null3:"+detail);
		
		model.addAttribute("detail",detail);
		log.debug("디테일 들어오나요?>>>>>>>>>>>>>>>>>" + detail);
		model.addAttribute("recvChk",mail);

		model.addAttribute("sentNoteSeq",sentNoteSeq);
		
		model.addAttribute("count", count);
		
		return url;
	} 

	
	@RequestMapping("/mail/sendForm")
	public String sendForm(Model model, HttpServletRequest request) throws SQLException {
		String url = "common/mail/sendForm";
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		int count = emailService.getCountMail(memId);
		
		CriteriaLec cri = new CriteriaLec();
		cri.setMemId(memId);
		Map<String, Object> dataMap = emailService.selectReceiveList(cri);
		model.addAttribute("dataMap",dataMap);
		model.addAttribute("count", count);
		return url;
	}
	
	@Resource(name = "fileUploadPath") //-------@1
	private String fileUploadPath;
	
	@PostMapping("/send")
	@ResponseBody
	public String send(MailVO mail,	String receiverIdList, HttpServletRequest request, RedirectAttributes rttr, AttachRegistCommand registReq) throws Exception {
		String msg = "성공";
		log.debug("mailVO : "+mail);
		HttpSession session  = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memId=member.getMemId();
		
		String savePath = this.fileUploadPath;
		//file 저장 -> List<AttachVO>
		List<AttachVO> attachList //----------------------------------------@3
		= MultipartFileUploadResolver.fileUpload(registReq.getUploadFile(), savePath);
		
		String[] receiverIdArray = receiverIdList.split(",");
		log.debug("배열 : "+receiverIdArray);
		
		String content = mail.getContent();
		String title = mail.getTitle();
		
		for(String receiverId:receiverIdArray) {
			MailVO v_mail = new MailVO();
			v_mail.setContent(content);
			v_mail.setTitle(title);
			v_mail.setReceiverId(receiverId);
			v_mail.setAttachList(attachList);
			v_mail.setSenderId(memId); 
			emailService.insertMailInfo(v_mail);
		}
		
		
		log.debug("학번 들어오나요?>>>>>>>>>>>>>>>>>" + mail);
		
		
		
//		rttr.addFlashAttribute("from", "send");
		
		
		return msg;
	}
	
	///간편 쪽지 보내기
	@RequestMapping("/noteSend")
	public String noteSend(String receiverId, Model model) {
		String url="common/mail/simpleNoteSend";
		model.addAttribute("receiverId",receiverId);
		return url;
	}
	
	@RequestMapping("/sendSimpleNote")
	public String sendSimpleNote(HttpSession session, MailVO mail, HttpServletRequest request, RedirectAttributes rttr) throws SQLException,Exception {
		String url = "redirect:/common/noteSend";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		mail.setSenderId(memId);
		emailService.insertMailInfo(mail);
		rttr.addFlashAttribute("from","regist");
		return url;
	}
	
	@RequestMapping("/mail/bin/list")
	public String binList(Model model, HttpServletRequest request) throws SQLException {
		String url = "common/mail/binList";
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		
		log.debug("학번 들어오나요?>>>>>>>>>>>>>>>>>" + memId);
		log.info("########## 컨트롤러 들어옴.");
		
		int count = emailService.getCountMail(memId);
		
		Map<String, List<MailVO>> binList = emailService.selectBinList(memId);
		
		log.debug("컨트롤러 보세요>>>>>>>>>>>>>>>>>" + binList);
		model.addAttribute("count", count);
		model.addAttribute("binList", binList);
		return url;
	}

	
	
}
