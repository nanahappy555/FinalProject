package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.common.ScoreVO;
import kr.or.ddit.dto.prof.SyllabusVO;
import kr.or.ddit.dto.stu.AttendVO;
import kr.or.ddit.dto.stu.LecVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import kr.or.ddit.dto.stu.SemesterStuVO;
import kr.or.ddit.dto.stu.StudentVO;

public interface ScoreDAO {
	ScoreVO selectSubjScoreStd(LecVO lec) throws SQLException;
	List<ScoreVO> selectAllSubjAssSubScore(LecVO lec) throws SQLException;
	List<ScoreVO> selectAllSubjAttendScore(LecVO lec) throws SQLException;
	List<ScoreVO> selectAllSubjMidScore(LecVO lec) throws SQLException;
	List<ScoreVO> selectAllSubjFinScore(LecVO lec) throws SQLException;
	List<MyLectureVO> selectSubScorejInfo(LecVO lec) throws SQLException;
	List<String> selectThisSemesterSubjList(LecVO lec) throws SQLException;
	StudentVO selectStuInfo(String stuCd) throws SQLException;
	
	List<String> selectStuSubjGradeSeme(String stuCd) throws SQLException;
	
	LecVO selectLecInfo(LecVO lec) throws SQLException;
	SyllabusVO selectSylInfo(LecVO lec)throws SQLException;
	List<AttendVO>  selectAttendScore(LecVO lec)throws SQLException;
	List<MyLecAssignmentVO> selectAssList(LecVO lec)throws SQLException;
	List<SemesterStuVO> selectStuSemeScore(String stuCd) throws SQLException;
	
}
