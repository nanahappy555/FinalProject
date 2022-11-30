package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.ScheduleVO;

public interface ScheduleDAO {
	
	List<ScheduleVO> selectScheduleById() throws SQLException;

	void insertCalendar(ScheduleVO schedule) throws SQLException;

	void updateCalendar(ScheduleVO schedule) throws SQLException;

	void deleteCalendar(String scheId)throws SQLException;
}
