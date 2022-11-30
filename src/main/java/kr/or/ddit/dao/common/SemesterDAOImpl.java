package kr.or.ddit.dao.common;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.common.SemesterVO;

public class SemesterDAOImpl implements SemesterDAO{
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public SemesterVO selectAvailableSemester() throws SQLException {
		return session.selectOne("Semester-Mapper.selectAvailableSemester");
	}
}
