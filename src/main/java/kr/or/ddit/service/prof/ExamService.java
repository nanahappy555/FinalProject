package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.CriteriaExam;
import kr.or.ddit.dto.prof.ExamVO;

public interface ExamService {

	public Map<String, Object> getExamList(CriteriaExam cri) throws SQLException;
	public ExamVO getExam(int examSeq)throws SQLException;
	public List<ExamVO> getUpcomingExamList(HttpSession session)throws SQLException;
	public void registExam(ExamVO vo)throws SQLException;
	public void modifyExam(ExamVO vo)throws SQLException;
	public void removeExam(int examSeq)throws SQLException;
}
