package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.staff.StaffTuitionVO;

public class StaffTuitionDAOImpl implements StaffTuitionDAO{

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	public List<StaffTuitionVO> selectStaffTuitionList() throws SQLException {
		return session.selectList("StaffTuition-Mapper.selectStaffTuitionList");
	}
}
