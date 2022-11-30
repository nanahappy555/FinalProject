package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.stu.StuShaReplyVO;

@Repository
public class ShaReplyDAOImpl implements ShaReplyDAO {
	
	@Autowired
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<StuShaReplyVO> selectReplyList(int shaBno) throws SQLException {
		return session.selectList("ShareReply-Mapper.selectReplyList", shaBno);
	}
	
	@Override
	public StuShaReplyVO selectReply(int shaRno) throws SQLException {
		return session.selectOne("ShareReply-Mapper.selectReply", shaRno);
	}

	@Override
	public int countReply(int shaBno) throws SQLException {
		return session.selectOne("ShareReply-Mapper.countReply", shaBno);
	}

	@Override
	public void insertReply(StuShaReplyVO share) throws SQLException {
		session.update("ShareReply-Mapper.insertReply",share);
	}

	@Override
	public void updateReply(StuShaReplyVO share) throws SQLException {
		session.update("ShareReply-Mapper.updateReply",share);
	}

	@Override
	public void deleteReply(int shaRno) throws SQLException {
		session.update("ShareReply-Mapper.deleteReply",shaRno);
	}

	@Override
	public int selectReplySeqNextValue() throws SQLException {
		int cnt = session.selectOne("ShareReply-Mapper.selectReplySeqNextValue");
		
		return cnt;
	}

}
