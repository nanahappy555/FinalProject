package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.StaffMajorChangeVO;
import kr.or.ddit.dto.stu.MajorChangeVO;

public interface StaffMajorChangeDAO {
	
	List<StaffMajorChangeVO> selectStaffMajorChangeList(Criteria cri) throws SQLException;

	void updateApplyStatus(MajorChangeVO majChaVO);
		
	public int selectSearchMajorChangeCount(Criteria cri)throws SQLException;

}
