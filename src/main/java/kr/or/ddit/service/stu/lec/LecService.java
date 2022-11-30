package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.stu.LecEvalItemsVO;
import kr.or.ddit.dto.stu.LecVO;

public interface LecService {
	
	public List<LecVO> selectWithdrawalList() throws SQLException;
	
	public List<LecVO> selectEvalList(String stuId) throws SQLException;
	
	void updateInfo(LecVO lceVO) throws SQLException;
	
	public List<LecVO> getAppliedLectureListByStuCdSemeCd(HttpServletRequest request) throws SQLException; 
	public void registLecList(HttpServletRequest request,String lecCd)throws SQLException;
	
	public List<MyLectureVO> selectLecListByStuCd(LecVO lec) throws SQLException;
	public void removeLecList(HttpServletRequest request, String lecCd) throws SQLException;

	public List<LecEvalItemsVO> selectEvalFormList()  throws SQLException;
	
	public List<LecNoticeVO> selectBoardLecNoticeList(String stuCd) throws SQLException;
	
}
