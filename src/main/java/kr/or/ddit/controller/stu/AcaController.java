package kr.or.ddit.controller.stu;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.AttachRegistCommand;
import kr.or.ddit.command.BackApplyCommand;
import kr.or.ddit.command.stu.SearchMajorCommand;
import kr.or.ddit.controller.MultipartFileUploadResolver;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.CommCdVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.SemesterVO;
import kr.or.ddit.dto.stu.AcaStatusVO;
import kr.or.ddit.dto.stu.AcaVO;
import kr.or.ddit.dto.stu.ChangeMajorVO;
import kr.or.ddit.dto.stu.ClubVO;
import kr.or.ddit.dto.stu.CollegeVO;
import kr.or.ddit.dto.stu.MajorVO;
import kr.or.ddit.dto.stu.StuColMajor;
import kr.or.ddit.dto.stu.StuMajorVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.dto.stu.TlApplyVO;
import kr.or.ddit.service.common.MemberService;
import kr.or.ddit.service.stu.InfoService;
import kr.or.ddit.service.stu.aca.ChangeMajorService;
import kr.or.ddit.service.stu.aca.StuMajorService;
import kr.or.ddit.service.stu.aca.TlApplyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/stu/aca")
public class AcaController {

	@Autowired
	private InfoService infoService;

	@Autowired
	private TlApplyService tlApplyService;

	@Autowired
	private ChangeMajorService changeMajorService;

	@Autowired
	private StuMajorService stuMajorService;
	

	@RequestMapping("/main")
	public String main() {
		String url = "stu/aca/main";
		return url;
	}
	
	@RequestMapping("/checkInfoForm")
	public String checkInfoForm(HttpServletRequest request) {
		String url = "stu/aca/checkInfoForm";
		
		return url;
	}
	
	@RequestMapping("/checkInfo")
	public String checkInfo(RedirectAttributes rttr,MemberVO member) throws SQLException,Exception {
		String url = "redirect:/stu/aca/info";
		Boolean chkFlag = infoService.checkInfo(member);
		log.info("chkFlag : "+chkFlag);
		if(!chkFlag) {
			url="redirect:/stu/aca/checkInfoForm";
			rttr.addFlashAttribute("check","false");
		}
		log.info("url : "+url);
		return url;
	}

