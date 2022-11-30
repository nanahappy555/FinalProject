package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.prof.SyllabusVO;
import kr.or.ddit.dto.prof.WeekLearningVO;
import kr.or.ddit.dto.staff.SyllabusDetailVO;
import kr.or.ddit.dto.staff.SyllabusManegeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SyllabusDAOImpl implements SyllabusDAO{

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<SyllabusVO> selectSyllabusList(Criteria cri,String profId) throws SQLException {
		
		return null;
	}


	@Override
	public SyllabusVO selectSyllabusBysylCd(String sylCd) throws SQLException {
		SyllabusVO syllabus = session.selectOne("Syllabus-Mapper.selectSyllabusBySylCd",sylCd);
		return syllabus;
	}

	@Override
	public void insertSyllabus(SyllabusVO syllabusVO) throws SQLException {
		session.insert("Syllabus-Mapper.insertSyllabus",syllabusVO);
		
	}

	@Override
	public int selectSyllabusTotalCount(Criteria cri) throws SQLException {
		int totalCount = session.selectOne("Syllabus-Mapper.selectSyllabusCount",cri);
		return totalCount;
	}
	
	@Override
	public List<SyllabusManegeVO> selectManageSyllabus(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<SyllabusManegeVO> manageSyllabusList = session.selectList("Syllabus-Mapper.selectManageSyllabus",cri,rowBounds);
		log.debug("실라버스다오임플",manageSyllabusList.toString());
		
		return manageSyllabusList;
	}

	@Override
	public void updateSyllabusApply(SyllabusVO syllaVO) throws SQLException {
		session.update("Syllabus-Mapper.updateSyllabusApply",syllaVO);
		
	}

	@Override
	public SyllabusDetailVO selectSyllabusDetail(String sylCd) throws SQLException {
		SyllabusDetailVO syllaDetail = session.selectOne("Syllabus-Mapper.selectSyllabusDetail",sylCd);
		
		log.debug(sylCd);
		
		return syllaDetail;
	}

	@Override
	public List<WeekLearningVO> selectWeekDetail(String sylCd) throws SQLException {
		List<WeekLearningVO> selectDetailWeekList = session.selectList("Syllabus-Mapper.selectDetatilWeek",sylCd);
		
		return selectDetailWeekList;
	}

	@Override
	public List<SyllabusVO> selectSyllabusByProfId(CriteriaLec cri) {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<SyllabusVO> selectList = session.selectList("Syllabus-Mapper.selectSyllabusByProfId",cri,rowBounds);
		
		return selectList;
	}

	@Override
	public int selectSyllabusTotalCountByProfId(CriteriaLec cri) {
		int totalCount = session.selectOne("Syllabus-Mapper.selectCountByProfId",cri);
		return totalCount;
	}

	@Override
	public int selectNextVal() {
		int nextVal = session.selectOne("Syllabus-Mapper.selectNextVal");
		return nextVal;
	}

}
