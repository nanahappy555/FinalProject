package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.staff.ExcelVO;

public interface ExcelService {
	
	Map<String, Object> getUserRegistList(CriteriaLec cri) throws SQLException;
	
	public List<ExcelVO> selectCollegeList() throws SQLException;
	
	public void insertExcelMember(Map<String,String> mapData) throws SQLException;
	
	public void insertExcelStudent(Map<String,String> mapData) throws SQLException;
	
	public void insertExcelStuMajor(Map<String,String> mapData) throws SQLException;

	
}
