package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.or.ddit.dto.stu.ApplyPageVO;

public interface ApplyPageDAO {
	public List<ApplyPageVO> selectLectureList()throws SQLException;
	public String selectMaxCredit(HashMap<String,String> map) throws SQLException;
	public String selectCurentCredit(String stuCd) throws SQLException;
}
