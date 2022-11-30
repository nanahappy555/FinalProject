package kr.or.ddit.service.stu.aca;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.dao.stu.aca.StuMajorDAO;
import kr.or.ddit.dto.stu.ClubVO;
import kr.or.ddit.dto.stu.StuMajorVO;

public class StuMajorServiceImpl implements StuMajorService{

	@Autowired
	private StuMajorDAO stuMajorDAO;
	
	public void setStuMajorDAO(StuMajorDAO stuMajorDAO) {
		this.stuMajorDAO = stuMajorDAO;
	}
	
	@Override
	public List<StuMajorVO> selectStuMajorList(String stuCd) throws SQLException {
		List<StuMajorVO> selectMajorCh = stuMajorDAO.selectStuMajorList(stuCd);
		return selectMajorCh;
	}
	@Override
	public String selectCollegeNameByStuCd(String stuCd) throws SQLException{
		return stuMajorDAO.selectCollegeNameByStuCd(stuCd);
	}

	@Override
	public ClubVO selectClub(String stuCd) throws SQLException {
		return stuMajorDAO.selectClub(stuCd);
	}
}
