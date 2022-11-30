package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.ddit.dao.common.SemesterDAO;
import kr.or.ddit.dao.stu.lec.ApplyPageDAO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.SemesterVO;
import kr.or.ddit.dto.stu.ApplyPageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ApplyPageServiceImpl implements ApplyPageService {

	private ApplyPageDAO applyPageDAO;
	private SemesterDAO semesterDAO;
	
	public void setApplyPageDAO(ApplyPageDAO applyPageDAO) {
		this.applyPageDAO = applyPageDAO;
	}
	public void setSemesterDAO(SemesterDAO semesterDAO) {
		this.semesterDAO = semesterDAO;
	}

	@Override
	public List<ApplyPageVO> getLectureList() throws SQLException {
		List<ApplyPageVO> lectureList = applyPageDAO.selectLectureList();
		return lectureList;
	}


	@Override
	public HashMap<String, String> getCredits(HttpSession session) throws SQLException {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		HashMap<String, String> resultMap = new HashMap<String, String>();
		String memId = null;
		String semeCd = null;
		if(session.getAttribute("loginUser")!=null) {
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			 memId = member.getMemId();
		}
		
		if(session.getAttribute("semester") !=null) {
			//학사년도 정보 담기
			SemesterVO semesterVO = (SemesterVO) session.getAttribute("semester");
			semeCd = semesterVO.getSemeCd();
		}
		
		paramMap.put("stuCd", memId);
		paramMap.put("semeCd", semeCd);
		
		log.info(paramMap.toString());
		String MaxCredit = applyPageDAO.selectMaxCredit(paramMap);
		String curentCredit = applyPageDAO.selectCurentCredit(memId);
		
		resultMap.put("MaxCredit",MaxCredit);
		resultMap.put("curentCredit",curentCredit);
		return resultMap;
	}

}
