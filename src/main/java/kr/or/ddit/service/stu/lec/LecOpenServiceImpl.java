package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.stu.lec.LecOpenDAO;
import kr.or.ddit.dto.prof.LecOpenVO;

public class LecOpenServiceImpl implements LecOpenService {

	
	private LecOpenDAO lecOpenDAO;	

	public void setLecOpenDAO(LecOpenDAO lecOpenDAO) {
		this.lecOpenDAO = lecOpenDAO;
	}

	@Override
	public LecOpenVO selectOne(String lecCd) throws SQLException {
		LecOpenVO selectOne = lecOpenDAO.selectOne(lecCd);
		
		return selectOne;
	}

	@Override
	public void addStuNum(String lecCd) throws SQLException {
		lecOpenDAO.addStuNum(lecCd);
	}

	@Override
	public List<LecOpenVO> selectList() throws SQLException {
		List<LecOpenVO> lecList = lecOpenDAO.selectList();
		return lecList;
	}

	@Override
	public void subtractStuNum(String lecCd) throws SQLException {
		lecOpenDAO.subtractStuNum(lecCd);
		
	}

}
