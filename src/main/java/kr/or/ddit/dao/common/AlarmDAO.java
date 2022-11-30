package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.AlarmVO;

public interface AlarmDAO {
	
	List<AlarmVO> selectUchkList(String memId)throws SQLException;
	
	List<AlarmVO> selectChkList(String memId)throws SQLException;

	int selectAlarmUchkCount(String memId)throws SQLException;
	
	void updateFromUchkToChk(String memId)throws SQLException;
	
	//강의게시판 regist 시
	void insertAlarmFromLecture(AlarmVO alarm)throws SQLException;
	//강의 문의게시판 답변 update 시
	void insertAlarmFromLectureQna(AlarmVO alarm)throws SQLException;
	
	//문의게시판 답변 update 시
	void insertAlarmFromQna(AlarmVO alarm)throws SQLException;
	
	//학생이 교수에게 상담신청 시
	void insertAlarmFromNewCS(AlarmVO alarm)throws SQLException;
	//특정 신청이 승인됐을 때
	void insertAlarmFromApproved(AlarmVO alarm)throws SQLException;
	
	void insertAlarm(AlarmVO alarm)throws SQLException;

	int selectAlarmSeqNext()throws SQLException;
}
