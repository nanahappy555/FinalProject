package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.command.PageMakerLec;
import kr.or.ddit.controller.MakeFileName;
import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.stu.lec.MyLectureDAO;
import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.prof.MyLecSyllabusVO;
import kr.or.ddit.dto.prof.WeekNoticeVO;
import kr.or.ddit.dto.stu.AttendVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MyLectureServiceImpl implements MyLectureService {
	
	private MyLectureDAO myLectureDAO;
	public void setMyLectureDAO(MyLectureDAO myLectureDAO) {
		this.myLectureDAO = myLectureDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO=attachDAO;
	}
	
	@Override
	public MyLectureVO selectMyLectureInfo(String lecCd) throws SQLException {
		return myLectureDAO.selectMyLectureInfo(lecCd);
	}

	@Override
	public List<AttendVO> selectTotalAttendInfo(AttendVO attendVO) throws SQLException {
		
		return myLectureDAO.selectTotalAttendInfo(attendVO);
	}

	@Override
	public Map<String, Object> selectLecNoticeList(CriteriaLec cri) throws SQLException {
		List<LecNoticeVO> lecNoticeList=myLectureDAO.selectLecNoticeList(cri);
		 PageMakerLec pageMaker = new PageMakerLec();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(myLectureDAO.selectLectureNoticeTotalCountByLecCd(cri));
		 Map<String, Object> dataMap = new HashMap<String, Object>();
		 dataMap.put("lecNoticeList",lecNoticeList);
		 dataMap.put("pageMaker",pageMaker);
		return dataMap;
	}

	@Override
	public MyLecSyllabusVO selectMyLecSyllabus(String lecCd) throws SQLException {
		return myLectureDAO.selectMyLecSyllabus(lecCd);
	}

	@Override
	public List<MyLecSyllabusVO> selectMyLecWeekLearning(String lecCd) throws SQLException {
		return myLectureDAO.selectMyLecWeekLearning(lecCd);
	}

	@Override
	public List<WeekNoticeVO> selectMyLecWeekNotice(String lecCd) throws SQLException {
		

		List<WeekNoticeVO> weekNoticeList = myLectureDAO.selectMyLecWeekNotice(lecCd);
		log.debug("weekNoticeList : "+weekNoticeList);
		for(WeekNoticeVO weekNotice : weekNoticeList) {
			addAttachList(weekNotice);
			if(weekNotice!=null&&weekNotice.getAttachList()!=null) {
				for(AttachVO attach:weekNotice.getAttachList()) {
					String originalFileName
					= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
					attach.setFilename(originalFileName);
				}
			}
		}
		return weekNoticeList;
		
	}
	
	private void addAttachList(WeekNoticeVO weekNotice) throws SQLException {

		if (weekNotice == null)
			return;

		int anoCd = weekNotice.getAnoCd();
		log.debug("anoCd : "+anoCd);
		List<AttachVO> attachList = attachDAO.selectAttachList(anoCd);
		log.debug("attachList : "+attachList);

		weekNotice.setAttachList(attachList);
	}
	
	
	

}
