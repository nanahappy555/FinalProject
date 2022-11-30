package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.PageMakerLec;
import kr.or.ddit.dao.prof.MarksStdDAO;
import kr.or.ddit.dao.prof.SyllabusDAO;
import kr.or.ddit.dao.prof.WeekLearningDAO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.common.SemesterVO;
import kr.or.ddit.dto.prof.SyllabusVO;
import kr.or.ddit.dto.prof.WeekLearningVO;
import kr.or.ddit.dto.staff.SyllabusDetailVO;
import kr.or.ddit.dto.staff.SyllabusManegeVO;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SyllabusServiceImpl implements SyllabusService {

	@Getter
	@Setter
	private SyllabusDAO syllabusDAO;
	
	@Getter
	@Setter
	private WeekLearningDAO weekLearningDAO;
	
	@Getter
	@Setter
	private MarksStdDAO marksStdDAO;

	@Override
	public List<SyllabusVO> getSyllabusList(Criteria cri) throws SQLException {

		return null;
	}

	@Override
	public SyllabusVO getSyllabusBySylCd(String sylCd) throws SQLException {
		SyllabusVO syllabus = syllabusDAO.selectSyllabusBysylCd(sylCd);
		return syllabus;
	}

	@Override
	public Map<String, Object> getSyllabusManegeList(Criteria cri) throws SQLException {
		Criteria searchCri = (Criteria) cri;

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<SyllabusManegeVO> syllabusList = syllabusDAO.selectManageSyllabus(searchCri);
		int totalCount = syllabusDAO.selectSyllabusTotalCount(searchCri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		log.debug(syllabusList.toString());
		log.debug("페이지메이커 : " + pageMaker.toString());

		dataMap.put("syllabusList", syllabusList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void updateSyllabusStatus(Map<String, Object> dataMap) throws SQLException {
		ArrayList<String> syllabusList = (ArrayList<String>) dataMap.get("checkboxArr");
		String applyStatus = (String) dataMap.get("applyStatusCd");

		log.debug("dpdppdp" + syllabusList.toString());

		for (int i = 0; i < syllabusList.size(); i++) {

			SyllabusVO syllaVO = new SyllabusVO();

			syllaVO.setSylCd(syllabusList.get(i));

			log.debug("과목코드!!!!!!!!!!!!!!!!!" + syllabusList.get(i));

			syllaVO.setApplyStatusCd(applyStatus);

			syllabusDAO.updateSyllabusApply(syllaVO);

		}
	}

	@Override
	public SyllabusDetailVO getSyllabusDetail(String sylCd) throws SQLException {

		SyllabusDetailVO syllaDetail = syllabusDAO.selectSyllabusDetail(sylCd);

		return syllaDetail;
	}

	@Override
	public List<WeekLearningVO> getDetailWeek(String sylCd) throws SQLException {

		List<WeekLearningVO> WeekDetail = syllabusDAO.selectWeekDetail(sylCd);

		return WeekDetail;
	}

	@Override
	public void updateSyllabusDetailStatus(SyllabusVO sylla) throws SQLException {

		syllabusDAO.updateSyllabusApply(sylla);

	}

	@Override
	public Map<String, Object> getSyllabusListByProfId(CriteriaLec cri) {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<SyllabusVO> syllabusList = syllabusDAO.selectSyllabusByProfId(cri);
		int totalCount = syllabusDAO.selectSyllabusTotalCountByProfId(cri);
		
		PageMakerLec pageMaker = new PageMakerLec();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(10);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("syllabusList", syllabusList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public String registSyllabus(SyllabusVO syllabusVO,HttpServletRequest request) throws SQLException {
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		SemesterVO semester = (SemesterVO) session.getAttribute("semester");
		
		String semeCd = semester.getSemeCd();
		
		String profId = member.getMemId();
		int nextVal = syllabusDAO.selectNextVal();
		log.debug("nextVal"+ nextVal);
		String sylCd = "SYL" + nextVal;
		
		if (syllabusVO.getEvalClassCd().equals("시험 평가 과목")) {
			syllabusVO.setEvalClassCd("exam");
		}else {
			syllabusVO.setEvalClassCd("nexam");
		}
		syllabusVO.setProfId(profId);
		syllabusVO.setSylCd(sylCd);
		syllabusVO.setApplyStatusCd("ing");
		syllabusVO.setSemeCd(semeCd);
		
		syllabusDAO.insertSyllabus(syllabusVO);
		
		return sylCd;
	}
	

	

	
}
