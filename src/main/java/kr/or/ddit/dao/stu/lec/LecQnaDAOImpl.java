package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.stu.LecQnaVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class LecQnaDAOImpl implements LecQnaDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<LecQnaVO> selectLecQnaList(CriteriaLec cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
//		log.debug("세션값"+session);
//		log.debug("크리렉코드" + cri.getLecCd());
		List<LecQnaVO> list = session.selectList("LecQna-Mapper.selectLecQnaList",cri,rowBounds);
		log.debug("질문리스트"+list);
		return list;
	}

	@Override
	public LecQnaVO selectLecQnaDetail(int lecqBno) throws SQLException {
		LecQnaVO detail = session.selectOne("LecQna-Mapper.selectLecQnaDetail",lecqBno);
		return detail;
	}

	@Override
	public int selectLecqBnoSeqNext() throws SQLException {
		int nextVal = session.selectOne("LecQna-Mapper.selectLecqBnoSeqNext");
		return nextVal;
	}

	@Override
	public int selectLecQnaTotalCount(CriteriaLec cri) throws SQLException {
			int totalCount = session.selectOne("LecQna-Mapper.selectLecQnaTotalCount",cri);
		return totalCount;
	}

	@Override
	public void insertLecQna(LecQnaVO vo) throws SQLException {
		session.insert("LecQna-Mapper.insertLecQna",vo);
		
	}

	@Override
	public void updateReply(LecQnaVO vo) throws SQLException {
		session.update("LecQna-Mapper.updateReply", vo);
	}

	@Override
	public void deleteLecQna(int lecqBno) throws SQLException {
		session.delete("LecQna-Mapper.deleteLecQna", lecqBno);
	}

	@Override
	public void increaseViewCnt(int lecqBno) throws SQLException {
		session.update("LecQna-Mapper.increaseViewCnt",lecqBno);
	}

	@Override
	public List<LecQnaVO> selectLecQnaListByProfId(String profCd) {
		List<LecQnaVO> selectList = session.selectList("LecQna-Mapper.selectQnaListByProfId",profCd);
		return selectList;
	}

}
