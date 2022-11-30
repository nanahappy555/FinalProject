package kr.or.ddit.service.stu.support;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.SurveyCommand;
import kr.or.ddit.dto.stu.SurveyVO;

public interface SurveyService {
	
	List<SurveyVO> getSurvey() throws SQLException;

	void registSurvey(List<String> surveyList, HttpSession session)throws SQLException;

	List<SurveyCommand> selectSurveyResByStuId(String stuId) throws SQLException;

}
