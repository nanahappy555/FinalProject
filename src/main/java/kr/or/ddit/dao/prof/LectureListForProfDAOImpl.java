package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.prof.LectureListVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LectureListForProfDAOImpl implements LectureListForProfDAO{
	
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<LectureListVO> selectLectureListCriteria(Criteria cri, String prodId) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);	
		List<LectureListVO> list = session.selectList("LecOpen-Mapper.selectLectureListForProfByProfId", prodId, rowBounds);
		log.debug("강의리스트"+list);
		return list;
	}
	@Override
	public int selectLectureListCriteriaTotalCount(String prodId,Criteria cri) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("cri", cri);
		map.put("prodId", prodId);
		int totalCount = session.selectOne("selectLectureListForProfTotalCount",map);
		log.debug("숫자"+totalCount);
		return totalCount;
	}

}
