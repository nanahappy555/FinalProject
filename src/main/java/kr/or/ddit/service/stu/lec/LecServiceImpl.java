package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.dao.stu.StudentDAO;
import kr.or.ddit.dao.stu.lec.LecDAO;
import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.stu.LecEvalItemsVO;
import kr.or.ddit.dto.stu.LecVO;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LecServiceImpl implements LecService {


	private LecDAO lecDAO;
	private StudentDAO studentDAO;
	
	public void setLecDAO(LecDAO lecDAO) {
		this.lecDAO = lecDAO;
	}
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}


	@Override
	public List<LecVO> getAppliedLectureListByStuCdSemeCd(HttpServletRequest request) throws SQLException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		
		StudentVO studentVO = studentDAO.selectStudentByStuCd(memberVO.getMemId());
		String grade = studentVO.getGrade();
		String stuSemester = studentVO.getStuSemester();
		String gradeSemeCd = "0" + grade.trim() + "0" + stuSemester.trim();
		
		LecVO lecVO = new LecVO();
		lecVO.setStuCd(studentVO.getStuCd());
		lecVO.setGradeSemeCd(gradeSemeCd);
		
		
		List<LecVO> applidLectureList = lecDAO.selectAppliedLectureListBystuCdLecCd(lecVO);
		return applidLectureList;
	}
	@Override
	public void registLecList(HttpServletRequest request,String lecCd) throws SQLException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		StudentVO studentVO = studentDAO.selectStudentByStuCd(memberVO.getMemId());
		String grade = studentVO.getGrade();
		String stuSemester = studentVO.getStuSemester();
		String gradeSemeCd = "0" + grade.trim() + "0" + stuSemester.trim();
		LecVO lecVO = new LecVO();
		lecVO.setLecCd(lecCd);
		lecVO.setStuCd(studentVO.getStuCd());
		lecVO.setGradeSemeCd(gradeSemeCd);
		lecDAO.insertLecList(lecVO);
		
	}
	@Override
	public List<MyLectureVO> selectLecListByStuCd(LecVO lec) throws SQLException {
		return lecDAO.selectLecListByStuCd(lec);
	}
	
	
	@Override
	public void removeLecList(HttpServletRequest request, String lecCd) throws SQLException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		StudentVO studentVO = studentDAO.selectStudentByStuCd(memberVO.getMemId());
		String grade = studentVO.getGrade();
		String stuSemester = studentVO.getStuSemester();
		String gradeSemeCd = "0" + grade.trim() + "0" + stuSemester.trim();
		LecVO lecVO = new LecVO();
		lecVO.setLecCd(lecCd);
		lecVO.setStuCd(studentVO.getStuCd());
		lecVO.setGradeSemeCd(gradeSemeCd);
		lecDAO.deleteLecList(lecVO);
		
	}
	
	@Override
	public List<LecVO> selectEvalList(String stuId) throws SQLException {
		return lecDAO.selectEvalList(stuId);
	}
	
	@Override
	public List<LecVO> selectWithdrawalList() throws SQLException {
		return lecDAO.selectWithdrawalList();
	}
	@Override
	public void updateInfo(LecVO lceVO) throws SQLException {
		lecDAO.updateInfo(lceVO);
		
	}
	@Override
	public List<LecEvalItemsVO> selectEvalFormList() throws SQLException {
		List<LecEvalItemsVO> lecEvalItems = lecDAO.selectEvalFormList();
		for(LecEvalItemsVO lecEvalItem: lecEvalItems) {
			String evalQueCd = lecEvalItem.getEvalQueCd();
			String[] evalQueItems = evalQueCd.split("/");
			lecEvalItem.setEvalQueItems(evalQueItems);
		}
		return lecEvalItems;
	}
	@Override
	public List<LecNoticeVO> selectBoardLecNoticeList(String stuCd) throws SQLException {
		List<String> lecCdList = lecDAO.selectLecCdListByStuCd(stuCd);
		List<LecNoticeVO> boardLecList = new ArrayList<LecNoticeVO>();
		for(String lecCd :lecCdList ) {
			List<LecNoticeVO> lecNotice = lecDAO.selectBoardLecNoticeListByLecCd(lecCd);
			log.debug("lecNotice : "+lecNotice);
			if(lecNotice!=null && lecNotice.size()>=1) {
				boardLecList.add(lecNotice.get(0));
			}
		}
		for(String lecCd :lecCdList ) {
			List<LecNoticeVO> lecNotice = lecDAO.selectBoardLecNoticeListByLecCd(lecCd);
			if(lecNotice!=null && lecNotice.size()>=2) {
				boardLecList.add(lecNotice.get(1));
			}
		}
		
		return boardLecList;
	}


}
