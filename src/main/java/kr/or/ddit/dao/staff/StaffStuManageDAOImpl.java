package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.staff.StaffStuManageVO;

public class StaffStuManageDAOImpl implements StaffStuManageDAO{

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;		
	}
	
	@Override
	public List<StaffStuManageVO> selectStaffStuManageList() throws SQLException {
		return session.selectList("StaffStuManage-Mapper.selectStaffStuManageList");
	}

	@Override
	public List<StaffStuManageVO> selectStaffStuManageProfList() throws SQLException {
		return session.selectList("StaffStuManage-Mapper.selectStaffStuManageProfList");
	}

}
