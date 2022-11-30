package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.Criteria;

public interface StaffMajorChangeService {
	
	Map<String, Object> selectStaffMajorChangeList(Criteria cri) throws SQLException;
	
	void updateApplyStatus(Map<String,Object> dataMap)throws SQLException;

	public void modifyStatus(Map<String, Object> params);
}

	