package kr.or.ddit.service.stu.support;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.command.SurveyCommand;
import kr.or.ddit.dao.stu.support.SurveyDAO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.SurveyVO;

public class SurveyServiceImpl implements SurveyService {
	

	@Autowired
	private SurveyDAO surveyDAO;
	
	public void setSurveyDAO(SurveyDAO surveyDAO) {
		this.surveyDAO = surveyDAO;
	}

	@Override
	public List<SurveyVO> getSurvey() throws SQLException {
		return surveyDAO.selectSurveyForm();

	}

	@Override
	public void registSurvey(List<String> surveyList,HttpSession session) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String stuCd = member.getMemId();
		List<SurveyCommand> oldSurveyList = surveyDAO.selectSurveyByStuCd(stuCd);
		if(oldSurveyList==null) {
			for(int i=0;i<surveyList.size();i++) {
				SurveyCommand survey = new SurveyCommand();
				survey.setStuCd(stuCd);
				survey.setSurveyNo(i+1);
				survey.setResponse(surveyList.get(i));
				surveyDAO.registSurvey(survey);
			}
		}else {
			for(int i=0;i<surveyList.size();i++) {
				SurveyCommand survey = new SurveyCommand();
				survey.setStuCd(stuCd);
				survey.setSurveyNo(i+1);
				survey.setResponse(surveyList.get(i));
				surveyDAO.updateSurvey(survey);
			}
		}
		
		
	}

	@Override
	public List<SurveyCommand> selectSurveyResByStuId(String stuId) throws SQLException {
		return surveyDAO.selectSurveyByStuCd(stuId);
	}
	
}
