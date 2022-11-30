package kr.or.ddit.controller.staff;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.staff.ExcelVO;
import kr.or.ddit.dto.staff.StaffStuManageVO;
import kr.or.ddit.dto.staff.StaffTlApplyVO;
import kr.or.ddit.service.staff.ExcelService;
import kr.or.ddit.service.staff.StaffDualService;
import kr.or.ddit.service.staff.StaffMajorChangeService;
import kr.or.ddit.service.staff.StaffStuManageService;
import kr.or.ddit.service.staff.StaffTlApplyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/staff/stuManage")
public class StuManageController {

	@Autowired
	private StaffMajorChangeService staffMajorChangeService;
	@Autowired
	private StaffDualService staffDualService;
	@Autowired
	private StaffTlApplyService staffTlApplyService;
	@Autowired
	private StaffStuManageService staffStuManageService;
	@Autowired
	private ExcelService excelService;

	@GetMapping("/graduate/list")
	public String main() {
		String url = "staff/stuManage/graduateList";
		return url;
	}

	@GetMapping("/list")
	public String list(Model model, CriteriaLec cri) throws Exception {
		String url = "staff/stuManage/list";
		cri.setPerPageNum(10);
		
		Map<String, Object> dataMap = excelService.getUserRegistList(cri);
		List<ExcelVO> collegeList = excelService.selectCollegeList();
		
		model.addAttribute("dataMap", dataMap);
		model.addAttribute("collegeList", collegeList);

		return url;
	}

	@GetMapping("/registForm")
	public String userRegist(Model model, HttpServletRequest request) throws Exception {
		String url = "staff/stuManage/excelForm";

		return url;
	}

	@GetMapping("formjsp")
	public String formJSP() {
		return "excelForm";
	}

