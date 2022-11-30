package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.staff.ExcelVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ExcelDAOImpl implements ExcelDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ExcelVO> selectUserRegistList(CriteriaLec cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ExcelVO> selectList = session.selectList("Excel-Mapper.selectUserRegistList",cri,rowBounds);
		
		return selectList;
	}
	
	@Override
	public int selectExcelTotalCount(CriteriaLec cri) throws SQLException {
		int count = session.selectOne("Excel-Mapper.selectExcelTotalCount", cri);
		return count;
	}

	@Override
	public void insertExcelMember(Map<String, String> hashmap) throws SQLException {
		log.debug("다오멥데이터 : " + hashmap);
		
		
		session.update("Excel-Mapper.insertExcelMember",hashmap);
	}


	@Override
	public void insertExcelStudent(Map<String, String> hashmap) throws SQLException {
		
		session.update("Excel-Mapper.insertExcelStudent",hashmap);
		
	}

	@Override
	public void insertExcelStuMajor(Map<String, String> hashmap) throws SQLException {
		
		session.update("Excel-Mapper.insertExcelStuMajor",hashmap);
	}

	@Override
	public List<ExcelVO> selectCollegeList() throws SQLException {
		return session.selectList("Excel-Mapper.selectCollegeList");
	}

	@Override
	public int selectStuMajorCdNextVal() throws SQLException {
		return session.selectOne("Excel-Mapper.selectStuMajorCdNextVal");
	}



	
	

}
