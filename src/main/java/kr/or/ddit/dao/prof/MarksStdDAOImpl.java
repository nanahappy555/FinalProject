package kr.or.ddit.dao.prof;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.prof.MarksStdVO;

public class MarksStdDAOImpl implements MarksStdDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertMarksStd(MarksStdVO vo) throws SQLException {
		session.insert("MarksStd-Mapper.insertMarksStd",vo);
	}

}
