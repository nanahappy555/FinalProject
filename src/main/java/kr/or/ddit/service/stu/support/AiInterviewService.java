package kr.or.ddit.service.stu.support;

import java.sql.SQLException;

public interface AiInterviewService{
	public String selectScript() throws SQLException;

	public String selectFaceScript() throws SQLException;
}
