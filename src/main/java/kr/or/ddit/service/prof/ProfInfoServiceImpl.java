package kr.or.ddit.service.prof;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.prof.ProfDAO;
import kr.or.ddit.dto.prof.ProfVO;
@Service
public class ProfInfoServiceImpl implements ProfInfoService {

	@Autowired
	private ProfDAO profDAO;
	
	@Override
	public ProfVO getColNameMajorNameByProfCd(String profCd) throws SQLException {
		
		ProfVO profVO = profDAO.selectColNameMajorNameByProfCd(profCd);
		return profVO;
	}

}
