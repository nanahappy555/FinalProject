package kr.or.ddit.dao.prof;

import java.sql.SQLException;

import kr.or.ddit.dto.prof.WeekNoticeVO;

public interface WeekNoticeDAO {
	public void InsertWeekNotice(WeekNoticeVO vo)throws SQLException;

	public WeekNoticeVO selectMaterialDetail(WeekNoticeVO vo);

	public void updateWeekNotice(WeekNoticeVO vo) throws SQLException;
}
