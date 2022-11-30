package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.common.ScoreVO;
import kr.or.ddit.dto.stu.AttendVO;
import kr.or.ddit.dto.stu.LecVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import kr.or.ddit.dto.stu.StudentVO;

public interface ScoreService {
	public List<MyLectureVO> selectSubScorejInfo(LecVO lec) throws SQLException; 
	//public List<ScoreVO> selectSubjTotalScore(LecVO lec) throws SQLException;
	public StudentVO selectStuInfo(String stuCd) throws SQLException;
	public List<String> selectStuSubjGradeSeme(String stuCd)throws SQLException;
	public ScoreVO selectSubjScoreStd(LecVO lec) throws SQLException;
	public LecVO selectLecInfo(LecVO lec) throws SQLException;
	public AttendVO  selectAttendScore(LecVO lec) throws SQLException;
	public List<MyLecAssignmentVO> selectAssList(LecVO lec) throws SQLException;
	public Map<String,Object> selectStuSemeScore(String stuCd) throws SQLException;
	public Map<String,Object> selectSubScoreDist(LecVO lec) throws SQLException;
}
