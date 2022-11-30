package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.command.PageMakerLec;
import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.prof.SyllabusDAO;
import kr.or.ddit.dao.stu.lec.LecQnaDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.prof.SyllabusVO;
import kr.or.ddit.dto.stu.LecQnaVO;

@Service
public class LecQnaServiceImpl implements LecQnaService {

	@Autowired
	private LecQnaDAO lecQnaDAO;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@Autowired
	private SyllabusDAO syllabusDAO;
	
	@Override
	public Map<String, Object> getLecQnaList(CriteriaLec cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<LecQnaVO> lecQnaList = lecQnaDAO.selectLecQnaList(cri);
		int totalCount = lecQnaDAO.selectLecQnaTotalCount(cri);
		
		PageMakerLec pageMaker = new PageMakerLec();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("lecQnaList", lecQnaList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public LecQnaVO getLecQnaDetail(int lecqBno) throws SQLException {
		LecQnaVO detail = lecQnaDAO.selectLecQnaDetail(lecqBno);
		return detail;
	}

	@Override
	public int getLecqBnoSeqNext() throws SQLException {
		int nextVal = lecQnaDAO.selectLecqBnoSeqNext();
		return nextVal;
	}

	@Override
	public int getLecQnaTotalCount(CriteriaLec cri) throws SQLException {
		int totalCount = lecQnaDAO.selectLecQnaTotalCount(cri);
		return totalCount;
	}

	@Override
	public void registLecQna(LecQnaVO vo) throws SQLException {
		SyllabusVO syllabusVO = syllabusDAO.selectSyllabusBysylCd(vo.getLecCd());
		vo.setProfCd(syllabusVO.getProfId());
		lecQnaDAO.insertLecQna(vo);
	}

	@Override
	public void modifyReply(LecQnaVO vo) throws SQLException {
		lecQnaDAO.updateReply(vo);

	}

	@Override
	public void removeLecQna(int lecqBno) throws SQLException {
		lecQnaDAO.deleteLecQna(lecqBno);

	}

	@Override
	public void increaseViewCnt(int lecqBno) throws SQLException {
		lecQnaDAO.increaseViewCnt(lecqBno);

	}

	@Override
	public List<LecQnaVO> getLecQnaListByProfId(HttpSession session) {
		String profCd = null;
		if(session.getAttribute("loginUser")!=null) {
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			profCd = member.getMemId();
		}
		
		List<LecQnaVO> qnaList = lecQnaDAO.selectLecQnaListByProfId(profCd);
		return qnaList;
	}


}
