package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.staff.StaffStuManageVO;

public interface StaffStuManageService {

	List<StaffStuManageVO> selectStaffStuManageList() throws SQLException;
	List<StaffStuManageVO> selectStaffStuManageProfList() throws SQLException;
}
