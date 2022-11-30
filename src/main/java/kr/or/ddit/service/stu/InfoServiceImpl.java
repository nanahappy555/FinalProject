package kr.or.ddit.service.stu;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.stu.InfoDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.AcaVO;
import kr.or.ddit.dto.stu.ClubVO;
import kr.or.ddit.dto.stu.StuColMajor;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class InfoServiceImpl implements InfoService{

	
	private InfoDAO infoDAO;
	private AttachDAO attachDAO;
	
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO=attachDAO;
	}
	
	public void setInfoDaO(InfoDAO infoDAO) {
		this.infoDAO = infoDAO;
	}

	@Override
	public StudentVO getInfo(String id) throws SQLException {
		StudentVO selectInfo = infoDAO.selectInfo(id);
		return selectInfo;
	}
	
	@Override
	public void modifyInfo(StudentVO student) throws SQLException {
		
		List<AttachVO> attachList = student.getAttachList();
		log.debug(attachList+"리스트 확인");
		if(attachList!=null && attachList.size()>0) {
			//먼저 파일 지우고, db 지우기
			int anoCd = student.getAnoCd();
			List<AttachVO> oldAttachList = attachDAO.selectAttachList(anoCd);
			for(AttachVO oldAttach : oldAttachList) {
				String fileName = oldAttach.getFilename();
				String uploadPath = oldAttach.getUploadpath();
				String filePath = uploadPath + 
						File.separator +fileName;
				File file = new File(filePath);
				if(file.exists()) {
					file.delete();
				}
				attachDAO.deleteAttach(oldAttach);
			}
			
			int anoSeq=1;
			for(AttachVO newAttach:attachList) {
				newAttach.setAnoCd(anoCd);
				newAttach.setAnoSeq(anoSeq);
				attachDAO.insertAttach(newAttach);
				anoSeq++;
				
			}
			
		}
		
		infoDAO.updateInfo(student);
	}
	
	
	@Override
	public void modifyAccount(StudentVO student) throws SQLException {
		infoDAO.updateAccount(student);
		
	}
	@Override
	public StuColMajor getStuColMajorInfo(String stuCd) throws SQLException {
		return infoDAO.selectStuColMajorInfo(stuCd);
	}

	@Override
	public List<AcaVO> selectAllAcaRecord(String stuCd) throws SQLException {
		return infoDAO.selectAllAcaRecord(stuCd);
	}

	@Override
	public List<ClubVO> selectClubList() throws SQLException {
		List<ClubVO> clubList =  infoDAO.selectClubList();
		log.debug("서비스 clubList : "+clubList);
		return clubList;
	}

	@Override
	public void updateMbti(StudentVO stu) throws SQLException {
		infoDAO.updateMbti(stu);
	}

	@Override
	public Boolean checkInfo(MemberVO member) throws SQLException {
		Boolean chkFlag = false;
		MemberVO chkMember = infoDAO.checkInfo(member);
		if(chkMember!=null) {
			chkFlag=true;
		}
		return chkFlag; 
	}
}
