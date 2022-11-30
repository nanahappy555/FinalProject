package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.staff.StaffMajorChangeDAO;
import kr.or.ddit.dto.staff.StaffMajorChangeVO;
import kr.or.ddit.dto.stu.MajorChangeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class StaffMajorChangeServiceImpl implements StaffMajorChangeService {

	
	@Autowired
	private StaffMajorChangeDAO staffMajorChangeDAO;
	
	public void setStaffMajorChangeDAO(StaffMajorChangeDAO staffMajorChangeDAO) {
		this.staffMajorChangeDAO = staffMajorChangeDAO;
	} 
	
	@Override
	public Map<String, Object> selectStaffMajorChangeList(Criteria cri) throws SQLException {
		
		Criteria searchCri = (Criteria) cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<StaffMajorChangeVO> selectStaffMajorChangeList = staffMajorChangeDAO.selectStaffMajorChangeList(searchCri);
		
		int serachTotalCount = staffMajorChangeDAO.selectSearchMajorChangeCount(searchCri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(serachTotalCount);
		
		dataMap.put("selectStaffMajorChangeList",selectStaffMajorChangeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void updateApplyStatus(Map<String, Object> dataMap) throws SQLException {
		String[] majorChaSeqList= (String[])dataMap.get("majorChaSeqList");
		String applyStatus = (String)dataMap.get("applyStatus");
		for(int i=0;i<majorChaSeqList.length;i++) {
			MajorChangeVO majChaVO = new MajorChangeVO();
			majChaVO.setMajorChaSeq(Integer.parseInt(majorChaSeqList[i]));
			majChaVO.setApplyStatusCd(applyStatus);
			staffMajorChangeDAO.updateApplyStatus(majChaVO);
		}
	}

	@Override
	public void modifyStatus(Map<String, Object> params) {
		
		String status = (String) params.get("status");
		ArrayList<String> chkList = (ArrayList<String>) params.get("chkList");
		
		for (String no : chkList) {
			int majorChaSeq = Integer.parseInt(no);
			MajorChangeVO majChaVO = new MajorChangeVO();
			majChaVO.setMajorChaSeq(majorChaSeq);
			majChaVO.setApplyStatusCd(status);
			
			staffMajorChangeDAO.updateApplyStatus(majChaVO);
			
			
		}
	}
	
	

}
