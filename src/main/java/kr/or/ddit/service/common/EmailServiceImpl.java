package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.command.PageMakerLec;
import kr.or.ddit.controller.MakeFileName;
import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.common.EmailDAO;
import kr.or.ddit.dto.common.AddressBook;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.MailVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.prof.ProfVO;
import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class EmailServiceImpl implements EmailService {
	@Autowired
	private EmailDAO emailDAO;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@Override
	public int getCountMail(String memId) throws SQLException {
		int count = emailDAO.selectCountMail(memId);
		return count;
	}
	
	@Override
	public Map<String, Object> selectReceiveList(CriteriaLec cri) throws SQLException {
		
		CriteriaLec receivecri = (CriteriaLec) cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<MailVO> receiveList = emailDAO.selectReceiveList(receivecri);
		log.debug("receiveList : "+receiveList);
		int countReceiveMailList = emailDAO.countReceiveMailList(receivecri);
		log.debug("토탈카운트 : " + countReceiveMailList);
		log.debug("크리테리아 : " + cri);
		PageMakerLec pageMaker = new PageMakerLec();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(countReceiveMailList);

		log.debug("페이지메이커 : " + pageMaker);
		dataMap.put("receiveList", receiveList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> selectSendList(CriteriaLec cri) throws SQLException {
		
		log.debug("서비스 : cri"+cri);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<MailVO> sentList = emailDAO.selectSendList(cri);
		
		int countSentMailList = emailDAO.countSentMailList(cri);
		
		PageMakerLec pageMaker = new PageMakerLec();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(countSentMailList);
		
		dataMap.put("sentList", sentList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, List<MailVO>> selectBinList(String memId) throws SQLException {
		Map<String, List<MailVO>> binList = new HashMap<String, List<MailVO>>();
		List<MailVO> receive = emailDAO.selectReceiveBin(memId);
		List<MailVO> sent = emailDAO.selectSentBin(memId);
		log.debug("y서비스확인"+receive.size());
		log.debug("서비스확인"+sent.size());
		binList.put("receive", receive);
		binList.put("sent", sent);
		
		return binList;
	}

	@Override
	public MailVO selectMailDetail(int noteSeq) throws SQLException {
		log.debug("노트:"+noteSeq);
		MailVO mailDetail = emailDAO.selectMailDetail(noteSeq);
		
		 log.debug("null체크:" + mailDetail);
		
		int anoCd = mailDetail.getAnoCd();
		log.debug("서비스체크1"+anoCd);
		List<AttachVO> selectAttachList = attachDAO.selectAttachList(anoCd);
		mailDetail.setAttachList(selectAttachList);
		
		if(mailDetail!=null&&mailDetail.getAttachList()!=null) {
			for(AttachVO attach:mailDetail.getAttachList()) {
				String originalFileName
					= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);
			}
		}
		log.debug("서비스체크2"+mailDetail);
		return mailDetail;
	}
	
	@Override
	public MailVO selectSentMailDetail(int sentNoteSeq) throws SQLException {
		log.debug("노트:"+sentNoteSeq);
		MailVO mailDetail = emailDAO.selectSentMailDetail(sentNoteSeq);
		
		log.debug("null체크:" + mailDetail);
		
		int anoCd = mailDetail.getAnoCd();
		log.debug("서비스체크1"+anoCd);
		List<AttachVO> selectAttachList = attachDAO.selectAttachList(anoCd);
		mailDetail.setAttachList(selectAttachList);
		
		if(mailDetail!=null&&mailDetail.getAttachList()!=null) {
			for(AttachVO attach:mailDetail.getAttachList()) {
				String originalFileName
				= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);
			}
		}
		log.debug("서비스체크2"+mailDetail);
		return mailDetail;
	}

	@Override
	public void insertMailInfo(MailVO mail) throws SQLException {
		int anoCd = attachDAO.selectAnoNextval();//--------------------------@2
		
		if (mail.getAttachList() != null) {//--------------------------------@1
			int anoSeq=1;
			for (AttachVO attach : mail.getAttachList()) {
				attach.setAnoCd(anoCd);
				attach.setAnoSeq(anoSeq);
				attachDAO.insertAttach(attach);
				anoSeq++;
			}
		}
		
		
		mail.setAnoCd(anoCd);
		
		int noteSeq = emailDAO.selectNoteSeqNextVal();
		mail.setNoteSeq(noteSeq);
		emailDAO.insertReceiveInfo(mail);
		
		
		
		int sentNoteSeq = emailDAO.selectSentNoteSeqNextVal();
		mail.setSentNoteSeq(sentNoteSeq);
		
		
		emailDAO.insertSendMailInfo(mail);
		return;

	}

	@Override
	public void updateReadCheck(MailVO mail) throws SQLException {
		emailDAO.updateReadCheck(mail);
		
	}

	@Override
	public void updateReceiveToBin(MailVO mail) throws SQLException {
		emailDAO.updateInboxMailDel(mail);
		
	}
	@Override
	public void updateSentToBin(MailVO mail) throws SQLException {
		log.debug("서비스체크"+mail);
		emailDAO.updateSentInboxMailDel(mail);
		
	}

	@Override
	public void updateReturnReceive(MailVO mail) throws SQLException {
		emailDAO.updateBinMailToReceive(mail);

	}
	@Override
	public void updateReturnSent(MailVO mail) throws SQLException {
		emailDAO.updateBinMailToSent(mail);
		
	}

	@Override
	public int countReceiveMailList(CriteriaLec cri) throws SQLException {
		int count = emailDAO.countReceiveMailList(cri);
		return count;
	}

	@Override
	public int countSentMailList(CriteriaLec cri) throws SQLException {
		int count = emailDAO.countSentMailList(cri);
		return count;
	}

	@Override
	public List<AddressBook> getAddressBookListByMemId(MemberVO member) throws SQLException {
		String memId = member.getMemId();
		
		List<AddressBook> addrBookList = new ArrayList<AddressBook>();
		if(member.getMemClassCd().equals("stu")) {
			AddressBook majProfAddrBook = new AddressBook();
			majProfAddrBook.setTitle("학과 교수");
			majProfAddrBook.setKey("majProf");
			majProfAddrBook.setFolder(true);
			List<ProfVO> majProfList = emailDAO.getMajorProfListByStuId(memId);
			List<AddressBook> majProfChildren = new ArrayList<AddressBook>();
			for(ProfVO prof : majProfList) {
				String profName = prof.getName();
				String profId = prof.getProfCd();
				AddressBook addr = new AddressBook();
				addr.setTitle(profName);
				addr.setCheckbox(true);
				addr.setContent(profId);
				addr.setKey("maj"+profId);
				majProfChildren.add(addr);
			}
			majProfAddrBook.setChildren(majProfChildren);
			
			AddressBook lecProfAddrBook = new AddressBook();
			lecProfAddrBook.setTitle("수업 교수");
			lecProfAddrBook.setKey("lecProf");
			lecProfAddrBook.setFolder(true);
			List<ProfVO> lecProfList = emailDAO.getLecProfListByStuId(memId);
			List<AddressBook> lecProfChildren = new ArrayList<AddressBook>();
			for(ProfVO prof : lecProfList) {
				String profName = prof.getName();
				String profId = prof.getProfCd();
				AddressBook addr = new AddressBook();
				addr.setTitle(profName);
				addr.setCheckbox(true);
				addr.setContent(profId);
				addr.setKey("lec"+profId);
				lecProfChildren.add(addr);
			}
			lecProfAddrBook.setChildren(lecProfChildren);
			
			addrBookList.add(majProfAddrBook);
			addrBookList.add(lecProfAddrBook);
		}
		
		
		return addrBookList;
	}


}
