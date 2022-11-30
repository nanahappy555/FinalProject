package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.prof.WeekLearningDAO;
import kr.or.ddit.dto.prof.WeekLearningVO;

@Service
public class WeekLearningServiceImpl implements WeekLearningService {

	@Autowired
	private WeekLearningDAO weekLearningDAO;
	
	
	@Override
	public void registWeekLearning(List<WeekLearningVO> list, String sylCd) throws SQLException {
		
		int weekNo = 1;
		for (WeekLearningVO vo : list) {
			vo.setWeekNo(weekNo);
			vo.setSylCd(sylCd);
			weekLearningDAO.insertWeekLearningDAO(vo);
			weekNo++;
		}

	}

}
