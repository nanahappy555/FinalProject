package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SurveyCommand;
import kr.or.ddit.dto.stu.SurveyVO;

public class SurveyDAOImpl implements SurveyDAO {
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<SurveyVO> selectSurveyForm() throws SQLException {
		List<SurveyVO> surveyList = session.selectList("StuSupport-Mapper.selectSurveyForm"); 
		return surveyList;
	}

	@Override
	public void registSurvey(SurveyCommand survey) throws SQLException {
		session.insert("StuSupport-Mapper.registSurvey",survey);
	}

	@Override
	public List<SurveyCommand> selectSurveyByStuCd(String stuCd) throws SQLException {
		return session.selectList("StuSupport-Mapper.selectSurveyByStuCd",stuCd);
	}

	@Override
	public void updateSurvey(SurveyCommand survey) throws SQLException {
		session.update("StuSupport-Mapper.updateSurvey",survey);
	}

}
