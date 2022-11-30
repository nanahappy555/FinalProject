package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.staff.ExcelVO;

public interface ExcelDAO {
	
	List<ExcelVO> selectUserRegistList(CriteriaLec cri) throws SQLException;
	
	List<ExcelVO> selectCollegeList() throws SQLException;
	
	int selectExcelTotalCount(CriteriaLec cri) throws SQLException;
	
	void insertExcelMember(Map<String, String> hashmap) throws SQLException;
	void insertExcelStudent(Map<String, String> hashmap) throws SQLException;
	void insertExcelStuMajor(Map<String, String> hashmap) throws SQLException;
	int selectStuMajorCdNextVal() throws SQLException;
}
