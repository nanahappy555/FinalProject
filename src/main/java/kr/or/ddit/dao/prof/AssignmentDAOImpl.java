package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.prof.AssignmentVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AssignmentDAOImpl implements AssignmentDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<AssignmentVO> selectList(CriteriaLec cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<AssignmentVO> list = session.selectList("Assignment-Mapper.selectList", cri, rowBounds);
		return list;
	}

	@Override
	public AssignmentVO selectDetail(AssignmentVO vo) throws SQLException {
		AssignmentVO detail = session.selectOne("Assignment-Mapper.selectDetail", vo);
		return detail;
	}
	
	@Override
	public AssignmentVO selectDetailByAssBno(int assBno) throws SQLException {
		AssignmentVO detail = session.selectOne("Assignment-Mapper.selectDetailByAssBno", assBno);
		return detail;
	}

	@Override
	public void insert(AssignmentVO vo) throws SQLException {
		session.insert("Assignment-Mapper.insertAssignment",vo);
	}

	@Override
	public void modify(AssignmentVO vo) throws SQLException {

	}

	@Override
	public void delete(int assBno) throws SQLException {
		session.delete("Assignment-Mapper.deleteAssignment", assBno);
	}

	@Override
	public int selectTotalCountBylecCd(CriteriaLec cri) throws SQLException {
		
		
		int totalCount = session.selectOne("Assignment-Mapper.selectCount", cri);
		return totalCount;
	}

	@Override
	public int selectAssBnoSeqNextVal() throws SQLException {
		int nextVal = session.selectOne("Assignment-Mapper.assBnoSeqNextVal");
		return nextVal;
	}



}
