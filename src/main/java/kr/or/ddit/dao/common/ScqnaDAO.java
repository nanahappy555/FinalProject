package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.common.ScQnaVO;

public interface ScqnaDAO {

	List<ScQnaVO> selectScqnaList(Criteria cri)throws SQLException;
	
	ScQnaVO selectScqnaDetail(int scqBno)throws SQLException;
	
	public void insertScqna(ScQnaVO scqna)throws SQLException;
	
	int selectScqBnoSeqNext()throws SQLException;
	
	public void insertReply(ScQnaVO vo)throws SQLException;
	
	public void modifyReply(ScQnaVO vo)throws SQLException;
	
	public void deleteScqna(int scqBno)throws SQLException;
	
	public void increaseViewCnt(int scqBno)throws SQLException;

	public int selectScqnaTotalCount(Criteria cri)throws SQLException;
	
	//위젯 
	public int selectBnoCount()throws SQLException;
	
	public int selectReplyNullCount()throws SQLException;
}


