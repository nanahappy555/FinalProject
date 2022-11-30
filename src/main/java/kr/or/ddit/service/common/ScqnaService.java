package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.common.ScQnaVO;

public interface ScqnaService {

	Map<String, Object> getScqnaList(Criteria cri)throws SQLException;
	
	ScQnaVO getSelectScqnaDetail(int scqBno)throws SQLException;
	
	public void regist(ScQnaVO scqna)throws SQLException;
	
	public void registReply(ScQnaVO vo)throws SQLException;
	
	public void modifyReply(ScQnaVO vo)throws SQLException;
	
	public void removeScqna(int scqBno)throws SQLException;
	
	public int getBnoCount()throws SQLException;
	
	public int getReplyNullCount()throws SQLException;
	
}
