package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.ScNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ScNoticeDAOImpl implements ScNoticeDAO{

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<ScNoticeVO> selectScNoticeList(Criteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<ScNoticeVO> selectList = session.selectList("Staff-Mapper.selectScNoticeList",cri,rowBounds);
		log.debug("#########확인" + selectList +"");
		
		return selectList;
	}
	@Override
	public ScNoticeVO selectOneScNotice(int scNno) throws SQLException {
		ScNoticeVO selectOne = session.selectOne("Staff-Mapper.selectOneScNotice", scNno);
		return selectOne;
	}

	@Override
	public void insertscNotice(ScNoticeVO scNotice) throws SQLException {
		session.update("Staff-Mapper.insertScNotice", scNotice);
		
	}
	@Override
	public void updatescNotice(ScNoticeVO scNotice) throws SQLException {
		
		/* log.info("다오 들어옴"); */
		session.update("Staff-Mapper.updateScNotice",scNotice);
		/* log.info("업데이트 성공"); */
		
	}
	@Override
	public void deletescNotice(int scNno) throws SQLException {
		session.update("Staff-Mapper.deleteScNotice", scNno);
		
	}
	@Override
	public int selectScNnoNextValue() throws SQLException {
		int sc_nno = session.selectOne("Staff-Mapper.selectScNnoNextValue");
		return sc_nno;
	}
	@Override
	public int selectScNoticeTotalCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Staff-Mapper.selectScNoticeTotalCount", cri);
		return count;
	}
	@Override
	public ScNoticeVO selectScNoticeByScNoticeNo(ScNoticeVO scNotice) throws SQLException {
		ScNoticeVO notice = session.selectOne("Staff-Mapper.selectScNoticeByScNoticeNo",scNotice);
		return notice;
	}
	@Override
	public void increaseViewCnt(int scNno) throws SQLException {
		log.info("다오 들어옴"); 
		session.update("Staff-Mapper.increaseViewCnt",scNno);
		
	}
	
	
	

	

}
