package kr.or.ddit.service.stu.support;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.controller.MakeFileName;
import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.prof.LecManageDAO;
import kr.or.ddit.dao.stu.support.RecoRepoDAO;
import kr.or.ddit.dao.stu.support.ShareDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.prof.LecManageVO;
import kr.or.ddit.dto.stu.RecoRepoVO;
import kr.or.ddit.dto.stu.StudyShareVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ShareServiceImpl implements ShareService {
	
	@Autowired
	private ShareDAO shareDAO;
	public void setShareDAO (ShareDAO shareDAO) {
		this.shareDAO = shareDAO;
	}
	
	@Autowired
	private RecoRepoDAO recoRepoDAO;
	public void setRecoRepoDAO(RecoRepoDAO recoRepoDAO) {
		this.recoRepoDAO = recoRepoDAO;
	}

	@Autowired
	private LecManageDAO lecManageDAO;
	public void setLecManageDAO(LecManageDAO lecManageDAO) {
		this.lecManageDAO = lecManageDAO;
	}
	
	@Autowired
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public Map<String,Object> getShareList(Criteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<StudyShareVO> shareAllList = shareDAO.selectShareByAll(cri);
		int totalCount = shareDAO.selectAllTotalCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("shareAllList", shareAllList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String,Object> getShareListByLec(Criteria cri) throws SQLException {
		String searchType = cri.getSearchType();
		String keyword = cri.getKeyword();
		
		if(searchType!=null && searchType.equals("l")) {
			String newKeyword = shareDAO.selectLecCdBySubjName(keyword);
			cri.setKeyword(newKeyword);
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<StudyShareVO> shareLecList = shareDAO.selectShareByLec(cri);
		int totalCount = shareDAO.selectLecTotalCount(cri);
		
		cri.setKeyword(keyword);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("shareLecList", shareLecList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public List<StudyShareVO> getShareOrderByReco() throws SQLException {
		return shareDAO.selectShareOrderByReco();
	}

	@Override
	public List<StudyShareVO> getShareByLecOrderByReco() throws SQLException {
		return shareDAO.selectShareByLecOrderByReco();
	}
	
	@Override
	public StudyShareVO getShare(int shaBno) throws SQLException{
		StudyShareVO share = shareDAO.selectShare(shaBno);
		shareDAO.increaseViewCnt(shaBno);
		return share;
	}
	@Override
	public StudyShareVO getShareForModify(int shaBno) throws SQLException{
		StudyShareVO share = shareDAO.selectShare(shaBno);
		
		//ano_cd
		Integer anoCd = share.getAnoCd();
		
		log.debug("확인용~~~~~"+anoCd);
		
		List<AttachVO> attachList = attachDAO.selectAttachList(anoCd);
		share.setAttachList(attachList);
		
		if(share != null && share.getAttachList() != null) {
			for(AttachVO attach : share.getAttachList()) {
				String originalFileName = MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);
			}
		}
		
		return share;
	}

	@Override
	public LecManageVO registForm(String sylCd) throws SQLException {
		LecManageVO vo = lecManageDAO.selectLecManageBySlyCd(sylCd);
		return vo;
	}

	@Override
	public void registShare(StudyShareVO studyShare) throws SQLException {
		
		int shaBno = shareDAO.selectShareSeqNext();
		studyShare.setShaBno(shaBno);
		
		if(studyShare.getLecCd().equals("SYL0000")) {
			studyShare.setBoardDivCd("all");			
		}else {
			studyShare.setBoardDivCd("lec");			
			
		}
//		log.debug("엥왜안됨"+studyShare);
		
		int anoCd = attachDAO.selectAnoNextval();
		
		if(studyShare.getAttachList() != null) {
			int anoSeq=1;
			for(AttachVO attach : studyShare.getAttachList()) {
				attach.setAnoCd(anoCd);
				attach.setAnoSeq(anoSeq);
				attachDAO.insertAttach(attach);
			}
		}
		shareDAO.insertShare(studyShare);
	}
	
	@Override
	public void modifyShare(StudyShareVO studyShare) throws SQLException {
		shareDAO.updateShare(studyShare);
	}


	@Override
	public String recommendShare(RecoRepoVO recoRepo) throws SQLException {
		String msg = "";
		//stuCd, shBno로 추천/신고 null 확인
		int shaBno = recoRepo.getShaBno();
		int count = recoRepoDAO.selectCountRecoRepo(recoRepo);
		
		//null
		if(count == 0) {
			//추천/신고한 적이 없음
			recoRepoDAO.insertRecoRepo(recoRepo);
			shareDAO.increaseRecoNum(shaBno);
			
			msg = "추천되었습니다.";
		
		}else {
			RecoRepoVO resultVO = recoRepoDAO.selectRecoRepo(recoRepo);
			
			if(resultVO.getRecoChk().equals("uchk")) {
				//추천한 적이 없음(신고만 했음)
				recoRepoDAO.updateReco(recoRepo);
				shareDAO.increaseRecoNum(shaBno);
				
				msg = "추천되었습니다.";
				
			}else if(resultVO.getRecoChk().equals("chk")) {
				//추천했음
				msg = "이미 추천한 글입니다.";
				
			}
		}
		return msg;
	}


	@Override
	public String reportShare(RecoRepoVO recoRepo) throws SQLException {
		String msg = "";
		//stuCd, shaBno로 추천/신고 null 확인
		int count = recoRepoDAO.selectCountRecoRepo(recoRepo);
		
		int shaBno = recoRepo.getShaBno();
		
		//null
		if(count == 0) {
			//추천/신고한 적이 없음
			recoRepoDAO.insertRecoRepo(recoRepo);
			shareDAO.increaseReportCnt(shaBno);
			int repoCnt = shareDAO.selectReportCnt(shaBno);
			if (repoCnt >= 5) {
				shareDAO.updateAvailable(shaBno);
				return msg = "신고되었습니다. 5회 신고된 글은 비활성화 됩니다.";
			}
			
			msg = "신고되었습니다.";
		
		}else {
			RecoRepoVO resultVO = recoRepoDAO.selectRecoRepo(recoRepo);
			
			if(resultVO.getRepoChk().equals("uchk")) {
				//신고한 적이 없음(추천만 했음)
				recoRepoDAO.updateRepo(recoRepo);
				shareDAO.increaseReportCnt(shaBno);
				int repoCnt = shareDAO.selectReportCnt(shaBno);
				if (repoCnt >= 5) {
					shareDAO.updateAvailable(shaBno);
					
					return msg = "신고되었습니다. 5회 신고된 글은 비활성화 됩니다.";
					
				}
				
				msg = "신고되었습니다.";
				
			}else if(resultVO.getRepoChk().equals("chk")) {
				//신고했음
				msg = "이미 신고한 글입니다.";
				
			}
		}
		return msg;
	}

	
	
	
	
}
