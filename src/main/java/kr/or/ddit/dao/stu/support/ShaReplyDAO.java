package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.StuShaReplyVO;


public interface ShaReplyDAO {

	List<StuShaReplyVO> selectReplyList(int shaBno) throws SQLException;
	StuShaReplyVO selectReply(int shaRno) throws SQLException;
	
	int countReply(int shaBno) throws SQLException;
	
	void insertReply(StuShaReplyVO share) throws SQLException;
	void updateReply(StuShaReplyVO share) throws SQLException;
	void deleteReply(int shaRno) throws SQLException;
	
	int selectReplySeqNextValue() throws SQLException;
}
