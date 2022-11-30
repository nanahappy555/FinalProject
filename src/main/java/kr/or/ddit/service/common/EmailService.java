package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.common.AddressBook;
import kr.or.ddit.dto.common.MailVO;
import kr.or.ddit.dto.common.MemberVO;

public interface EmailService {

	Map<String, Object> selectReceiveList(CriteriaLec cri) throws SQLException;
	Map<String, Object> selectSendList(CriteriaLec cri) throws SQLException;
	MailVO selectMailDetail(int noteSeq) throws SQLException;
	MailVO selectSentMailDetail(int sentNoteSeq) throws SQLException;
	
	int getCountMail(String memId) throws SQLException;
	int countReceiveMailList(CriteriaLec cri) throws SQLException;
	int countSentMailList(CriteriaLec cri) throws SQLException;
	
	
	void insertMailInfo(MailVO mail) throws SQLException;
	
	void updateReadCheck(MailVO mail) throws SQLException;
	void updateReceiveToBin(MailVO mail) throws SQLException;
	void updateSentToBin(MailVO mail) throws SQLException;
	
	void updateReturnReceive(MailVO mail) throws SQLException;
	void updateReturnSent(MailVO mail) throws SQLException;
	
	Map<String, List<MailVO>> selectBinList(String memId) throws SQLException;
	List<AddressBook> getAddressBookListByMemId(MemberVO member)throws SQLException;

}
