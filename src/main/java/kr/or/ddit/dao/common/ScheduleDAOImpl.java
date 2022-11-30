package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.common.ScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ScheduleDAOImpl implements ScheduleDAO {
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<ScheduleVO> selectScheduleById() throws SQLException {
		return session.selectList("Schedule-Mapper.selectScheduleById");
	}
	@Override
	public void insertCalendar(ScheduleVO schedule) {
		session.insert("Schedule-Mapper.insertCalendar",schedule);
	}
	@Override
	public void updateCalendar(ScheduleVO schedule) throws SQLException {
		log.debug("schedule : "+schedule);
		session.update("Schedule-Mapper.updateCalendar",schedule);
	}
	@Override
	public void deleteCalendar(String scheId) throws SQLException {
		session.delete("Schedule-Mapper.deleteCalendar",scheId);
	}

}
