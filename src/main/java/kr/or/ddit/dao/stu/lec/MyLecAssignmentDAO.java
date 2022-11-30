package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;

public interface MyLecAssignmentDAO {
	
	List<MyLecAssignmentVO> selectMyAssignmentList(CriteriaLec cri) throws SQLException;
	
	int selectMyAssignmentTotalCount(CriteriaLec cri) throws SQLException;

	MyLecAssignmentVO selectMyAssignMent(int assBno)  throws SQLException;
	void increaseAssignmentViewCnt(int assBno)  throws SQLException;

	MyLecAssignmentVO selectAssSubmit(MyLecAssignmentVO assSub) throws SQLException;

	void insertAssSubmit(MyLecAssignmentVO assSub)throws SQLException;

	void updateAssSubmit(MyLecAssignmentVO assSub)throws SQLException;
}
