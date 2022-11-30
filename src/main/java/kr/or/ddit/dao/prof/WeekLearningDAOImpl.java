package kr.or.ddit.dao.prof;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.prof.WeekLearningVO;


public class WeekLearningDAOImpl implements WeekLearningDAO {


	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertWeekLearningDAO(WeekLearningVO vo) {
		session.insert("WeekLearning-Mapper.insertWeekLearning", vo);
	}

}
