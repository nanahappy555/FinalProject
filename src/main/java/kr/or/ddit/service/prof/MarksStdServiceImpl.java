package kr.or.ddit.service.prof;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.prof.MarksStdDAO;
import kr.or.ddit.dto.prof.MarksStdVO;

@Service
public class MarksStdServiceImpl implements MarksStdService {

	@Autowired
	private MarksStdDAO marksStdDAO;
	
	@Override
	public void registMarksStd(MarksStdVO vo, String sylCd) throws SQLException {
		vo.setSylCd(sylCd);
		marksStdDAO.insertMarksStd(vo);
	}

}
