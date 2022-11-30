package kr.or.ddit.dao.common;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.common.ScQnaVO;

public class ScqnaDAOImpl implements ScqnaDAO{
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ScQnaVO> selectScqnaList(Criteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<ScQnaVO> scqnaList = session.selectList("Scqna-Mapper.selectScqnaList",cri,rowBounds);
		
		return scqnaList;
	}

	@Override
	public ScQnaVO selectScqnaDetail(int scqBno) throws SQLException {
		ScQnaVO scqna = session.selectOne("Scqna-Mapper.selectScqnaDetail",scqBno);
		return scqna;
	}

	@Override
	public void insertScqna(ScQnaVO scqna) throws SQLException {
		session.insert("Scqna-Mapper.insertScqna",scqna);
	}

	@Override
	public int selectScqBnoSeqNext() throws SQLException {
		int nextval = session.selectOne("Scqna-Mapper.selectScqBnoSeqNext");
		return nextval;
	}

	@Override
	public void insertReply(ScQnaVO vo) throws SQLException {
		session.insert("Scqna-Mapper.insertReply",vo);
		
		
	}

	@Override
	public void modifyReply(ScQnaVO vo) throws SQLException {
		session.insert("Scqna-Mapper.modifyReply",vo);
	}

	@Override
	public void deleteScqna(int scqBno) throws SQLException {
		session.delete("Scqna-Mapper.deleteScqna",scqBno);
	}

	@Override
	public void increaseViewCnt(int scqBno) throws SQLException {
		session.update("Scqna-Mapper.increaseViewCnt",scqBno);
	}

	@Override
	public int selectScqnaTotalCount(Criteria cri) throws SQLException {
		return session.selectOne("selectScqnaTotalCount",cri);
	}

	@Override
	public int selectBnoCount() throws SQLException {
		int selectBnoCount = session.selectOne("Scqna-Mapper.selectBnoCount");
		return selectBnoCount;
	}

	@Override
	public int selectReplyNullCount() throws SQLException {
		int selectReplyNullCount = session.selectOne("Scqna-Mapper.selectNullCount");
		return selectReplyNullCount;
	}


	

}
