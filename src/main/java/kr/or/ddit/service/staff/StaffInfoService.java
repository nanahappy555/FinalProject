package kr.or.ddit.service.staff;

import java.sql.SQLException;

import kr.or.ddit.dto.staff.StaffVO;

public interface StaffInfoService {

	StaffVO getStaffInfo(String staffId) throws SQLException;
}
