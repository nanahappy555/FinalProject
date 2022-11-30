package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.prof.LectureListVO;

public interface LectureListForProfDAO {
	public List<LectureListVO> selectLectureListCriteria(Criteria cri,String prodId) throws SQLException;
	public int selectLectureListCriteriaTotalCount(String prodId,Criteria cri) throws SQLException;
}
