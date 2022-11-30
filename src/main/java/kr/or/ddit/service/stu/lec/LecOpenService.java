package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.prof.LecOpenVO;

public interface LecOpenService {
	public LecOpenVO selectOne(String lecCd) throws SQLException;
	public List<LecOpenVO> selectList() throws SQLException;
	public void addStuNum(String lecCd) throws SQLException;
	public void subtractStuNum(String lecCd) throws SQLException;
}
