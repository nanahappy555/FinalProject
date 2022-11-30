package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.common.AlarmVO;

public interface AlarmService {
	
	Map<String,List<AlarmVO>> getAlarmList(String memId)throws SQLException;

	void updateCheckAlarm(String memId) throws SQLException;


//	void registAlarm(AlarmVO alarm)throws SQLException;
}
