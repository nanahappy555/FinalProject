package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.staff.StaffStuManageDAO;
import kr.or.ddit.dto.staff.StaffStuManageVO;

public class StaffStuManageServiceImpl implements StaffStuManageService{
	
	private StaffStuManageDAO staffStuManageDAO;
	public void setStaffStuManageDAO(StaffStuManageDAO staffStuManageDAO) {
		this.staffStuManageDAO = staffStuManageDAO;
	}

	@Override
	public List<StaffStuManageVO> selectStaffStuManageList() throws SQLException {
		return staffStuManageDAO.selectStaffStuManageList();
	}
	@Override
	public List<StaffStuManageVO> selectStaffStuManageProfList() throws SQLException {
		return staffStuManageDAO.selectStaffStuManageProfList();
	}

}
