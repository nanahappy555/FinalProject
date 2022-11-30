package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.stu.LecQnaVO;

public interface LecQnaDAO {
	public List<LecQnaVO> selectLecQnaList(CriteriaLec cri)throws SQLException;
	public LecQnaVO selectLecQnaDetail(int lecqBno)throws SQLException;
	public int selectLecqBnoSeqNext()throws SQLException;
	public int selectLecQnaTotalCount(CriteriaLec cri)throws SQLException;
	public void insertLecQna(LecQnaVO vo) throws SQLException;
	public void updateReply(LecQnaVO vo) throws SQLException;
	public void deleteLecQna(int lecqBno)throws SQLException;
	public void increaseViewCnt(int lecqBno)throws SQLException;
	public List<LecQnaVO> selectLecQnaListByProfId(String profCd);
}
