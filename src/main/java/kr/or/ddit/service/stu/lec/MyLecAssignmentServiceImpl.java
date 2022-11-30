package kr.or.ddit.service.stu.lec;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.command.PageMakerLec;
import kr.or.ddit.controller.MakeFileName;
import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.stu.lec.LecDAO;
import kr.or.ddit.dao.stu.lec.MyLecAssignmentDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MyLecAssignmentServiceImpl implements MyLecAssignmentService {
	MyLecAssignmentDAO myLecAssignmentDAO;
	public void setMyLecAssignmentDAO(MyLecAssignmentDAO myLecAssignmentDAO) {
		this.myLecAssignmentDAO=myLecAssignmentDAO;
	}
	
	AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO=attachDAO;
	}
	LecDAO lecDAO;
	public void setLecDAO(LecDAO lecDAO) {
		this.lecDAO=lecDAO;
	}
	
	@Override
	public  Map<String, Object> selectMyAssignmentList(CriteriaLec cri) throws SQLException{
		List<MyLecAssignmentVO> assignmentList=myLecAssignmentDAO.selectMyAssignmentList(cri);
		for(MyLecAssignmentVO abc: assignmentList) {
			
			log.debug("abc : "+abc.getSubEvalStatusCd());
			log.debug("abc : "+abc.getCreateDate());
		}
		log.debug("cri : "+cri);
		log.debug("assignmentList size: "+assignmentList.size());
		 PageMakerLec pageMaker = new PageMakerLec();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(myLecAssignmentDAO.selectMyAssignmentTotalCount(cri));
		 Map<String, Object> dataMap = new HashMap<String, Object>();
		 log.debug("assignmentList : "+assignmentList);
		 dataMap.put("assignmentList",assignmentList);
		 dataMap.put("pageMaker",pageMaker);
		 
		 return dataMap;
	}

	@Override
	public MyLecAssignmentVO selectMyAssignMentFromList(int assBno) throws SQLException{
		MyLecAssignmentVO lecAssign = myLecAssignmentDAO.selectMyAssignMent(assBno);
		log.debug("lecAssign1 : "+lecAssign);
		myLecAssignmentDAO.increaseAssignmentViewCnt(assBno);
		log.debug("lecAssign2 : "+lecAssign);
		addAttachList(lecAssign);
		
		return lecAssign;
	}
	
	@Override
	public MyLecAssignmentVO selectMyAssignMent(int assBno) throws SQLException{
		
		MyLecAssignmentVO lecAssign = myLecAssignmentDAO.selectMyAssignMent(assBno);
		log.debug("lecAssign : "+lecAssign);
		addAttachList(lecAssign);
		if(lecAssign!=null&&lecAssign.getAttachList()!=null) {
			for(AttachVO attach:lecAssign.getAttachList()) {
				String originalFileName
					= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);
			}
		}
		return lecAssign;
	}
	
	private void addAttachList(MyLecAssignmentVO lecAssign) throws SQLException {

		if (lecAssign == null)
			return;

		int anoCd = lecAssign.getAnoCd();
		log.debug("anoCd : "+anoCd);
		List<AttachVO> attachList = attachDAO.selectAttachList(anoCd);

		lecAssign.setAttachList(attachList);
	}

	@Override
	public void submitAssign(MyLecAssignmentVO assSub) throws SQLException {
		//attach 테이블 db내용 추가
		MyLecAssignmentVO oldAssSub = myLecAssignmentDAO.selectAssSubmit(assSub);
		log.debug("oldAssSub : "+oldAssSub);
		if(oldAssSub==null) {
			if (assSub.getAttachList() != null) {
				int anoCd = attachDAO.selectAnoNextval();
				log.debug("다오 anoCd : "+assSub.getAnoCd());
				int anoSeq=1;
				for (AttachVO attach : assSub.getAttachList()) {
					attach.setAnoCd(anoCd);
					attach.setAnoSeq(anoSeq);
					attachDAO.insertAttach(attach);
					anoSeq++;
				}
				assSub.setAnoCd(anoCd);
			}
				myLecAssignmentDAO.insertAssSubmit(assSub);
		}
		else if(oldAssSub!=null) {
			if (assSub.getAttachList() != null) {
				int anoCd =  oldAssSub.getAnoCd();
				int anoSeq  = attachDAO.selectMaxAnoSeq(anoCd);
				if(anoSeq==0) {
					anoSeq=1;
				}
				log.debug("다오 anoCd : "+assSub.getAnoCd());
				for (AttachVO attach : assSub.getAttachList()) {
					attach.setAnoCd(anoCd);
					attach.setAnoSeq(anoSeq);
					attachDAO.insertAttach(attach);
					anoSeq++;
				}
			}
			myLecAssignmentDAO.updateAssSubmit(assSub);
		}
		
		
	}

	

	@Override
	public MyLecAssignmentVO selectAssSubmit(MyLecAssignmentVO assSub) throws SQLException {
		MyLecAssignmentVO myAssignSub =  myLecAssignmentDAO.selectAssSubmit(assSub);
		addAttachList(myAssignSub);
		if(myAssignSub!=null&&myAssignSub.getAttachList()!=null) {
			for(AttachVO attach:myAssignSub.getAttachList()) {
				String originalFileName
					= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);
			}
		}
		return myAssignSub;
	}


	@Override
	public List<MyLecAssignmentVO> selectBoardAssignmentList(CriteriaLec cri) throws SQLException {
		List<String> lecCdList = lecDAO.selectLecCdListByStuCd(cri.getStuCd());
		List<MyLecAssignmentVO> boardLecAssignList = new ArrayList<MyLecAssignmentVO>();
		for(String lecCd : lecCdList) {
			cri.setLecCd(lecCd);
			cri.setPage(1);
			cri.setPerPageNum(2);
			List<MyLecAssignmentVO> boardLecAssign = myLecAssignmentDAO.selectMyAssignmentList(cri);
			log.debug("boardLecAssign : "+boardLecAssign);
			if(boardLecAssign!=null && boardLecAssign.size()>=1) {
				boardLecAssignList.add(boardLecAssign.get(0));
			}
		}
		for(String lecCd : lecCdList) {
			cri.setLecCd(lecCd);
			cri.setPage(1);
			cri.setPerPageNum(2);
			List<MyLecAssignmentVO> boardLecAssign = myLecAssignmentDAO.selectMyAssignmentList(cri);
			log.debug("boardLecAssign : "+boardLecAssign);
			if(boardLecAssign!=null && boardLecAssign.size()>=2) {
				boardLecAssignList.add(boardLecAssign.get(1));
			}
		}
		return boardLecAssignList;
	}

	@Override
	public void deleteAssSubmit(AttachVO attach) throws SQLException {
		if(attach!=null) {
			AttachVO subAttach = attachDAO.selectAttach(attach);
			attachDAO.deleteAttach(attach);
			String fileName = subAttach.getFilename();
			
			String uploadFilePath = subAttach.getUploadpath();
			File file = new File(uploadFilePath+File.separator+fileName);
			if(file.exists()) {
				file.delete();
			}
			
		}
	}

	

}
