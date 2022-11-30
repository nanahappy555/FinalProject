package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.common.ScoreVO;
import kr.or.ddit.dto.prof.SyllabusVO;
import kr.or.ddit.dto.stu.AttendVO;
import kr.or.ddit.dto.stu.LecVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import kr.or.ddit.dto.stu.SemesterStuVO;
import kr.or.ddit.dto.stu.StudentVO;

public class ScoreDAOImpl implements ScoreDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public ScoreVO selectSubjScoreStd(LecVO lec) throws SQLException {
		return session.selectOne("Score-Mapper.selectSubjScoreStd",lec);
	}
	@Override
	public List<ScoreVO> selectAllSubjAssSubScore(LecVO lec) throws SQLException {
		return session.selectList("Score-Mapper.selectAllSubjAssSubScore",lec);
	}
	@Override
	public List<ScoreVO> selectAllSubjAttendScore(LecVO lec) throws SQLException {
		return session.selectList("Score-Mapper.selectAllSubjAttendScore",lec);
	}
	@Override
	public List<ScoreVO> selectAllSubjMidScore(LecVO lec) throws SQLException {
		return session.selectList("Score-Mapper.selectAllSubjMidScore",lec);
	}
	@Override
	public List<ScoreVO> selectAllSubjFinScore(LecVO lec) throws SQLException {
		return session.selectList("Score-Mapper.selectAllSubjFinScore",lec);
	}

	@Override
	public List<MyLectureVO> selectSubScorejInfo(LecVO lec) throws SQLException {
		return session.selectList("Score-Mapper.selectSubScorejInfo",lec);
	}

	@Override
	public List<String> selectThisSemesterSubjList(LecVO lec) throws SQLException {
		return session.selectList("Score-Mapper.selectThisSemesterSubjList",lec);
	}

	@Override
	public StudentVO selectStuInfo(String stuCd) throws SQLException {
		return session.selectOne("Score-Mapper.selectStuInfo",stuCd);
	}

	@Override
	public List<String> selectStuSubjGradeSeme(String stuCd) throws SQLException {
		return session.selectList("Score-Mapper.selectStuSubjGradeSeme",stuCd);
	}

	@Override
	public LecVO selectLecInfo(LecVO lec) throws SQLException {
		return session.selectOne("Score-Mapper.selectLecInfo",lec);
	}

	@Override
	public SyllabusVO selectSylInfo(LecVO lec) throws SQLException {
		return session.selectOne("Score-Mapper.selectSylInfo",lec);
	}

	@Override
	public List<AttendVO>  selectAttendScore(LecVO lec) throws SQLException {
		return session.selectList("Score-Mapper.selectAttendScore",lec);
	}

	@Override
	public List<MyLecAssignmentVO> selectAssList(LecVO lec) throws SQLException {
		return session.selectList("Score-Mapper.selectAssList",lec);
	}

	@Override
	public List<SemesterStuVO> selectStuSemeScore(String stuCd) throws SQLException {
		return session.selectList("Score-Mapper.selectStuSemeScore",stuCd);
	}
	
	

}
