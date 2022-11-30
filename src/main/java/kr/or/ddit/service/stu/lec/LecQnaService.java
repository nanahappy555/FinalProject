package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.stu.LecQnaVO;

public interface LecQnaService {
	public Map<String, Object> getLecQnaList(CriteriaLec cri)throws SQLException;
	public LecQnaVO getLecQnaDetail(int lecqBno)throws SQLException;
	public int getLecqBnoSeqNext()throws SQLException;
	public int getLecQnaTotalCount(CriteriaLec cri)throws SQLException;
	public void registLecQna(LecQnaVO vo) throws SQLException;
	public void modifyReply(LecQnaVO vo) throws SQLException;
	public void removeLecQna(int lecqBno)throws SQLException;
	public void increaseViewCnt(int lecqBno)throws SQLException;
	public List<LecQnaVO> getLecQnaListByProfId(HttpSession session);
}
