package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.common.ScqnaDAO;
import kr.or.ddit.dto.common.ScQnaVO;

public class ScqnaServiceImpl implements ScqnaService{

	private ScqnaDAO scqnaDAO;
	
	public void setScqnaDAO(ScqnaDAO scqnaDAO) {
		this.scqnaDAO = scqnaDAO;
	}

	@Override
	public Map<String, Object> getScqnaList(Criteria cri) throws SQLException {

		Criteria searchCri = (Criteria) cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ScQnaVO> scqnaList = scqnaDAO.selectScqnaList(searchCri);
		
		int totalCount = scqnaDAO.selectScqnaTotalCount(searchCri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("scqnaList", scqnaList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public ScQnaVO getSelectScqnaDetail(int scqBno) throws SQLException {
		
		scqnaDAO.increaseViewCnt(scqBno);
		
		ScQnaVO selectScqnaDetail = scqnaDAO.selectScqnaDetail(scqBno);
		
		return selectScqnaDetail;
	}

	@Override
	public void regist(ScQnaVO scqna) throws SQLException {
		int bno = scqnaDAO.selectScqBnoSeqNext();
		scqna.setScqBno(bno);
		scqnaDAO.insertScqna(scqna);
		System.out.println(scqna);
	}

	@Override
	public void registReply(ScQnaVO vo) throws SQLException {
		 scqnaDAO.insertReply(vo);
		
	}

	@Override
	public void modifyReply(ScQnaVO vo) throws SQLException {
		scqnaDAO.modifyReply(vo);
	}

	@Override
	public void removeScqna(int scqBno) throws SQLException {
		scqnaDAO.deleteScqna(scqBno);
	}

	@Override
	public int getBnoCount() throws SQLException {
		int bnoCount = scqnaDAO.selectBnoCount();
		return bnoCount;
	}

	@Override
	public int getReplyNullCount() throws SQLException {
		int replyNullCount = scqnaDAO.selectReplyNullCount();
		return replyNullCount;
	}
	

		



}
	
	
