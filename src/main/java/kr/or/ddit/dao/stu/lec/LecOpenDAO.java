package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.prof.LecOpenVO;

public interface LecOpenDAO {
	public LecOpenVO selectOne(String lecCd) throws SQLException;
	public List<LecOpenVO> selectList() throws SQLException;
	public void addStuNum(String lecCd) throws SQLException;
	public void subtractStuNum(String lecCd);
	
	List<LecOpenVO> selectLecAssSubmitStuList(String memId) throws SQLException;
}
