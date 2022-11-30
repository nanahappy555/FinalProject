package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.prof.SyllabusVO;
import kr.or.ddit.dto.prof.WeekLearningVO;
import kr.or.ddit.dto.staff.SyllabusDetailVO;

public interface SyllabusService {
	
	List<SyllabusVO> getSyllabusList(Criteria cri) throws SQLException;
	SyllabusVO getSyllabusBySylCd(String sylCd) throws SQLException;
	
	//강의계획서 신청 리스트
	Map<String, Object> getSyllabusManegeList(Criteria cri)throws SQLException;
	
	//강의계획서 신청 리스트 승인/반려 
	public void updateSyllabusStatus(Map<String, Object> dataMap)throws SQLException;
	
	//강의계획서 신청 디테일 화면
	SyllabusDetailVO getSyllabusDetail(String sylCd)throws SQLException;
	List<WeekLearningVO> getDetailWeek(String sylCd)throws SQLException;
	
	//강의계획서 디테일 승인/반려
	public void updateSyllabusDetailStatus(SyllabusVO sylla)throws SQLException;
	public Map<String, Object> getSyllabusListByProfId(CriteriaLec cri);
	public String registSyllabus(SyllabusVO syllabusVO, HttpServletRequest request) throws SQLException;
	
	//강의계획서 디테일 반려 사유 입력
//	public void updateRejReason(SyllabusVO vo)throws SQLException;
}
