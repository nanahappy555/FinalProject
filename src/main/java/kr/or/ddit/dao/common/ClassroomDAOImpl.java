package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClassroomDAOImpl implements ClassroomDAO {

	@Autowired
	private SqlSession session;
	@Override
	public List<String> selectClassroomList() throws SQLException {
			List<String> classroomList = session.selectList("selectClassroomList");
		return classroomList;
	}
	
}
