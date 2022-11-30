package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.LecNoticeVO;

@Repository
public class LectureNoticeDAOImpl implements LectureNoticeDAO{

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<LecNoticeVO> selectLectureNoticeListByLecCd(CriteriaLec cri) throws SQLException {
		
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<LecNoticeVO> noticeList = 
				session.selectList("LectureNotice-Mapper.selectLectureNoticeListByLecCd",cri,rowBounds);
		return noticeList;
	}

	@Override
	public int selectLectureNoticeTotalCountByLecCd(CriteriaLec cri) throws SQLException {
		int count = session.selectOne("LectureNotice-Mapper.selectLectureNoticeTotalCountByLecCd", cri);
		return count;
	}

	@Override
	public LecNoticeVO selectLectureNoticeByLecNoticeNo(LecNoticeVO lecNotice) throws SQLException {
		LecNoticeVO notice = session.selectOne("LectureNotice-Mapper.selectLectureNoticeByLecNoticeNo",lecNotice); 
		return notice;
	}

	@Override
	public LecNoticeVO selectLectureNoticeByImage(String imageFile) throws SQLException {
		LecNoticeVO notice = session.selectOne("LectureNotice-Mapper.selectLectureNoticeByImage",imageFile);
		return notice;
	}

	@Override
	public void insertLectureNotice(LecNoticeVO lecNotice) throws SQLException {
		session.update("LectureNotice-Mapper.insertLectureNotice",lecNotice);
	}

	@Override
	public void updateLectureNotice(LecNoticeVO lecNotice) throws SQLException {
		session.update("LectureNotice-Mapper.updateLectureNotice",lecNotice);
		
	}

	@Override
	public void deleteLectureNotice(int lecNoticeNo) throws SQLException {
		session.update("LectureNotice-Mapper.deleteLectureNotice",lecNoticeNo);
		
	}

	@Override
	public void increaseViewCnt(int lecNoticeNo) throws SQLException {
		session.update("LectureNotice-Mapper.increaseViewCnt",lecNoticeNo);
	}

	@Override
	public int selectLectureNoticeSeqNext() throws SQLException {
		int seq_num = session.selectOne("LectureNotice-Mapper.selectLectureNoticeSeqNext");
		return seq_num;
	}


	
}
