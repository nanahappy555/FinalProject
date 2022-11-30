package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.staff.StaffTuitionDAO;
import kr.or.ddit.dto.staff.StaffTuitionVO;

public class StaffTuitionServiceImpl implements StaffTuitionService{

	
	private StaffTuitionDAO staffTuitionDAO;
	public void setStaffTuitionDAO(StaffTuitionDAO staffTuitionDAO) {
		this.staffTuitionDAO = staffTuitionDAO;
	}
	
	public List<StaffTuitionVO> selectStaffTuitionList() throws SQLException {		
		return staffTuitionDAO.selectStaffTuitionList();
	}
	
}
