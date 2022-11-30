package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.common.AlarmDAO;
import kr.or.ddit.dto.common.AlarmVO;

public class AlarmServiceImpl implements AlarmService {

	private AlarmDAO alarmDAO;
	public void setAlarmDAO(AlarmDAO alarmDAO) {
		this.alarmDAO = alarmDAO;
	}
	
	@Override
	public Map<String,List<AlarmVO>> getAlarmList(String memId) throws SQLException {
		
		Map<String, List<AlarmVO>> alarmMap = new HashMap<String, List<AlarmVO>>();
		
		List<AlarmVO> uchkList = alarmDAO.selectUchkList(memId);
		List<AlarmVO> chkList = alarmDAO.selectChkList(memId);
		
		alarmMap.put("uchkList", uchkList);
		alarmMap.put("chkList", chkList);
		
		return alarmMap;
	}
	
	@Override
	public void updateCheckAlarm(String memId) throws SQLException{
		alarmDAO.updateFromUchkToChk(memId);
	}
	
	
//	@Override //regist는 여기서 안 함...
//	public void registAlarm(AlarmVO alarm) throws SQLException {
//		int alarmSeq = alarmDAO.selecAlarmSeqNext();
//		alarm.setAlarmSeq(alarmSeq);
//		alarmDAO.insertAlarm(alarm);
//	}
	
}
