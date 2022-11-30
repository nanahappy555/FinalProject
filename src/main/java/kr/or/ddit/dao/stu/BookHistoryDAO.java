package kr.or.ddit.dao.stu;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.BookHistoryVO;

public interface BookHistoryDAO {
	public List<BookHistoryVO> selectBookHistory() throws SQLException;
	public int insertIntoBookHistory(BookHistoryVO vo)throws SQLException;
}
