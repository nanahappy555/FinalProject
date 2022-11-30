package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.prof.AssignmentVO;

public interface AssignmentService {
	public Map<String, Object> getAssignemtList(CriteriaLec cri) throws SQLException;
	public AssignmentVO getDetail(AssignmentVO vo) throws SQLException;
	public void registAssignment(AssignmentVO vo) throws SQLException;
	public void modifyAssignment(AssignmentVO vo) throws SQLException;
	public void removeAssignment(int assBno) throws SQLException;
	
}
