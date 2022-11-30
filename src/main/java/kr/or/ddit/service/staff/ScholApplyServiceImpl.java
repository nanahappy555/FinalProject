package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.staff.ScholApplyDAO;
import kr.or.ddit.dto.staff.ScholApplyListVO;
import kr.or.ddit.dto.stu.ScholApplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ScholApplyServiceImpl implements ScholApplyService{

	private ScholApplyDAO scholApplyDAO;
	
	
	public void setScholApplyDAO(ScholApplyDAO scholApplyDAO) {
		this.scholApplyDAO = scholApplyDAO;
	}


	@Override
	public Map<String, Object> getList(Criteria cri) throws SQLException {
		
		Criteria searchCri = (Criteria) cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ScholApplyListVO> selectList = scholApplyDAO.selectList(searchCri);
		
		int totalCount = scholApplyDAO.selectSearchTotalCount(searchCri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("selectList",selectList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}


	@Override
	public void updateScholApply(Map<String, Object> dataMap) throws SQLException {
		String[] scholList = (String[])dataMap.get("scholList");
		String applyStatus = (String)dataMap.get("applyStatus");
		
		log.debug(scholList.toString());
		log.debug(applyStatus);
		
		for(int i=0;i<scholList.length;i++) {
			ScholApplyVO scholVO = new ScholApplyVO();
			
			scholVO.setScholAppSeq(Integer.parseInt(scholList[i]));
			scholVO.setApplyStatusCd(applyStatus);
			
			scholApplyDAO.updateScholApply(scholVO);
			
		}
	}

}
