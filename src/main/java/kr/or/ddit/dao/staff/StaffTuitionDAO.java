package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.staff.StaffTuitionVO;

public interface StaffTuitionDAO {

	List<StaffTuitionVO> selectStaffTuitionList() throws SQLException;
	
}
