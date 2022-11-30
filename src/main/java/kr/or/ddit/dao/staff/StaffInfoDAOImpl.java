package kr.or.ddit.dao.staff;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.staff.StaffVO;

@Repository
public class StaffInfoDAOImpl implements StaffInfoDAO{

	@Autowired
	private SqlSession sqlSession;


	@Override
	public StaffVO selectStaffInfoByStaffId(String staffId) throws SQLException {
		StaffVO staff = sqlSession.selectOne("Staff-Mapper.selectStaffInfoByStaffId", staffId);
		return staff;
	}

}
