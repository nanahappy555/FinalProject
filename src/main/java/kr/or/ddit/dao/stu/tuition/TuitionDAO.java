package kr.or.ddit.dao.stu.tuition;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.TuitionVO;

public interface TuitionDAO {

	List<TuitionVO> selectStuTuitionList(String stuCd) throws SQLException;
	
}
