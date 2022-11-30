package kr.or.ddit.dao.common;

import java.sql.SQLException;

import kr.or.ddit.dto.common.SemesterVO;

public interface SemesterDAO {
	public SemesterVO selectAvailableSemester() throws SQLException;
}
