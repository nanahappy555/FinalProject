package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.staff.StaffDualDAO;
import kr.or.ddit.dto.staff.StaffDualVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class StaffDualServiceImpl implements StaffDualService{

	private StaffDualDAO staffDualDAO;
	
	public void setStaffDualDAO(StaffDualDAO staffDualDAO) {
		this.staffDualDAO = staffDualDAO;
	}
	
	
	@Override
	public Map<String, Object> selectStaffDualList(Criteria cri) throws SQLException {
		Criteria serachCri = (Criteria) cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<StaffDualVO> selectDualList = staffDualDAO.selectStaffDualList(serachCri);
		
		int totalDualCount = staffDualDAO.selectSerachStaffDualCount(serachCri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalDualCount);
		
		dataMap.put("selectDualList", selectDualList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
		
	}



	@Override
	public void updateDualStatus(Map<String, Object> dataMap) throws SQLException {
		String[] majorChaSeqList = (String[])dataMap.get("majorChaSeqList");
		String applyStatus = (String)dataMap.get("applyStatus");
		
		for(int i=0; i<majorChaSeqList.length; i++) {
			StaffDualVO staDualVO = new StaffDualVO();
			staDualVO.setMajorChaSeq(Integer.parseInt(majorChaSeqList[i]));
			staDualVO.setApplyStatusCd(applyStatus);
			staffDualDAO.updateDualStatus(staDualVO);
						
		}	 
		
	}
	
	@Override
	public Map<String, Object> selectStaffSubList(Criteria cri) throws SQLException{
		Criteria serachCri = (Criteria) cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<StaffDualVO> selectSubList = staffDualDAO.selectStaffSubList(serachCri);
		
		int totalSubCount = staffDualDAO.selectSearchStaffSubCount(serachCri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalSubCount);
		
		dataMap.put("selectSubList", selectSubList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void updateSubStatus(Map<String, Object> dataMap) throws SQLException {
		String[] majorChaSeqList = (String[])dataMap.get("majorChaSeqList");
		String applyStatus = (String)dataMap.get("applyStatus");
		
		for(int i=0; i<majorChaSeqList.length; i++) {
			StaffDualVO staDualVO = new StaffDualVO();
			staDualVO.setMajorChaSeq(Integer.parseInt(majorChaSeqList[i]));
			staDualVO.setApplyStatusCd(applyStatus);
			staffDualDAO.updateSubStatus(staDualVO);
		
		}
	}
	

}
