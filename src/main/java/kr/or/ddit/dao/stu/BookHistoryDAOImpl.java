package kr.or.ddit.dao.stu;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.stu.BookHistoryVO;

public class BookHistoryDAOImpl implements BookHistoryDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<BookHistoryVO> selectBookHistory() throws SQLException {
		List<BookHistoryVO> list = session.selectList("BookHistory-Mapper.selectBookHistory");
		return list;
	}

	@Override
	public int insertIntoBookHistory(BookHistoryVO vo) throws SQLException {
		int insert = session.insert("BookHistory-Mapper.insertBookHistory",vo);
		
		return insert;
	}

}
