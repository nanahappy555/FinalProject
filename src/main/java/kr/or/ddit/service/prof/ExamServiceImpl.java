package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.command.CriteriaExam;
import kr.or.ddit.command.PageMakerExam;
import kr.or.ddit.dao.prof.ExamDAO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.prof.ExamVO;

@Service
public class ExamServiceImpl implements ExamService{

	@Autowired
	private ExamDAO examDAO;
	
	@Override
	public Map<String, Object> getExamList(CriteriaExam cri) throws SQLException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ExamVO> examList = examDAO.selectExamList(cri);
		int totalCount = examDAO.selectTotalCount(cri);
		
		PageMakerExam pageMaker = new PageMakerExam();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		map.put("examList", examList);
		map.put("pageMaker", pageMaker);
		
		return map;
	}

	@Override
	public ExamVO getExam(int examSeq) throws SQLException {
		ExamVO exam = examDAO.selectExam(examSeq);
		return exam;
	}

	@Override
	public void registExam(ExamVO vo) throws SQLException {
		examDAO.insertExam(vo);
		
	}

	@Override
	public void modifyExam(ExamVO vo) throws SQLException {
		examDAO.updateExam(vo);
		
	}

	@Override
	public void removeExam(int examSeq) throws SQLException {
		examDAO.deleteExam(examSeq);
	}

	@Override
	public List<ExamVO> getUpcomingExamList(HttpSession session) throws SQLException {
		
		String profId = null;
		if(session.getAttribute("loginUser")!=null) {
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			profId = member.getMemId();
		}
		
		List<ExamVO> examList = examDAO.selectUpcomingExamList(profId);
		return examList;
	}

}
