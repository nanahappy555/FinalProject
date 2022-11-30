package kr.or.ddit.dao.prof;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.prof.WeekNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class WeekNoticeDAOImpl implements WeekNoticeDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public void InsertWeekNotice(WeekNoticeVO vo) throws SQLException {
		session.insert("WeekNotice-Mapper.insertWeekNotice",vo);

	}

	@Override
	public WeekNoticeVO selectMaterialDetail(WeekNoticeVO vo) {
		WeekNoticeVO resultVO = session.selectOne("WeekNotice-Mapper.selectMaterialDetail",vo);
		return resultVO;
	}

	@Override
	public void updateWeekNotice(WeekNoticeVO vo) throws SQLException {
		session.update("WeekNotice-Mapper.updateWeekNotice", vo);
		
	}

}
