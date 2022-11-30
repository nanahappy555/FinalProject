package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;

public interface MyLecAssignmentService{

	 Map<String, Object>selectMyAssignmentList(CriteriaLec cri)  throws SQLException;

	 MyLecAssignmentVO selectMyAssignMentFromList(int assBno)throws SQLException;

	MyLecAssignmentVO selectMyAssignMent(int assBno) throws SQLException;

	void submitAssign(MyLecAssignmentVO assSub) throws SQLException;
	
	MyLecAssignmentVO selectAssSubmit(MyLecAssignmentVO assSub) throws SQLException;

	List<MyLecAssignmentVO> selectBoardAssignmentList(CriteriaLec cri) throws SQLException;

	void deleteAssSubmit(AttachVO attach) throws SQLException;;
}
