package kr.or.ddit.service.stu.tuition;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.TuitionVO;


public interface TuitionService {
	
	List<TuitionVO> selectStuTuitionList(String stuCd) throws SQLException;

}
