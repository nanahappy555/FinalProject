package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.prof.SyllabusVO;
import kr.or.ddit.dto.prof.WeekLearningVO;
import kr.or.ddit.dto.staff.SyllabusDetailVO;
import kr.or.ddit.dto.staff.SyllabusManegeVO;



public interface SyllabusDAO {

	//강의계획서 목록
	List<SyllabusVO> selectSyllabusList(Criteria cri,String profId)throws SQLException;
	
	//강의계획서코드로 가져오기
	SyllabusVO selectSyllabusBysylCd(String sylCd) throws SQLException;
	
	//글등록
	void insertSyllabus(SyllabusVO syllabusVO) throws SQLException;
	
	//강의계획서 신청 목록
	List<SyllabusManegeVO> selectManageSyllabus(Criteria cri)throws SQLException;

	//강의계획서 신청목록 갯수
	public int selectSyllabusTotalCount(Criteria cri) throws SQLException;
	
	//승인,반려
	public void updateSyllabusApply(SyllabusVO syllaVO)throws SQLException;	
	
	//강의계획서 디테일 내용
	SyllabusDetailVO selectSyllabusDetail(String sylCd)throws SQLException;
	List<WeekLearningVO> selectWeekDetail(String sylCd)throws SQLException;

	public List<SyllabusVO> selectSyllabusByProfId(CriteriaLec cri);

	public int selectSyllabusTotalCountByProfId(CriteriaLec cri);

	public int selectNextVal();
	
	//강의계획서 디테일 반려 사유 입력
	//public void updateRejReason(SyllabusVO vo)throws SQLException;
	
}

