package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.CriteriaExam;
import kr.or.ddit.dto.prof.ExamVO;

public interface ExamDAO {
	public List<ExamVO> selectExamList(CriteriaExam cri)throws SQLException;
	public ExamVO selectExam(int examSeq)throws SQLException;
	public List<ExamVO> selectUpcomingExamList(String profId)throws SQLException;
	public int selectTotalCount(CriteriaExam cri)throws SQLException;
	public void insertExam(ExamVO vo)throws SQLException;
	public void updateExam(ExamVO vo)throws SQLException;
	public void deleteExam(int examSeq)throws SQLException;
}
