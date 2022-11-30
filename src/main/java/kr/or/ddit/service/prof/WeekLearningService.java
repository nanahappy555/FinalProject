package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.prof.WeekLearningVO;

public interface WeekLearningService {
	public void registWeekLearning(List<WeekLearningVO> list,String sylCd)throws SQLException;

}
