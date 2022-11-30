package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.staff.StaffTuitionVO;

public interface StaffTuitionService {

	List<StaffTuitionVO> selectStaffTuitionList () throws SQLException;
	
}
