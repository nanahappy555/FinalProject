package kr.or.ddit.service.prof;

import java.sql.SQLException;

import kr.or.ddit.dto.prof.WeekNoticeVO;

public interface WeekNoticeService {

	public void registWeekNotice(WeekNoticeVO vo) throws SQLException;

	public WeekNoticeVO getMaterialDetail(WeekNoticeVO vo)throws SQLException;

	public void modifyWeekNotice(WeekNoticeVO vo)throws SQLException;

}
