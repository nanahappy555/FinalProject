package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.staff.StaffStuManageVO;

public interface StaffStuManageDAO {

	List<StaffStuManageVO> selectStaffStuManageList() throws SQLException;
	List<StaffStuManageVO> selectStaffStuManageProfList() throws SQLException;
}
