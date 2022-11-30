package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class AiInterviewDAOImpl implements AiInterviewDAO{
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<String> selectScriptList() throws SQLException {
		List<String> scriptList = session.selectList("StuSupport-Mapper.selectScriptList");
		return scriptList;
	}
	@Override
	public List<String> selectFaceScript() throws SQLException {
		List<String> scriptList = session.selectList("StuSupport-Mapper.selectFaceScript");
		return scriptList;
	}

}
