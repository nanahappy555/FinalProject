package kr.or.ddit.service.stu.support;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.stu.support.ShaReplyDAO;
import kr.or.ddit.dto.stu.StuShaReplyVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ShaReplyServiceImpl implements ShaReplyService {
	
	@Autowired
	private ShaReplyDAO shaReplyDAO;
	public void setShaReplyDAO(ShaReplyDAO shaReplyDAO) {
		this.shaReplyDAO = shaReplyDAO;
	}

	@Override
	public List<StuShaReplyVO> getReplyList(int shaBno) throws SQLException {
		List<StuShaReplyVO> replyList = shaReplyDAO.selectReplyList(shaBno);
		return replyList;
	}

	@Override
	public StuShaReplyVO getReply(int shaRno) throws SQLException{
		StuShaReplyVO reply = shaReplyDAO.selectReply(shaRno);
		return reply;
	}
	
	@Override
	public int getCountReply(int shaBno) throws SQLException {
		int count = shaReplyDAO.countReply(shaBno);
		return count;
	}

	@Override
	public void modifyReply(StuShaReplyVO shaReply) throws SQLException {
		shaReplyDAO.updateReply(shaReply);
		
	}

	@Override
	public void registReply(StuShaReplyVO shaReply) throws SQLException {
		int shaRno = shaReplyDAO.selectReplySeqNextValue();
		log.debug("알엔오"+shaRno);
		shaReply.setShaRno(shaRno);
		log.debug("서비스임플"+shaReply);
		shaReplyDAO.insertReply(shaReply);
		
	}

	@Override
	public void removeReply(int shaRno) throws SQLException {
		shaReplyDAO.deleteReply(shaRno);
		
	}


}