	@RequestMapping(value = "/majorList", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<MajorVO>> majorList(String collegeCd) throws SQLException {
		ResponseEntity<List<MajorVO>> entity = null;
		List<MajorVO> majorList = changeMajorService.selectMajorListByCollegeCd(collegeCd);
		entity = new ResponseEntity<List<MajorVO>>(majorList, HttpStatus.OK);
		return entity;
	}

	@RequestMapping(value = "/searchMajorList", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<List<ChangeMajorVO>> searchMajorList(HttpServletRequest request,
			SearchMajorCommand searchMajorCommand) throws Exception {
		log.info("collegeCd : " + searchMajorCommand.getColCd());
		log.info("majorCd : " + searchMajorCommand.getMajorCd());
		HttpSession session = request.getSession();
		SemesterVO semester = (SemesterVO) session.getAttribute("semester");
		searchMajorCommand.setSemeCd(semester.getSemeCd());
		List<ChangeMajorVO> changeMajorList = changeMajorService.selectSearchMajorList(searchMajorCommand);
		ResponseEntity<List<ChangeMajorVO>> entity = null;
		entity = new ResponseEntity<List<ChangeMajorVO>>(changeMajorList, HttpStatus.OK);
		return entity;
	}
	
	@Autowired
	MemberService memberService;
	@GetMapping("/info")
	public String info(HttpServletRequest request, Model model) throws Exception {
		String url = "stu/aca/info";
		HttpSession session = request.getSession();
		StudentVO studentVO = (StudentVO) session.getAttribute("member");
		String stuCd = studentVO.getStuCd();
		
		StudentVO student = infoService.getInfo(stuCd);
		ClubVO clubVO = stuMajorService.selectClub(stuCd);
		List<StuMajorVO> stuMajor = stuMajorService.selectStuMajorList(stuCd);
		String colName = stuMajorService.selectCollegeNameByStuCd(stuCd);
		MemberVO member = memberService.getMember(stuCd);
		List<AcaVO> acaList=infoService.selectAllAcaRecord(stuCd);
		List<ClubVO> clubList = infoService.selectClubList();
		
		log.debug("member : "+member);
		model.addAttribute("stuMajor", stuMajor);
		model.addAttribute("colName", colName);
		model.addAttribute("clubNAME", clubVO.getClubName());
		model.addAttribute("student", student);
		model.addAttribute("member", member);
		model.addAttribute("acaList", acaList);
		model.addAttribute("clubList", clubList);
		
		log.debug("컨트롤러 clubList : "+clubList);
		
		return url;
	}

	@GetMapping("/info/modifyForm")
	public String infoModifyForm(HttpServletRequest request, Model model) throws Exception {
		String url = "stu/aca/infoModifyForm";
		HttpSession session = request.getSession();
		StudentVO studentVO = (StudentVO) session.getAttribute("member");
		String stuCd = studentVO.getStuCd();
		ClubVO clubVO = stuMajorService.selectClub(stuCd);
		StudentVO student = infoService.getInfo(stuCd);
		model.addAttribute("club", clubVO.getClubName());
		model.addAttribute("student", student);

		return url;
	}
	
	@RequestMapping("/modify")
	public ResponseEntity<StudentVO> modify(StudentVO student, HttpServletRequest request, ModelAndView mnv,AttachRegistCommand reqCommand,
			RedirectAttributes rttr) throws Exception {
		
		log.debug("넘어오는 데이터 확인"+student);
		
		ResponseEntity<StudentVO> entity = null;
		HttpSession session = request.getSession();
		StudentVO studentVO = (StudentVO) session.getAttribute("member");
		String stuCd = studentVO.getStuCd();
		student.setStuCd(stuCd);
		//휴대폰 번호 수정.
		String phone = student.getPhone();
		phone = phone.replaceAll("-", "");
		student.setPhone(phone);
		String uploadPath = fileUploadPath;
		List<AttachVO> attachList = MultipartFileUploadResolver.fileUpload(reqCommand.getUploadFile(),uploadPath);
		student.setAttachList(attachList);
		infoService.modifyInfo(student);
		StudentVO stuVO = infoService.getInfo(stuCd);
		entity=new ResponseEntity<StudentVO>(stuVO,HttpStatus.OK);
		return entity;
	}

	@GetMapping("/info/account/modifyForm")
	public String infoAccountModifyForm(HttpServletRequest request,Model model) throws Exception {
		String url = "stu/aca/infoAccountModifyForm";
		
		HttpSession session = request.getSession();
		StudentVO studentVO = (StudentVO) session.getAttribute("member");
		String stuCd = studentVO.getStuCd();
		
		StudentVO student = infoService.getInfo(stuCd);
		model.addAttribute("student", student);
		return url;
	}

	@RequestMapping("/info/account/modify_success")
	public ModelAndView infoAccountModifyForm(StudentVO student, HttpServletRequest request, ModelAndView mnv,
			RedirectAttributes rttr) throws SQLException {
		String url = "redirect:/stu/aca/info";
		log.info("계좌번호 : " + student.getAccNum());
		HttpSession session = request.getSession();
		StudentVO studentVO = (StudentVO) session.getAttribute("member");
		student.setStuCd(studentVO.getStuCd());
		infoService.modifyAccount(student);
		rttr.addFlashAttribute("from", "modify");
		mnv.setViewName(url);
		return mnv;
	}

	@GetMapping("/changeMajor/main")
	public String changeMajorMain(Model model, HttpServletRequest request) throws SQLException {
		String url = "stu/aca/changeMajorMain";
		HttpSession session = request.getSession();
		StudentVO student = (StudentVO) session.getAttribute("member");
		String stuCd = student.getStuCd();
		List<CollegeVO> collegeList = changeMajorService.selectCollegeList();
		List<ChangeMajorVO> majorChangeApplyList = changeMajorService.selectMajorChangeApplyList(stuCd);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("majorChangeApplyList", majorChangeApplyList);
		return url;
	}

	@PostMapping("/changeMajor/modify")
	@ResponseBody
	public String changeMajorModify(String phone, HttpServletRequest request) throws Exception {
		String result = "success";
		HttpSession session = request.getSession();
		StudentVO student = (StudentVO) session.getAttribute("member");
		student.setPhone(phone);
		changeMajorService.updateStuPhone(student);
		return result;
	}

	@GetMapping("/changeMajor/applyPage")
	public String changeMajorPage(String colName, String majorName, Model model) {
		String url = "stu/aca/changeMajorPage";
		model.addAttribute("colName", colName);
		model.addAttribute("majorName", majorName);
		return url;
	}

	@GetMapping("/changeMajor/apply")
	public String changeMajorApply(String majorName, Model model, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/stu/aca/changeMajor/main";
		ChangeMajorVO changeMajor = new ChangeMajorVO();
		HttpSession session = request.getSession();
		SemesterVO semester = (SemesterVO) session.getAttribute("semester");
		StudentVO student = (StudentVO) session.getAttribute("member");
		changeMajor.setStuCd(student.getStuCd());
		changeMajor.setMajorName(majorName);
		changeMajor.setSemeCd(semester.getSemeCd());
		changeMajor.setApplyStatusCd("ing");
		changeMajor.setMajClassCd("1");
		Integer majChaSeq= changeMajorService.selectDuplicateOkChangeMajor(changeMajor);
		log.debug("majChaSeq : "+majChaSeq);
		log.debug("changeMajor : "+changeMajor);
		if(majChaSeq>0) {
			rttr.addFlashAttribute("dupChk","exist");
		}else {
			changeMajorService.changeMajorApply(changeMajor);
			rttr.addFlashAttribute("from", "apply");
		}
		return url;
	}
	
	@GetMapping("/changeMajor/cancel")
	public String changeMajorCancel(int majorChaSeq) throws Exception {
		String url = "redirect:/stu/aca/changeMajor/main";
		log.info("#############majorChaSeq 번호확인"+majorChaSeq);
		changeMajorService.deleteChangeMajorApply(majorChaSeq);
		return url;
	}

	@GetMapping("/tl/applyPage")
   public String tlApplyPage(Model model,HttpServletRequest request) throws Exception{
      String url = "stu/aca/tlList";
  
	  HttpSession session = request.getSession(); MemberVO member =
      (MemberVO)session.getAttribute("loginUser");
	  String stuCd = member.getMemId();
	  StudentVO student = infoService.getInfo(stuCd);
      List<TlApplyVO> tlList = tlApplyService.getTlListByStuId(stuCd);
      StuColMajor stuColMajor =infoService.getStuColMajorInfo(stuCd);
      List<CommCdVO> tlClassReasonList = tlApplyService.getTlClassReason();
      List<AcaStatusVO> backList = tlApplyService.getBackListByStuId(stuCd);
      model.addAttribute("tlList", tlList);
      model.addAttribute("student",student);
      model.addAttribute("stuColMajor",stuColMajor);
      model.addAttribute("tlClassReasonList",tlClassReasonList);
      model.addAttribute("backList",backList);
      return url;
   }
	
	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	@PostMapping("/tl/apply")
	@ResponseBody
	public ResponseEntity<Map<String,List<?>>> tlApply(TlApplyVO tlApply,HttpServletRequest request,AttachRegistCommand registReq) throws Exception{
		ResponseEntity<Map<String,List<?>>> entity = null;
		HttpSession session = request.getSession();
		StudentVO student = (StudentVO)session.getAttribute("member");
		String stuId= student.getStuCd();
		SemesterVO semester = (SemesterVO)session.getAttribute("semester");
		String semeCd = semester.getSemeCd();
		String savePath = this.fileUploadPath;		
		//file 저장 -> List<AttachVO>
		List<AttachVO> attachList 
		= MultipartFileUploadResolver.fileUpload(registReq.getUploadFile(), savePath);
		tlApply.setAttachList(attachList);
		tlApply.setStuId(stuId);
		tlApply.setSemeCd(semeCd);
		tlApplyService.insertTlApply(tlApply);
		List<TlApplyVO> tlList = tlApplyService.getTlListByStuId(stuId);
		List<AcaStatusVO> backList = tlApplyService.getBackListByStuId(stuId);
		Map<String,List<?>> dataMap = new HashMap<String,List<?>>();
		dataMap.put("tlList", tlList);
		dataMap.put("backList",backList);
		entity= new ResponseEntity<Map<String,List<?>>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/back/apply")
	@ResponseBody
	public ResponseEntity<Map<String,List<?>>> backApply(BackApplyCommand backCommand,HttpServletRequest request,AttachRegistCommand registReq) throws Exception{
		ResponseEntity<Map<String,List<?>>> entity = null;
		HttpSession session = request.getSession();
		StudentVO student = (StudentVO)session.getAttribute("member");
		String stuId= student.getStuCd();
		SemesterVO semester = (SemesterVO)session.getAttribute("semester");
		String semeCd = semester.getSemeCd();
		AcaStatusVO backVO = backCommand.backCommandToAcaStatus();
		String savePath = this.fileUploadPath;	
		List<AttachVO> attachList 
		= MultipartFileUploadResolver.fileUpload(registReq.getUploadFile(), savePath);
		backVO.setAttachList(attachList);
		backVO.setStuId(stuId);
		backVO.setSemeCd(semeCd);
		
		tlApplyService.applyBack(backVO);
		
		List<TlApplyVO> tlList = tlApplyService.getTlListByStuId(stuId);
		List<AcaStatusVO> backList = tlApplyService.getBackListByStuId(stuId);
		Map<String,List<?>> dataMap = new HashMap<String,List<?>>();
		dataMap.put("tlList", tlList);
		dataMap.put("backList",backList);
		entity= new ResponseEntity<Map<String,List<?>>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/back/cancel")
	@ResponseBody
	public  ResponseEntity<Map<String,List<?>>> backCancel(int acaChangeSeq,HttpServletRequest request) throws SQLException{
		ResponseEntity<Map<String,List<?>>> entity = null;
		HttpSession session = request.getSession();
		StudentVO student = (StudentVO)session.getAttribute("member");
		String stuId= student.getStuCd();
		
		tlApplyService.deleteBackApply(acaChangeSeq);
		
		List<TlApplyVO> tlList = tlApplyService.getTlListByStuId(stuId);
		List<AcaStatusVO> backList = tlApplyService.getBackListByStuId(stuId);
		Map<String,List<?>> dataMap = new HashMap<String,List<?>>();
		
		dataMap.put("tlList", tlList);
		dataMap.put("backList",backList);
		entity= new ResponseEntity<Map<String,List<?>>>(dataMap,HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/tl/cancel")
	@ResponseBody
	public  ResponseEntity<Map<String,List<?>>> tlCancel(int tlApplySeq,HttpServletRequest request) throws SQLException{
		ResponseEntity<Map<String,List<?>>> entity = null;
		HttpSession session = request.getSession();
		StudentVO student = (StudentVO)session.getAttribute("member");
		String stuId= student.getStuCd();
		
		tlApplyService.deleteTlApply(tlApplySeq);
		
		List<TlApplyVO> tlList = tlApplyService.getTlListByStuId(stuId);
		List<AcaStatusVO> backList = tlApplyService.getBackListByStuId(stuId);
		Map<String,List<?>> dataMap = new HashMap<String,List<?>>();
		dataMap.put("tlList", tlList);
		dataMap.put("backList",backList);
		entity= new ResponseEntity<Map<String,List<?>>>(dataMap,HttpStatus.OK);
		return entity;
	}
	@GetMapping("/dualMajor/main")
	public String dualMajorMain(Model model) throws SQLException {
		String url = "stu/aca/dualMajorMain";
		List<CollegeVO> collegeList = changeMajorService.selectCollegeList();
		model.addAttribute("collegeList", collegeList);
		return url;
	}

	@GetMapping("/dualMajor/applyPage")
	public String dualMajorPage(String colName, String majorName, Model model) {
		String url = "stu/aca/dualMajorPage";
		model.addAttribute("colName", colName);
		model.addAttribute("majorName", majorName);
		return url;
	}

	@GetMapping("/graduate")
	public String graduate() {
		String url = "stu/aca/graduate";
		return url;
	}

	@GetMapping("/graduate/info")
	public String graduateInfo() {
		String url = "stu/aca/graduateInfo";
		return url;
	}

	@GetMapping("/graduate/applyPage")
	public String graduatePage() {
		String url = "stu/aca/graduatePage";
		return url;
	}

}