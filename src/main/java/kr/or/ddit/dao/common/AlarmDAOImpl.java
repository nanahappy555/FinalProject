package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.common.AlarmVO;

public class AlarmDAOImpl implements AlarmDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AlarmVO> selectUchkList(String memId) throws SQLException {
		List<AlarmVO> alarmList = session.selectList("Alarm-Mapper.selectUchkList",memId);
		return alarmList;
	}

	@Override
	public List<AlarmVO> selectChkList(String memId) throws SQLException {
		List<AlarmVO> alarmList = session.selectList("Alarm-Mapper.selectChkList",memId);
		return alarmList;
	}

	@Override
	public int selectAlarmUchkCount(String memId) throws SQLException {
		int count = session.selectOne("Alarm-Mapper.selectAlarmUchkCount",memId);
		return count;
	}
	
	@Override
	public void updateFromUchkToChk(String memId) throws SQLException {
		session.update("Alarm-Mapper.updateFromUchkToChk",memId);
	}
	
	//강의게시판 regist 시
	@Override
	public void insertAlarmFromLecture(AlarmVO alarm) throws SQLException {
		session.update("Alarm-Mapper.insertAlarmFromLecture", alarm);
	}
	//강의 문의게시판 답변 update 시
	@Override
	public void insertAlarmFromLectureQna(AlarmVO alarm) throws SQLException {
		session.update("Alarm-Mapper.insertAlarmFromLectureQna", alarm);
	}
	//문의게시판 답변 update 시
	@Override
	public void insertAlarmFromQna(AlarmVO alarm) throws SQLException {
		session.update("Alarm-Mapper.insertAlarmFromQna", alarm);
	}
	//학생이 교수에게 상담신청 시
	@Override
	public void insertAlarmFromNewCS(AlarmVO alarm) throws SQLException {
		session.update("Alarm-Mapper.insertAlarmFromNewCS", alarm);
	}
	//특정 신청이 승인됐을 때
	@Override
	public void insertAlarmFromApproved(AlarmVO alarm) throws SQLException {
		session.update("Alarm-Mapper.insertAlarmFromApproved", alarm);
	}
	
	@Override
	public void insertAlarm(AlarmVO alarm) throws SQLException {
		session.update("Alarm-Mapper.insertAlarm", alarm);
	}


	@Override
	public int selectAlarmSeqNext() {
		int alramSeq = session.selectOne("Alarm-Mapper.selectAlarmSeqNext");
		return alramSeq;
	}



}
