package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.prof.MyLecSyllabusVO;
import kr.or.ddit.dto.prof.WeekNoticeVO;
import kr.or.ddit.dto.stu.AttendVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MyLectureDAOImpl implements MyLectureDAO{
	
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public MyLectureVO selectMyLectureInfo(String lecCd) throws SQLException {
		return session.selectOne("StuMyLecture-Mapper.selectMyLectureInfo",lecCd);
	}

	@Override
	public List<AttendVO> selectTotalAttendInfo(AttendVO attendVO) throws SQLException {
		return session.selectList("StuMyLecture-Mapper.selectTotalAttendInfo",attendVO);
	}
	@Override
	public List<LecNoticeVO> selectLecNoticeList(CriteriaLec criLec) throws SQLException {
		int offset = criLec.getStartRowNum();
		int limit = criLec.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<LecNoticeVO> lecNoticeList = session.selectList("LectureNotice-Mapper.selectLectureNoticeListByLecCd",criLec,rowBounds);
		
		
		return lecNoticeList;
	}
	
	@Override
	public int selectLectureNoticeTotalCountByLecCd(CriteriaLec criLec) throws SQLException {
		
		int count=session.selectOne("LectureNotice-Mapper.selectLectureNoticeTotalCountByLecCd",criLec);
		return count;
	}
	@Override
	public MyLecSyllabusVO selectMyLecSyllabus(String lecCd) throws SQLException{
		return session.selectOne("MylecSyllabus-Mapper.selectMyLecSyllabus",lecCd);
	}
	@Override
	public List<MyLecSyllabusVO> selectMyLecWeekLearning(String lecCd)throws SQLException {
		return session.selectList("MylecSyllabus-Mapper.selectMyLecWeekLearning",lecCd);
	}
	@Override
	public List<WeekNoticeVO> selectMyLecWeekNotice(String lecCd) throws SQLException {
		return session.selectList("MylecSyllabus-Mapper.selectMyLecWeekNotice",lecCd);
	}

}
