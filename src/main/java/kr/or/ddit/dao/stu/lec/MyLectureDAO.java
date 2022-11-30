package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.prof.MyLecSyllabusVO;
import kr.or.ddit.dto.prof.WeekNoticeVO;
import kr.or.ddit.dto.stu.AttendVO;

public interface MyLectureDAO {
	public MyLectureVO selectMyLectureInfo(String lecCd) throws SQLException;
	public List<AttendVO> selectTotalAttendInfo(AttendVO attendVO) throws SQLException;
	public List<LecNoticeVO> selectLecNoticeList(CriteriaLec cri) throws SQLException;
	int selectLectureNoticeTotalCountByLecCd(CriteriaLec cri) throws SQLException;
	public MyLecSyllabusVO selectMyLecSyllabus(String lecCd)throws SQLException;
	public List<MyLecSyllabusVO> selectMyLecWeekLearning(String lecCd)throws SQLException;
	public List<WeekNoticeVO> selectMyLecWeekNotice(String lecCd)throws SQLException;
	
	
}
