package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.List;

public interface ClassroomService {

	public List<String> getClassroomList()throws SQLException;
}
