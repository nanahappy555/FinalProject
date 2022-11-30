package kr.or.ddit.service.stu.aca;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.stu.aca.TlApplyDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.CommCdVO;
import kr.or.ddit.dto.stu.AcaStatusVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.dto.stu.TlApplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TlApplyServiceImpl implements TlApplyService {

	private TlApplyDAO tlApplyDAO;

	private AttachDAO attachDAO;
	
	public void setTlApplyDAO(TlApplyDAO tlApplyDAO) {
		this.tlApplyDAO = tlApplyDAO;
	}
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO= attachDAO;
	}	

	@Override
	public List<TlApplyVO> getTlListByStuId(String stuCd) throws SQLException {
		List<TlApplyVO> tlListByStuId = tlApplyDAO.selectTlListById(stuCd);
		return tlListByStuId;
	}

	@Override
	public List<CommCdVO> getTlClassReason() throws SQLException {
		return tlApplyDAO.selectTlClassReason();
	}

	@Override
	public void insertTlApply(TlApplyVO tlApplyVO) throws SQLException {

		String tlAppYear = tlApplyVO.getTlAppYear();
		String tlAppSeme = tlApplyVO.getTlAppSeme();
		tlAppSeme = tlAppYear + tlAppSeme;
		String backYear = tlApplyVO.getBackYear();
		String backSeme = tlApplyVO.getBackSeme();
		backSeme = backYear + backSeme;
		tlApplyVO.setTlAppSeme(tlAppSeme);
		tlApplyVO.setBackSeme(backSeme);
		String stuCd = tlApplyVO.getStuId();
		String semeCd = tlApplyVO.getSemeCd();
		StudentVO student = new StudentVO();
		student.setStuCd(stuCd);
		student.setSemeCd(semeCd);
		//attach 테이블 db내용 추가
		if (tlApplyVO.getAttachList() != null) {
			int anoCd = attachDAO.selectAnoNextval();
			int anoSeq=1;
			for (AttachVO attach : tlApplyVO.getAttachList()) {
				attach.setAnoCd(anoCd);
				attach.setAnoSeq(anoSeq);
				attachDAO.insertAttach(attach);
				anoSeq++;
			}
			tlApplyVO.setAnoCd(anoCd);
		}
		
		int tlApplySeq = tlApplyDAO.tlApplyDuplicateCheck(student);
		if (tlApplySeq > 0) {
			tlApplyVO.setTlApplySeq(tlApplySeq);
			log.info("tlApplyVO확인"+tlApplyVO);
			tlApplyDAO.updateTlApply(tlApplyVO);

		} else {
			int tlApplyNo = tlApplyDAO.selectTlApplyNoNextVal();
			tlApplyVO.setTlApplySeq(tlApplyNo);
			log.info("tlApplyVO확인"+tlApplyVO);
			tlApplyDAO.insertTlApply(tlApplyVO);
		}

	}
	@Override
	public List<AcaStatusVO> getBackListByStuId(String stuCd) throws SQLException {
		return tlApplyDAO.selectBackListById(stuCd);
	}
	@Override
	public void applyBack(AcaStatusVO backVO) throws SQLException {
		
		String stuCd = backVO.getStuId();
		String semeCd = backVO.getSemeCd();
		StudentVO student = new StudentVO();
		student.setStuCd(stuCd);
		student.setSemeCd(semeCd);
		
		//attach 테이블 db내용 추가
		if (backVO.getAttachList() != null) {
			int anoCd = attachDAO.selectAnoNextval();
			int anoSeq=1;
			for (AttachVO attach : backVO.getAttachList()) {
				attach.setAnoCd(anoCd);
				attach.setAnoSeq(anoSeq);
				attachDAO.insertAttach(attach);
				anoSeq++;
			}
			backVO.setAnoCd(anoCd);
		}
		
		int backApplySeq = tlApplyDAO.backApplyDuplicateCheck(student);
		if (backApplySeq > 0) {
			backVO.setAcaChangeSeq(backApplySeq);
			log.info("backVO확인"+backVO);
			tlApplyDAO.updateBackApply(backVO);

		} else {
			int backApplyNo = tlApplyDAO.selectAcaChangeSeq();
			backVO.setAcaChangeSeq(backApplyNo);
			log.info("backVO확인"+backVO);
			tlApplyDAO.insertBackApply(backVO);
		}
	}
	@Override
	public void deleteBackApply(int acaChangeSeq) throws SQLException {
		AcaStatusVO backApply = tlApplyDAO.selectBackApply(acaChangeSeq);
		int anoCd = backApply.getAnoCd();
		List<AttachVO> attachList = attachDAO.selectAttachList(anoCd);
		if(attachList!=null && attachList.size()!=0) {
			for(AttachVO attach:attachList) {
				String uuidFileName =attachDAO.selectAttach(attach).getFilename();
				String storedFilePath = attach.getUploadpath() + File.separator+uuidFileName;
				File file = new File(storedFilePath);
				
				if(file.exists()) {
					file.delete();
				}
			}
			attachDAO.deleteAllAttach(anoCd);
		}
		tlApplyDAO.deleteBackApply(acaChangeSeq);
	
	}
	@Override
	public void deleteTlApply(int tlApplySeq) throws SQLException{
		TlApplyVO tlApply= tlApplyDAO.selectTlApply(tlApplySeq);
		int anoCd = tlApply.getAnoCd();
		List<AttachVO> attachList = attachDAO.selectAttachList(anoCd);
		if(attachList!=null&&attachList.size()!=0) {
			for(AttachVO attach:attachList) {
				String uuidFileName = attachDAO.selectAttach(attach).getFilename();
				String storedFilePath = attach.getUploadpath() + File.separator+uuidFileName;
				File file = new File(storedFilePath);
				
				if(file.exists()) {
					file.delete();
				}
			}
			attachDAO.deleteAllAttach(anoCd);
		}
		tlApplyDAO.deleteTlApply(tlApplySeq);
	}

}
