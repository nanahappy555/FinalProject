package kr.or.ddit.dao.staff;

import java.sql.SQLException;

import kr.or.ddit.dto.staff.StaffVO;

public interface StaffInfoDAO {
	
	StaffVO selectStaffInfoByStaffId(String staffId) throws SQLException;
}
