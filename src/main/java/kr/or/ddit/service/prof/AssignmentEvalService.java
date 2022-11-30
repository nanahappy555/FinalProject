package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.MyLecAssignmentVO;

public interface AssignmentEvalService {
	public List<MyLecAssignmentVO> getLecStuListByLecCdAssBno(MyLecAssignmentVO vo) throws SQLException;
	public MyLecAssignmentVO getStuAssDetail(MyLecAssignmentVO vo)throws SQLException; 
	public void modifyAssignment(MyLecAssignmentVO vo) throws SQLException;
}
