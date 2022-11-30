package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.staff.StaffTlApplyDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.staff.StaffTlApplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class StaffTlApplyServiceImpl implements StaffTlApplyService {
	
	@Autowired
	private StaffTlApplyDAO staffTlApplyDAO;
	public void setStaffTlApplyDAO(StaffTlApplyDAO staffTlApplyDAO) {
		this.staffTlApplyDAO = staffTlApplyDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}


	@Override
	public Map<String, Object> selectStaffTlApplyList(Criteria cri) throws SQLException {
		Criteria searchCri = (Criteria)cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<StaffTlApplyVO> selectHuhakList = staffTlApplyDAO.selectStaffTlApplyList(searchCri);
		int totalTlApplyCount = staffTlApplyDAO.selectStaffTlApplyListCount(searchCri);
		
		log.debug("복학리스트"+selectHuhakList); //tlApplySeq=5
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalTlApplyCount);

		dataMap.put("selectHuhakList", selectHuhakList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}


	@Override
	public Map<String, Object> selectStaffBackApplyList(Criteria cri) throws SQLException {
		Criteria searchCri = (Criteria)cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<StaffTlApplyVO> selectBokhakList = staffTlApplyDAO.selectStaffBackApplyList(searchCri);
		int totalBackApplyCount = staffTlApplyDAO.selectStaffBackApplyListCount(searchCri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalBackApplyCount);

		dataMap.put("selectBokhakList", selectBokhakList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
		
	}


	@Override
	public void updateTlStatus(Map<String, Object> param) throws SQLException {
		ArrayList<String> checkArr = (ArrayList<String>)param.get("checkArr");
		String applyStatusCd = (String)param.get("applyStatusCd");
		
		log.debug("checkArr"+checkArr);
		
		for(String no : checkArr) {
			int tiapplyNo = Integer.parseInt(no);
			StaffTlApplyVO stfTlVO = new StaffTlApplyVO();
			stfTlVO.setTlApplySeq(tiapplyNo);
			stfTlVO.setApplyStatusCd(applyStatusCd);
			
			staffTlApplyDAO.updateTlStatus(stfTlVO);
			
		}
	}

	@Override
	public void updateBackStatus(Map<String, Object> param) throws SQLException {
		ArrayList<String> checkArr = (ArrayList<String>)param.get("checkArr");
		String applyStatusCd = (String)param.get("applyStatusCd");
		
		for(String no : checkArr) {
			int backapplyNo = Integer.parseInt(no);
			StaffTlApplyVO stfBackVO = new StaffTlApplyVO();
			stfBackVO.setAcaChangeSeq(backapplyNo);
			stfBackVO.setApplyStatusCd(applyStatusCd);
			
			staffTlApplyDAO.updateBackStatus(stfBackVO);
		}
	}


	//첨부파일
	@Override
	public StaffTlApplyVO selectTlapplyAttach(StaffTlApplyVO vo) throws SQLException {
		
		StaffTlApplyVO selectTlapplyAttach = staffTlApplyDAO.selectTlapplyAttach(vo);
		
		
		
		log.debug("셀렉트어태"+selectTlapplyAttach.toString());
		
		log.debug("에이엔오 : " +selectTlapplyAttach.getAnoCd());
		 log.debug("어태치다오 : " + attachDAO);
		  List<AttachVO> selectAttachList = attachDAO.selectAttachList(selectTlapplyAttach.getAnoCd());
		  
		  log.debug("djxovlflxtmxm",selectAttachList.toString());
		  
		selectTlapplyAttach.setAttachList(selectAttachList);
		
		log.debug("tlapply첨부파일"+selectTlapplyAttach);
		
		return selectTlapplyAttach;
	}
	
	

}
