package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.stu.LecEvalItemsVO;
import kr.or.ddit.dto.stu.LecVO;

public class LecDAOImpl implements LecDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<LecVO> selectAppliedLectureListBystuCdLecCd(LecVO vo) throws SQLException {
		List<LecVO> appliedLectureList = session.selectList("Lec-Mapper.selectAppliedList",vo);
		return appliedLectureList;
	}

	@Override
	public List<LecVO> selectLecListByLecCd(String lecCd) throws SQLException {
		List<LecVO> lecList = session.selectList("Lec-Mapper.selectLecListByLecCd", lecCd);
		return lecList;
	}
	
	@Override
	public List<String> selectStuCdListByLecCd(String lecCd) throws SQLException {
		List<String> stuCdList = session.selectList("Lec-Mapper.selectStuCdListByLecCd", lecCd);
		return stuCdList;
	}

	@Override
	public void insertLecList(LecVO vo) throws SQLException {
		session.insert("Lec-Mapper.insertLecList",vo);
	}

	@Override
	public List<MyLectureVO> selectLecListByStuCd(LecVO lec) throws SQLException {
		return session.selectList("Lec-Mapper.selectLecListByStuCd",lec);
	}

	@Override
	public void deleteLecList(LecVO vo) throws SQLException {
		session.delete("Lec-Mapper.deleteLecList",vo);
		
	}

	@Override
	public List<LecVO> selectEvalList(String stuId) throws SQLException {
		return session.selectList("Lec-Mapper.selectEvalList",stuId);
	}
	
	@Override
	public List<LecVO> selectWithdrawalList() throws SQLException {
		return session.selectList("StuMyLecture-Mapper.selectWithdrawalList");
	}

	@Override
	public void updateInfo(LecVO lceVO) throws SQLException {
		session.update("styMyLecture-Mapper.updateInfo", lceVO);
		
	}

	@Override
	public List<LecEvalItemsVO> selectEvalFormList() throws SQLException {
		return session.selectList("Lec-Mapper.selectEvalFormList");
	}

	@Override
	public List<String> selectLecCdListByStuCd(String stuCd) throws SQLException {
		return session.selectList("Lec-Mapper.selectLecCdListByStuCd",stuCd);
	}

	@Override
	public List<LecNoticeVO> selectBoardLecNoticeListByLecCd(String lecCd) throws SQLException {
		return session.selectList("Lec-Mapper.selectBoardLecNoticeListByLecCd",lecCd);
		
	}


}
