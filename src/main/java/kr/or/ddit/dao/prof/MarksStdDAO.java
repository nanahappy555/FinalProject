package kr.or.ddit.dao.prof;

import java.sql.SQLException;

import kr.or.ddit.dto.prof.MarksStdVO;

public interface MarksStdDAO {
	public void insertMarksStd(MarksStdVO vo) throws SQLException;
}
