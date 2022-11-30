package kr.or.ddit.controller.stu;

import java.io.IOError;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josephoconnell.html.HTMLInputFilter;

import kr.or.ddit.command.AttachRegistCommand;
import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.SurveyCommand;
import kr.or.ddit.controller.MultipartFileUploadResolver;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.prof.LecManageVO;
import kr.or.ddit.dto.stu.RecoRepoVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.dto.stu.StudyShareVO;
import kr.or.ddit.dto.stu.SurveyVO;
import kr.or.ddit.service.stu.InfoService;
import kr.or.ddit.service.stu.StudentService;
import kr.or.ddit.service.stu.support.AiInterviewService;
import kr.or.ddit.service.stu.support.ShareService;
import kr.or.ddit.service.stu.support.SurveyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu/support")
public class StuSupportController {
	
	@Autowired
	private SurveyService surveyService;
	
	@Autowired
	private ShareService shareService;
	
	@Autowired
	private InfoService infoService;
	
	@Autowired
	private StudentService studentService;
	
	
	
	@RequestMapping("/surveyRegist")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> surveyRegist(SurveyCommand surveyCommand,HttpSession session) throws SQLException,Exception {
		ResponseEntity<Map<String,Object>> entity=null;
		log.debug("surveyCommand : "+surveyCommand);
		List<String> surveyList = surveyCommand.returnSurveyCommand();
		surveyService.registSurvey(surveyList,session);
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		List<SurveyCommand> responseList = surveyService.selectSurveyResByStuId(member.getMemId());
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("responseList", responseList);
		dataMap.put("msg","성공");
		entity = new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);
		return entity;
	}

	@RequestMapping("/mbtiPage")
	public String mbtiPage(HttpServletRequest request,Model model) throws SQLException,Exception{
		String url = "stu/support/mbtiPage";
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String stuId = member.getMemId();
		StudentVO student = infoService.getInfo(stuId);
		model.addAttribute("student",student);
		return url;
	}

	@RequestMapping("/mbtiChange")
	@ResponseBody
	public String mbtiChange(HttpServletRequest request,StudentVO stu) throws SQLException,Exception{
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String stuId = member.getMemId();
		stu.setStuCd(stuId);
		infoService.updateMbti(stu);
		return "성공";
	}

	@RequestMapping("/aiRecommend/main")
	public String aiRecommend(Model model,HttpSession session) throws Exception{
		String url = "stu/support/aiRecommendMain";
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String stuId=member.getMemId();
		StudentVO student = infoService.getInfo(stuId);
		List<SurveyVO> surveyList = surveyService.getSurvey();
		List<SurveyCommand> responseList = surveyService.selectSurveyResByStuId(stuId);
		StudentVO stuAcaInfo = studentService.selectStudentAcaInfo(stuId);
		model.addAttribute("stuAcaInfo",stuAcaInfo);
		model.addAttribute("surveyList",surveyList);
		model.addAttribute("student",student);
		model.addAttribute("responseList", responseList);
		return url;
	}

	@RequestMapping("/share")
	public String share() throws Exception {
		String url = "stu/support/share";
		
//		log.debug("================================크리테리아=======================================" + cri);
//		
//		//우수성적 (shareAllList,pageMaker)
//		Map<String,Object> shareAllMap = shareService.getShareList(cri);
//		//과목(shareLecList,pageMaker)
//		Map<String,Object> shareLecMap = shareService.getShareListByLec(cri);
//		
//		//성적추천순
//		List<StudyShareVO> recoAllList = shareService.getShareOrderByReco();
//		//과목추천순
//		List<StudyShareVO> recoLecList = shareService.getShareByLecOrderByReco();
//		
//		
//		mnv.addObject("shareAllMap", shareAllMap);
//		mnv.addObject("shareLecMap", shareLecMap);
//		mnv.addObject("recoAllList", recoAllList);
//		mnv.addObject("recoLecList", recoLecList);
//		mnv.setViewName(url);

		return url;
	}
	
	@GetMapping(value="/share/allList",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> allList(Criteria cri) throws Exception {
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		log.debug("===============겟페이지==============="+cri);
//		Criteria cri = new Criteria();
//		cri.setPage(allPage);
		//우수성적 (shareAllList,pageMaker)
		Map<String,Object> shareAllMap = shareService.getShareList(cri);
		//성적추천순
		List<StudyShareVO> recoAllList = shareService.getShareOrderByReco();
		
		listMap.put("shareAllMap", shareAllMap);
		listMap.put("recoAllList", recoAllList);
		
		return listMap;
	}
	
	@GetMapping(value="/share/lecList",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> lecList(Criteria cri) throws Exception {
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		//과목(shareLecList,pageMaker)
		Map<String,Object> shareLecMap = shareService.getShareListByLec(cri);
		//과목추천순
		List<StudyShareVO> recoLecList = shareService.getShareByLecOrderByReco();
		
		listMap.put("shareLecMap", shareLecMap);
		listMap.put("recoLecList", recoLecList);
		
		return listMap;
	}

	@GetMapping("/share/detail")
	public ModelAndView shareDetail(int shaBno, @RequestParam(defaultValue="") String from, ModelAndView mnv) throws Exception{
		String url = "stu/support/shareDetail";
		
		StudyShareVO share = null;
		if(from != null && from.equals("list")) {
			share = shareService.getShare(shaBno);
			url = "redirect:/stu/support/share/detail?shaBno="+shaBno;
		}else {
			share = shareService.getShareForModify(shaBno);
		}
		
		mnv.addObject("share",share);
		mnv.setViewName(url);

		return mnv;
	}

	@GetMapping("/share/registForm")
	public String shareRegistForm(String lecCd,Model model) throws SQLException {
		String url = "stu/support/shareRegistForm";
		
		LecManageVO vo = shareService.registForm(lecCd);
		String subjName = vo.getSubjName();
		
		model.addAttribute("lecCd",lecCd);
		model.addAttribute("subjName",subjName);
		return url;
	}
	
	@Resource(name = "fileUploadPath")
		private String fileUploadPath;
	
	@PostMapping("/share/regist")
	@ResponseBody
	public String shareRegist(StudyShareVO studyShare,
							AttachRegistCommand registReq,
							HttpServletRequest request)throws SQLException,Exception {
		log.debug("왜안들어오지");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		String savePath = this.fileUploadPath;
		
		//file저장
		List<AttachVO> attachList = MultipartFileUploadResolver.fileUpload(registReq.getUploadFile(), savePath);
		
		studyShare.setAttachList(attachList);
		studyShare.setStuCd(stuCd);
		
		//insert
		shareService.registShare(studyShare);
		
		String msg = "success";
		return msg;
	}
	
	@GetMapping("/share/modifyForm")
	public ModelAndView shareModifyForm(ModelAndView mnv, int shaBno, String lecCd) throws SQLException {
		String url = "stu/support/shareModifyForm";
		
		LecManageVO vo = shareService.registForm(lecCd);
		String subjName = vo.getSubjName();
		
		StudyShareVO share = shareService.getShareForModify(shaBno);
		
		mnv.addObject("share", share);
		mnv.addObject("subjName",subjName);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PostMapping("/share/modify")
	public ModelAndView shareModify(StudyShareVO share, ModelAndView mnv) throws SQLException {
		String url = "redirect:/stu/support/share/detail?from=modify&shaBno="+share.getShaBno();
		
		share.setTitle(HTMLInputFilter.htmlSpecialChars(share.getTitle()));
		
		shareService.modifyShare(share);
		
		mnv.addObject("shaBno", share.getShaBno());
		mnv.addObject("from", "modify");
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PutMapping(value="/share/recommend",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String shareRecommend(RecoRepoVO recoRepo, HttpServletRequest request)throws SQLException{
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		recoRepo.setStuCd(stuCd);
		recoRepo.setRecoChk("chk");
		recoRepo.setRepoChk("uchk");
		
//		log.debug("컨트롤러"+recoRepo);
		String msg = shareService.recommendShare(recoRepo);
		
		return msg;
   }
	@PutMapping(value="/share/report",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String shareReport(RecoRepoVO recoRepo, HttpServletRequest request)throws SQLException{
		HttpSession session = request.getSession();
		MemberVO member =(MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		recoRepo.setStuCd(stuCd);
		recoRepo.setRecoChk("uchk");
		recoRepo.setRepoChk("chk");
		
//		log.debug("컨트롤러"+recoRepo);
		String msg = shareService.reportShare(recoRepo);
		
		return msg;
	}
	

	@RequestMapping("/employ/main.do")
	public String employMain() {
		String url = "stu/support/employMain";
		return url;
	}
	@Autowired
	private AiInterviewService aiInterviewService;
	
	
	@GetMapping(value = "/employ/script",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String employScript(HttpServletResponse res) throws SQLException,Exception{
		res.setCharacterEncoding("utf-8");
		String scriptContent = aiInterviewService.selectScript();
		log.info("scriptContent : "+scriptContent);
		return scriptContent;
	}
	
	@RequestMapping(value ="/faceAiScript",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String StringfaceAIScript() throws SQLException,Exception{
		String scriptContent = aiInterviewService.selectFaceScript();
		return scriptContent;
	}
	
	
	/*
	@RequestMapping("/recordDownload")
	@ResponseBody
	public String recordDownload(MultipartFile file) throws Exception {
		System.out.println("파일 넘어옴.");
		System.out.println(file.getSize());
		File target = new File("C:" + File.separator + "test", "확인.avi");
		file.transferTo(target);
		//이부분은 수정이 필요하다.
		String abc = "성공";
		return abc;
	}
	*/


}
