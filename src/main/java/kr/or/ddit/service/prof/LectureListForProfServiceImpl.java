package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.prof.LectureListForProfDAO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.prof.LectureListVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LectureListForProfServiceImpl implements LectureListForProfService {
	
	private LectureListForProfDAO lectureListForProfDAO;
	
	public void setLectureListForProfDAO(LectureListForProfDAO lectureListForProfDAO) {
		this.lectureListForProfDAO = lectureListForProfDAO;
	}

	@Override
	public Map<String, Object> getLectureListForProfByProfId(HttpSession session, Criteria cri) throws SQLException {

			Map<String, Object> dataMap = new HashMap<String, Object>();
			String profId = null;
			if(session.getAttribute("loginUser")!=null) {
				MemberVO member = (MemberVO) session.getAttribute("loginUser");
				profId = member.getMemId();
			}
			log.debug("교수아이디!!!"+profId);

			// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
			List<LectureListVO> lectureList = lectureListForProfDAO.selectLectureListCriteria(cri, profId);
			log.debug("강의리스트"+lectureList);
			// 전체 board 개수
			int totalCount = lectureListForProfDAO.selectLectureListCriteriaTotalCount(profId, cri);
			log.debug("숫자"+totalCount);
			// PageMaker 생성.
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(totalCount);

			dataMap.put("lectureList", lectureList);
			dataMap.put("pageMaker", pageMaker);

			return dataMap;
	}
}