	@PostMapping(value = "/upload")
	@ResponseBody
	public List<Map<String, String>> excelUpload(MultipartFile excelFile) throws IOException, SQLException {

		log.debug("{}" + excelFile);

		List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();

		int i = 0;
		Workbook workBook = new XSSFWorkbook(excelFile.getInputStream());
		Sheet sheet = workBook.getSheetAt(0);

		boolean first = true;
		for (Row row : sheet) {
			if (first) { 
				first = false;
				continue;
			}
			dataList.add(new HashMap<String, String>());
			int j = 0;
			for (Cell cell : row) {
				if (j == 0) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("stuCd",cell.getRichStringCellValue().getString() );
				}
				if (j == 1) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("colName", cell.getRichStringCellValue().getString());
				}
				if (j == 2) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("majorName", cell.getRichStringCellValue().getString());
				}
				if (j == 3) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("name", cell.getRichStringCellValue().getString());
				}
				if (j == 4) {
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("birthday", cell.getRichStringCellValue().getString());
				}
				if (j == 5) {	
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("phone", cell.getRichStringCellValue().getString());
				}
				if (j == 6) {
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("email", cell.getRichStringCellValue().getString());
				}
				if (j == 7) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("admDate", cell.getRichStringCellValue().getString());
				}
				if (j == 8) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("nation", cell.getRichStringCellValue().getString());
				}
				if (j == 9) {
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("ename", cell.getRichStringCellValue().getString());
				}
				if (j == 10) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("zipcode", cell.getRichStringCellValue().getString());
				}
				if (j == 11) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("add1", cell.getRichStringCellValue().getString());
				}
				if (j == 12) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("add2", cell.getRichStringCellValue().getString());
				}
				if (j == 13) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("bankName", cell.getRichStringCellValue().getString());
				}
				if (j == 14) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("accHolder", cell.getRichStringCellValue().getString());
				}
				if (j == 15) {
					
					cell.setCellType(cell.CELL_TYPE_STRING);
					dataList.get(i).put("accNum", cell.getRichStringCellValue().getString());
				}
				j++;
			}
			i++;
		}

		log.debug("데이터리스트 :" +dataList.size());
		for (Map<String, String> mapData : dataList) {
			
			log.debug("HJW mapData : " + mapData);
			
			excelService.insertExcelMember(mapData);
			excelService.insertExcelStudent(mapData);
			excelService.insertExcelStuMajor(mapData);
		}

		/* workBook.close(); */ // 열었으면 닫장
		return dataList;
	}

	@GetMapping("/tl/list")
	public String tlList() throws Exception {
		String url = "staff/stuManage/tlList";
		/*
		 * List<StaffTlApplyVO> tlList = staffTlApplyService.selectStaffTlApplyList();
		 * List<StaffTlApplyVO> backList =
		 * staffTlApplyService.selectStaffBackApplyList();
		 * 
		 * model.addAttribute("tlList", tlList); model.addAttribute("backList",
		 * backList);
		 */

		return url;
	}

	@GetMapping(value = "/tl/huList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> huhakList(Criteria cri) throws Exception {

		Map<String, Object> tlList = staffTlApplyService.selectStaffTlApplyList(cri);
		
		log.debug("티리스트"+tlList.toString());
		
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(tlList, HttpStatus.OK);

		return entity;

	}

	@GetMapping(value = "/tl/bokList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> bokhakList(Criteria cri) throws Exception {

		Map<String, Object> backList = staffTlApplyService.selectStaffBackApplyList(cri);
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(backList, HttpStatus.OK);

		return entity;

	}
	
	@GetMapping("/tl/huList/detail")
	public ResponseEntity<StaffTlApplyVO> hulistAttach(StaffTlApplyVO vo)throws SQLException{
		
		
		
		StaffTlApplyVO selectTlapplyAttach = staffTlApplyService.selectTlapplyAttach(vo);
		
		log.debug("어태치"+selectTlapplyAttach.toString());
		
		ResponseEntity<StaffTlApplyVO> entity = new ResponseEntity<StaffTlApplyVO>(selectTlapplyAttach,HttpStatus.OK);
		
		log.debug("엔터티"+entity.toString());
		
		return entity;
		
	}
	
	

	@PostMapping(value = "/tlapplyStatus")
	@ResponseBody
	public String tlStatusChange(@RequestBody Map<String, Object> param,RedirectAttributes rttr) throws SQLException {

		staffTlApplyService.updateTlStatus(param);
		rttr.addFlashAttribute("form","approve");

		log.debug("파람" + param.toString());

		return "tttt";

	}

	@PostMapping(value = "/backapplyStatus")
	@ResponseBody
	public String backStatusChange(@RequestBody Map<String, Object> param) throws SQLException {

		staffTlApplyService.updateBackStatus(param);

		return "bbbb";
	}

	@GetMapping(value = "/majorChange/list", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView mcList(Criteria cri, ModelAndView mnv) throws Exception {
		String url = "staff/stuManage/majorChangeList";

		Map<String, Object> dataMap = staffMajorChangeService.selectStaffMajorChangeList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/dual/list")
	public String dual() throws Exception {
		String url = "/staff/stuManage/dualList";

		return url;
	}

	@GetMapping(value = "/dual/dualMajorList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> dualMajorList(Criteria cri) throws Exception {

		Map<String, Object> DualList = staffDualService.selectStaffDualList(cri);
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(DualList, HttpStatus.OK);

		return entity;

	}

	@GetMapping(value = "/dual/subMajorList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> subMajorList(Criteria cri) throws Exception {

		Map<String, Object> SubList = staffDualService.selectStaffSubList(cri);
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(SubList, HttpStatus.OK);

		return entity;

	}

	@PostMapping(value = "/majorChange/apply")
	@ResponseBody
	public String changeStatus(@RequestBody Map<String, Object> params) throws SQLException {

		staffMajorChangeService.modifyStatus(params);

		return "ok";

	}

	@RequestMapping("/majorChange/apply")
	public String majorChangeApply(HttpServletRequest request, String applyStatus) throws Exception {
		String url = "redirect:/staff/stuManage/majorChange/list";
		String[] majorChaSeqList = (String[]) request.getParameterValues("checkMajorCha");

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("majorChaSeqList", majorChaSeqList);
		dataMap.put("applyStatus", applyStatus);
		staffMajorChangeService.updateApplyStatus(dataMap);

		return url;
	}

	@RequestMapping("/majorDual/apply")
	public String majoDualApply(HttpServletRequest request, String applyStatus) throws Exception {
		String url = "redirect:/staff/stuManage/dual/list";
		String[] majorChaSeqList = (String[]) request.getParameterValues("checkMajorCha");
		log.info("#############전공 기본키" + majorChaSeqList + "");
		for (int i = 0; i < majorChaSeqList.length; i++) {

		}
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("majorChaSeqList", majorChaSeqList);
		dataMap.put("applyStatus", applyStatus);
		staffMajorChangeService.updateApplyStatus(dataMap);

		return url;
	}
//	
//	@RequestMapping("/tl/apply")
//	public String tlApply(HttpServletRequest request,String applyStatus)throws Exception{
//		String url="redirect:/staff/stuManage/tl/list";
//		String[] tlApplySeqList= (String[])request.getParameterValues("tlApplySeq");
//		
//		log.info("#########휴학컨트롤러" + tlApplySeqList + "");
//		for(int i=0; i<tlApplySeqList.length; i++) {
//			
//		}
//		Map<String,Object> dataMap = new HashMap<String,Object>();
//		dataMap.put("tlApplySeqList",tlApplySeqList);
//		dataMap.put("applyStatus",applyStatus);
//		staffTlApplyService.updateTlStatus(dataMap);
//		
//		return url;
//	}
//	
//	@RequestMapping("/back/apply")
//	public String backApply(HttpServletRequest request,String applyStatus)throws Exception{
//		String url="redirect:/staff/stuManage/tl/list";
//		String[] acaChangeSeqList= (String[])request.getParameterValues("checkBackApply");
//		log.info("#########복학컨트롤러" + acaChangeSeqList + "");
//		log.info("##########복학확인" + applyStatus + "");
//		for(int i=0; i<acaChangeSeqList.length; i++) {
//			
//		}
//		Map<String,Object> dataMap = new HashMap<String,Object>();
//		dataMap.put("acaChangeSeqList",acaChangeSeqList);
//		dataMap.put("applyStatus",applyStatus);
//		staffTlApplyService.updateBackStatus(dataMap);
//		
//		return url;
//	}
//	
//	

}
