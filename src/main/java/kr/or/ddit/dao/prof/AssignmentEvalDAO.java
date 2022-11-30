package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.MyLecAssignmentVO;

public interface AssignmentEvalDAO {
	public List<MyLecAssignmentVO> selectAllStuListByLecCdAssBno(MyLecAssignmentVO vo)throws SQLException;
	public MyLecAssignmentVO selectStuAssDetail(MyLecAssignmentVO vo)throws SQLException;
	public void updateAssignment(MyLecAssignmentVO vo)throws SQLException;
	
}
