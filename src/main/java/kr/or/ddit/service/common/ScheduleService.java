package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.Map;

public interface ScheduleService {
	Map<String,Object> selectScheduleById() throws SQLException;

	void insertCalendar(Map<String, Object> calendarData) throws SQLException;

	void updateCalendar(Map<String, Object> calendarData) throws SQLException;

	void deleteCalendar(String scheId)throws SQLException;
}
