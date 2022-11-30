package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.MenuVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.common.SemesterVO;
import kr.or.ddit.dto.common.ThreeDepthMenuVO;
import kr.or.ddit.dto.stu.LecVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.handler.AlarmHandler;
import kr.or.ddit.service.common.MemberService;
import kr.or.ddit.service.common.MenuService;
import kr.or.ddit.service.common.SemesterService;
import kr.or.ddit.service.stu.InfoService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class BasicController {
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SemesterService semesterService;
	
	
	@Autowired
	InfoService infoService;
	
	
	@RequestMapping("/index")
	public String index(@RequestParam(defaultValue = "M000000") String mCode, Model model,String lecCd,
																HttpServletRequest request, AlarmHandler handler) 
																		throws SQLException, IOException {
		String url = "common/main";
		
		if(mCode.equals("M030500")&&lecCd!=null) {
			model.addAttribute("from","lecBoard");
		}
		
		List<MenuVO> menuList = menuService.getMainMenuList();
		MenuVO menu = menuService.getMenuByMcode(mCode);
		model.addAttribute("menuList", menuList);
		model.addAttribute("menu", menu);
		
		
		HttpSession session=request.getSession();
		if(session.getAttribute("semester")==null) {
			//학사년도 정보 담기
			SemesterVO semester = semesterService.selectAvailableSemester();
			session.setAttribute("semester",semester);
			log.info("semester 정보 : "+semester.getSemeCd());
		}
		
		
		//로그인 정보 담기.
		if(session.getAttribute("loginUser")!=null) {
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			String memId = member.getMemId();
			log.info("로그인 정보 : "+session.getAttribute("loginUser"));
			log.info("멤버 id"+memId);
			String userClass = member.getMemClassCd();
			if(userClass.equals("staff")) {
				session.setAttribute("member",member);
			}else if(userClass.equals("prof")) {
				session.setAttribute("member",member);
			}else if(userClass.equals("stu")) {
				StudentVO student = infoService.getInfo(memId);
				if(session.getAttribute("member")==null) {
					log.info("student : "+student.getName());
					session.setAttribute("member",student);
					log.info("세션에 담긴 정보 : "+(StudentVO)session.getAttribute("member"));
				}
			}
			
			
		}
		
		
		return url;
	}
	
	@RequestMapping("/subMenu")
	@ResponseBody
	public ResponseEntity<List<MenuVO>> subMenuToJSON(String mCode) {
		ResponseEntity<List<MenuVO>> entity = null;
		List<MenuVO> subMenu = null;
		try {
			subMenu = menuService.getSubMenuList(mCode);
			entity = new ResponseEntity<List<MenuVO>>(subMenu, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
	}
		
	@RequestMapping("/threeDepthMenu")
	@ResponseBody
	public ResponseEntity<List<ThreeDepthMenuVO>> threeDepthMenu(HttpServletRequest request, String mCode,String murl){
		ResponseEntity<List<ThreeDepthMenuVO>> entity =null;
		List<ThreeDepthMenuVO> threeDepthMenuList = new ArrayList<ThreeDepthMenuVO>();
		
		
		HttpSession session = request.getSession();
		MemberVO member=(MemberVO) session.getAttribute("loginUser");
		String memId = member.getMemId();
		String memClass = member.getMemClassCd();
		SemesterVO semester = (SemesterVO)session.getAttribute("semester");
		String semeCd = semester.getSemeCd();
		List<MyLectureVO> lecList = null;
		if(memClass.equals("prof")) {
			lecList = menuService.getLecListByProf(memId);
			
		}else if(memClass.equals("stu")){
			LecVO lec = new LecVO();
			lec.setSemeCd(semeCd);
			lec.setStuCd(memId);
			lecList=menuService.getLecListByStu(lec);
		}
		
		log.info(lecList+"");
		for(int i=0;i<lecList.size();i++) {
			ThreeDepthMenuVO threeMenuVO = new ThreeDepthMenuVO();
			threeMenuVO.setMcode(mCode);
			threeMenuVO.setMurl(murl);
			threeMenuVO.setLecCd(lecList.get(i).getLecCd());
			threeMenuVO.setLecName(lecList.get(i).getLecName());
			threeDepthMenuList.add(threeMenuVO);
		}
		
		
		entity = new ResponseEntity<List<ThreeDepthMenuVO>>(threeDepthMenuList,HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/menu")
	@ResponseBody
	public ResponseEntity<MenuVO> menuToJSON(String mCode){
		ResponseEntity<MenuVO> entity =null;
		MenuVO menu = null;
		try {
			menu = menuService.getMenuByMcode(mCode);
			entity = new ResponseEntity<MenuVO>(menu,HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<MenuVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	

	@GetMapping("/main")
	public String main(HttpServletRequest request,Model model) throws Exception {
		String url=null;
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String memId = member.getMemId();
		String userClass = member.getMemClassCd();
		if(userClass.equals("staff")) {
			//model.addAttribute()
			url = "staff/main";
		}else if(userClass.equals("prof")) {
			url = "prof/main";
		}else if(userClass.equals("stu")) {
			model.addAttribute("member",infoService.getInfo(memId));
			url = "stu/main";
		}
		return url;
	}
	
	@Autowired
	AttachDAO attachDAO;
	@RequestMapping("/getFile")
	public String getFile(AttachVO attach, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String url = "downloadFile";
		AttachVO attachVO = attachDAO.selectAttach(attach);

		model.addAttribute("savedPath", attachVO.getUploadpath());
		model.addAttribute("fileName", attachVO.getFilename());

		return url;
	}
	
	@GetMapping("/removeSelectedFile")
	@ResponseBody
	public String removeFile(AttachVO attach) {
		String cd = "ok";
		try {
			attachDAO.deleteAttach(attach);
		} catch (SQLException e) {
			cd="nok";
		}
		return cd;
	}
	
	

	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	@GetMapping("/getPicture")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(AttachVO attach) throws Exception {
		ResponseEntity<byte[]> entity = null;
		
		InputStream in = null;
		String imgPath = this.fileUploadPath;
		log.debug("attach : "+attach);
		log.debug("이미지경로오오오오"+imgPath);
		AttachVO attachVO  = attachDAO.selectAttach(attach);
		if(attachVO == null) {
			try {
				in = new FileInputStream(new File(imgPath, "basicProfile.png"));
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
			}finally {
				if (in != null)
					in.close();
			}
		}else {
			String imgName = attachVO.getFilename();
			try {
				in = new FileInputStream(new File(imgPath, imgName));
	
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
			} finally {
				if (in != null)
					in.close();
			}
		}

		return entity;
	}
	
}
