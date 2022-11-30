package kr.or.ddit.service.stu.tuition;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.stu.tuition.TuitionDAO;
import kr.or.ddit.dto.stu.TuitionVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class TuitionServiceImpl implements TuitionService {
	
	@Autowired
	private TuitionDAO tuitionDAO;

	
	
	@Override
	public List<TuitionVO> selectStuTuitionList(String stuCd) throws SQLException {
		
		List<TuitionVO> tuitionList = tuitionDAO.selectStuTuitionList(stuCd);
		log.debug("서비스 체크>>>>>>>>>>>"+ tuitionList); 
		return tuitionList;
	}
	
	
	
	
}
