package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.Criteria;

public interface StaffDualService {

	Map<String, Object> selectStaffDualList(Criteria cri) throws SQLException;
	
	Map<String, Object> selectStaffSubList(Criteria cri) throws SQLException;
	
	void updateDualStatus(Map<String, Object> dataMap) throws SQLException;
	
	void updateSubStatus(Map<String, Object> dataMap) throws SQLException;
	

}
