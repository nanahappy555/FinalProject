package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.staff.ScNoticeDAO;
import kr.or.ddit.dto.staff.ScNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ScNoticeServiceImpl implements ScNoticeService{
	
	@Autowired
	private ScNoticeDAO scNoticeDAO;
	
	public void setScNoticeDAO(ScNoticeDAO scNoticeDAO) {
		this.scNoticeDAO = scNoticeDAO;
	}
	
	@Override
	public Map<String, Object> getScNoticeList(Criteria cri) throws SQLException {
		
		Criteria searchCri = (Criteria) cri;
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ScNoticeVO> sList = scNoticeDAO.selectScNoticeList(searchCri);
		
		int totalCount = scNoticeDAO.selectScNoticeTotalCount(searchCri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("scNoticeList", sList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public ScNoticeVO selectOneScNotice(int scNno) throws SQLException {
	
		ScNoticeVO sOne = scNoticeDAO.selectOneScNotice(scNno) ;
		
		  log.info("서비스 들어옴."); 
		  scNoticeDAO.increaseViewCnt(scNno); 
		  log.info("서비스 나감");
		 
		return sOne;
	}

	@Override
	public void modifyScNotice(ScNoticeVO scNotice) throws SQLException {
		/* log.info("서비스 들어옴."); */
		scNoticeDAO.updatescNotice(scNotice);
		/* log.info("서비스 나감"); */
		
	}
	
	@Override
	public void regist(ScNoticeVO scNotice) throws SQLException{
		int scNno = scNoticeDAO.selectScNnoNextValue();
		scNotice.setScNno(scNno);
		scNoticeDAO.insertscNotice(scNotice);
		
	}

	@Override
	public void modify(ScNoticeVO scNotice) throws SQLException {
		scNoticeDAO.updatescNotice(scNotice);
		
	}

	@Override
	public void remove(int scNno) throws SQLException {
		scNoticeDAO.deletescNotice(scNno);
		
	}
	
	


	
	


}
