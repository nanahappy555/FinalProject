package kr.or.ddit.dao.stu.support;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SurveyCommand;
import kr.or.ddit.dto.stu.SurveyVO;

public interface SurveyDAO {

	List<SurveyVO> selectSurveyForm() throws SQLException;

	void registSurvey(SurveyCommand survey)throws SQLException;
	
	List<SurveyCommand> selectSurveyByStuCd(String stuCd) throws SQLException;

	void updateSurvey(SurveyCommand survey) throws SQLException;
	
	
}
