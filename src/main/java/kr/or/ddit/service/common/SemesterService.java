package kr.or.ddit.service.common;

import java.sql.SQLException;

import kr.or.ddit.dto.common.SemesterVO;

public interface SemesterService {
	
	public SemesterVO selectAvailableSemester() throws SQLException;
}
