package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.stu.LecEvalItemsVO;
import kr.or.ddit.dto.stu.LecVO;

public interface LecDAO {
	public List<LecVO> selectAppliedLectureListBystuCdLecCd(LecVO vo) throws SQLException;
	
	public List<LecVO> selectWithdrawalList() throws SQLException;
	
	void updateInfo(LecVO lceVO) throws SQLException;
	
	public List<LecVO> selectEvalList(String stuId) throws SQLException;
	
	public List<LecVO> selectLecListByLecCd(String lecCd) throws SQLException;
	
	public List<String> selectStuCdListByLecCd(String lecCd) throws SQLException;
	
	public void insertLecList(LecVO vo) throws SQLException;
	
	public List<MyLectureVO> selectLecListByStuCd(LecVO lec) throws SQLException;

	public void deleteLecList(LecVO lecVO)throws SQLException;

	public List<LecEvalItemsVO> selectEvalFormList() throws SQLException;
	
	public List<String> selectLecCdListByStuCd(String stuCd) throws SQLException;

	public List<LecNoticeVO> selectBoardLecNoticeListByLecCd(String lecCd)throws SQLException;
	
}
