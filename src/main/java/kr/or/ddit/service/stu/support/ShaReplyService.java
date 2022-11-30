package kr.or.ddit.service.stu.support;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.StuShaReplyVO;

public interface ShaReplyService {

	List<StuShaReplyVO> getReplyList(int shaBno) throws SQLException;
	
	StuShaReplyVO getReply(int shaRno) throws SQLException;
	
	int getCountReply(int shaBno) throws SQLException;
	
	void modifyReply(StuShaReplyVO ShaReply) throws SQLException;
	void registReply(StuShaReplyVO ShaReply) throws SQLException;
	void removeReply(int shaRno) throws SQLException;
}
