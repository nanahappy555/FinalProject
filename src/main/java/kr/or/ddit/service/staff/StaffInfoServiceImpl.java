package kr.or.ddit.service.staff;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.staff.StaffInfoDAO;
import kr.or.ddit.dto.staff.StaffVO;

@Service
public class StaffInfoServiceImpl implements StaffInfoService{

	@Autowired
	private StaffInfoDAO staffInfoDAO;
	
	@Override
	public StaffVO getStaffInfo(String staffId) throws SQLException {
		StaffVO staff = staffInfoDAO.selectStaffInfoByStaffId(staffId);
		return staff;
	}

}
