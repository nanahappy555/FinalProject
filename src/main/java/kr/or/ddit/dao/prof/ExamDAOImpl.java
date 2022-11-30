package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.command.CriteriaExam;
import kr.or.ddit.dto.prof.ExamVO;

@Repository
public class ExamDAOImpl implements ExamDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ExamVO> selectExamList(CriteriaExam cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ExamVO> examList = session.selectList("Exam-Mapper.selectExamList", cri,rowBounds);
		
		return examList;
	}

	@Override
	public ExamVO selectExam(int examSeq) throws SQLException {
		ExamVO exam = session.selectOne("Exam-Mapper.selectExam",examSeq);
		return exam;
	}

	@Override
	public void insertExam(ExamVO vo) throws SQLException {
		session.insert("Exam-Mapper.insertExam",vo);

	}

	@Override
	public void updateExam(ExamVO vo) throws SQLException {
		session.update("Exam-Mapper.updateExam", vo);
	}

	@Override
	public void deleteExam(int examSeq) throws SQLException {
		session.delete("Exam-Mapper.deleteExam",examSeq);
	}

	@Override
	public int selectTotalCount(CriteriaExam cri) throws SQLException {
		int totalCount = session.selectOne("Exam-Mapper.selectTotalCount",cri);
		return totalCount;
	}

	@Override
	public List<ExamVO> selectUpcomingExamList(String profId) throws SQLException {
		List<ExamVO> selectList = session.selectList("Exam-Mapper.selectUpcomingExamByProfId", profId);
		return selectList;
	}

}
