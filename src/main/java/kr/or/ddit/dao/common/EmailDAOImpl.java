package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.common.MailVO;
import kr.or.ddit.dto.prof.ProfVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class EmailDAOImpl implements EmailDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<MailVO> selectReceiveList(CriteriaLec cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<MailVO> ReceiveList = session.selectList("Email-Mapper.selectReceiveList", cri, rowBounds);

		return ReceiveList;
	}

	@Override
	public List<MailVO> selectSendList(CriteriaLec cri) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<MailVO> sendList = session.selectList("Email-Mapper.selectSendList", cri, rowBounds);

		return sendList;
	}
 
	@Override
	public List<MailVO> selectReceiveBin(String memId) throws SQLException {
		List<MailVO> receiveBin = session.selectList("Email-Mapper.selectReceiveBin", memId);
		log.debug("11111111111다오확인" + receiveBin);
		return receiveBin;
	}

	@Override
	public List<MailVO> selectSentBin(String memId) throws SQLException {
		List<MailVO> sentBin = session.selectList("Email-Mapper.selectSentBin", memId);
		log.debug("2222222222222다오확인" + sentBin);
		return sentBin;
	}

	@Override
	public MailVO selectMailDetail(int noteSeq) throws SQLException {
		MailVO MailDetail = session.selectOne("Email-Mapper.selectMailDetail", noteSeq);

		return MailDetail;
	}
	
	@Override
	public MailVO selectSentMailDetail(int sentNoteSeq) throws SQLException {
		MailVO MailDetail = session.selectOne("Email-Mapper.selectSentMailDetail", sentNoteSeq);
		
		return MailDetail;
	}

	@Override
	public void insertReceiveInfo(MailVO mail) throws SQLException {

		session.insert("Email-Mapper.insertReceiveInfo", mail);

	}

	@Override
	public void insertSendMailInfo(MailVO mail) throws SQLException {

		session.insert("Email-Mapper.insertSendMailInfo", mail);

	}

	@Override
	public int selectNoteSeqNextVal() throws SQLException {
		return session.selectOne("Email-Mapper.selectNoteSeqNextVal");
	}

	@Override
	public int selectSentNoteSeqNextVal() throws SQLException {
		return session.selectOne("Email-Mapper.selectSentNoteSeqNextVal");
	}

	@Override
	public int countReceiveMailList(CriteriaLec cri) throws SQLException {
		return session.selectOne("Email-Mapper.countReceiveMailList", cri);
	}

	@Override
	public int countSentMailList(CriteriaLec cri) throws SQLException {
		int totalCount = session.selectOne("Email-Mapper.countSentMailList", cri);
		log.debug("다오 토탈카운트 : "  + totalCount);
		return totalCount;
	}

	@Override
	public int selectCountMail(String memId) throws SQLException {
		return session.selectOne("Email-Mapper.selectCountMail", memId);
	}

	@Override
	public void updateReadCheck(MailVO mail) throws SQLException {
		session.update("Email-Mapper.updateReadCheck", mail);

	}

	@Override
	public void updateInboxMailDel(MailVO mail) throws SQLException {
		session.update("Email-Mapper.updateInboxMailDel", mail);

	}

	@Override
	public void updateSentInboxMailDel(MailVO mail) throws SQLException {
		log.debug("다오체크"+mail);
		session.update("Email-Mapper.updateSentInboxMailDel", mail);

	}

	@Override
	public void updateBinMailToReceive(MailVO mail) throws SQLException {
		
		session.update("Email-Mapper.updateBinMailToReceive", mail);

	}

	@Override
	public void updateBinMailToSent(MailVO mail) throws SQLException {
		session.update("Email-Mapper.updateBinMailToSent", mail);

	}

	@Override
	public List<ProfVO> getMajorProfListByStuId(String memId) throws SQLException {
		return session.selectList("Email-Mapper.getMajorProfListByStuId",memId);
	}

	@Override
	public List<ProfVO> getLecProfListByStuId(String memId) throws SQLException {
		return session.selectList("Email-Mapper.getLecProfListByStuId",memId);
	}

}
