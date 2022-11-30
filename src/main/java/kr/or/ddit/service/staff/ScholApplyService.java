package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.Criteria;

public interface ScholApplyService {

	Map<String, Object> getList(Criteria cri)throws SQLException;
	
	public void updateScholApply(Map<String, Object> dataMap)throws SQLException;
}
