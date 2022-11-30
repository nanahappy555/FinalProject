package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.prof.AssignmentVO;

public interface AssignmentDAO {
	public List<AssignmentVO> selectList(CriteriaLec cri) throws SQLException;
	public AssignmentVO selectDetail(AssignmentVO vo) throws SQLException;
	public int selectTotalCountBylecCd(CriteriaLec cri) throws SQLException;
	public void insert(AssignmentVO vo) throws SQLException;
	public void modify(AssignmentVO vo) throws SQLException;
	public void delete(int assBno) throws SQLException;
	public int selectAssBnoSeqNextVal()throws SQLException;
	AssignmentVO selectDetailByAssBno(int assBno) throws SQLException;
	
}
