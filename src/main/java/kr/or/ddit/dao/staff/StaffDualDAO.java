package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.StaffDualVO;

public interface StaffDualDAO {
	
	List<StaffDualVO> selectStaffDualList(Criteria cri)throws SQLException;
	
	public int selectSerachStaffDualCount(Criteria cri)throws SQLException;
	
	void updateDualStatus(StaffDualVO staffDualVO);
	
	List<StaffDualVO> selectStaffSubList(Criteria cri)throws SQLException;
	
	public int selectSearchStaffSubCount(Criteria cri)throws SQLException;
	
	void updateSubStatus(StaffDualVO staffDualVO);

}
