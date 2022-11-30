package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

public interface ClassroomDAO {
	public List<String> selectClassroomList()throws SQLException;
}
