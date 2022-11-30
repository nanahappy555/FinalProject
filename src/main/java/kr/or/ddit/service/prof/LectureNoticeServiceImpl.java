package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.command.PageMakerLec;
import kr.or.ddit.dao.common.AlarmDAO;
import kr.or.ddit.dao.prof.LectureNoticeDAO;
import kr.or.ddit.dao.stu.lec.LecDAO;
import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.AlarmVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class LectureNoticeServiceImpl implements LectureNoticeService{

	@Autowired
	private LectureNoticeDAO lectureNoticeDAO;
	public void setLectureNoticeDAO(LectureNoticeDAO lectureNoticeDAO) {
		this.lectureNoticeDAO = lectureNoticeDAO;
	}
	
	@Autowired
	private LecDAO lecDAO;
	public void setLecDAO(LecDAO lecDAO) {
		this.lecDAO = lecDAO;
	}

	@Autowired
	private AlarmDAO alarmDAO;
	public void setAlarmDAO(AlarmDAO alarmDAO) {
		this.alarmDAO = alarmDAO;
	}
	
	@Override
	public Map<String, Object> getLectureNoticeList(CriteriaLec cri) throws SQLException {
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<LecNoticeVO> noticeList = lectureNoticeDAO.selectLectureNoticeListByLecCd(cri);
		
		int totalCount = lectureNoticeDAO.selectLectureNoticeTotalCountByLecCd(cri);
		
		PageMakerLec pageMaker = new PageMakerLec();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("noticeList",noticeList);
		dataMap.put("pageMaker",pageMaker);
		
		return dataMap;
	}

	@Override
	public LecNoticeVO getLectureNotice(LecNoticeVO lecNotice) throws SQLException {
		LecNoticeVO notice = lectureNoticeDAO.selectLectureNoticeByLecNoticeNo(lecNotice);
		lectureNoticeDAO.increaseViewCnt(lecNotice.getLecNoticeNo());
		return notice;
	}

	@Override
	public LecNoticeVO getLectureNoticeForModify(LecNoticeVO lecNotice) throws SQLException {
		LecNoticeVO notice = lectureNoticeDAO.selectLectureNoticeByLecNoticeNo(lecNotice);
		return notice;
	}

	@Override
	public void regist(LecNoticeVO lecNotice) throws SQLException {
		//게시글 등록
		int lecNoticeNo = lectureNoticeDAO.selectLectureNoticeSeqNext();
		lecNotice.setLecNoticeNo(lecNoticeNo);
		lectureNoticeDAO.insertLectureNotice(lecNotice);
		
		//알림 등록할 수강생 목록
		String lecCd = lecNotice.getLecCd();
		List<String> stuCdList = lecDAO.selectStuCdListByLecCd(lecCd);
		
		for(String memId : stuCdList) {
			
			//DB 알림 등록
			int alarmSeq = alarmDAO.selectAlarmSeqNext();
			
			AlarmVO alarm = new AlarmVO();
			alarm.setAlarmSeq(alarmSeq); //알람seq
			alarm.setMemId(memId);	//회원아이디
			alarm.setSylCd(lecCd); //강의코드
			alarm.setBoardName(" - 공지게시판"); //현재 게시판
			alarmDAO.insertAlarmFromLecture(alarm);
		}
		
		
	}

	@Override
	public void modify(LecNoticeVO lecNotice) throws SQLException {
		lectureNoticeDAO.updateLectureNotice(lecNotice);
	}

	@Override
	public void delete(int lecNoticeNo) throws SQLException {
		lectureNoticeDAO.deleteLectureNotice(lecNoticeNo);
		
	}



	
}
