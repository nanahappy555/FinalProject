package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;
import java.util.List;

public interface AiInterviewDAO {
	public List<String> selectScriptList() throws SQLException;

	public List<String> selectFaceScript() throws SQLException;
}
