package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.common.MailVO;
import kr.or.ddit.dto.prof.ProfVO;

public interface EmailDAO {

	List<MailVO> selectReceiveList(CriteriaLec cri) throws SQLException;
	List<MailVO> selectSendList(CriteriaLec cri) throws SQLException;
	MailVO selectMailDetail(int noteSeq) throws SQLException;
	MailVO selectSentMailDetail(int sentNoteSeq) throws SQLException;
	
	List<MailVO> selectReceiveBin(String memId) throws SQLException;
	List<MailVO> selectSentBin(String memId) throws SQLException;
	
	void insertReceiveInfo(MailVO mail) throws SQLException;
	void insertSendMailInfo(MailVO mail) throws SQLException;
	int selectNoteSeqNextVal() throws SQLException;
	int selectSentNoteSeqNextVal() throws SQLException;
	int selectCountMail(String memId) throws SQLException;
	void updateReadCheck(MailVO mail) throws SQLException;
	void updateInboxMailDel(MailVO mail) throws SQLException;
	void updateSentInboxMailDel(MailVO mail) throws SQLException;
	void updateBinMailToReceive(MailVO mail) throws SQLException;
	void updateBinMailToSent(MailVO mail) throws SQLException;
	int countReceiveMailList(CriteriaLec cri) throws SQLException;
	int countSentMailList(CriteriaLec cri) throws SQLException;
	List<ProfVO> getMajorProfListByStuId(String memId) throws SQLException;
	List<ProfVO> getLecProfListByStuId(String memId)throws SQLException;
}
