package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.controller.MakeFileName;
import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.prof.WeekNoticeDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.prof.WeekNoticeVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WeekNoticeServiceImpl implements WeekNoticeService{

	@Autowired
	private AttachDAO attachDAO;
	
	@Autowired
	private WeekNoticeDAO weekNoticeDAO;
	
	@Override
	public void registWeekNotice(WeekNoticeVO vo) throws SQLException {
		List<AttachVO> attachList = vo.getAttachList();
		
		
		int anoNextval = attachDAO.selectAnoNextval();
		int anoSeq = 1;
		
		for (AttachVO eachVO : attachList) {
			eachVO.setAnoCd(anoNextval);
			eachVO.setAnoSeq(anoSeq);
			attachDAO.insertAttach(eachVO);
			anoSeq++;
		}
		vo.setAnoCd(anoNextval);
		weekNoticeDAO.InsertWeekNotice(vo);
	}

	
	
	
	@Override
	public WeekNoticeVO getMaterialDetail(WeekNoticeVO vo) throws SQLException {
		
		WeekNoticeVO resultVO = weekNoticeDAO.selectMaterialDetail(vo);
	
		List<AttachVO> attachList = attachDAO.selectAttachList(resultVO.getAnoCd()); 
		resultVO.setAttachList(attachList);
		for (AttachVO eachVO : attachList) {
			eachVO.setAnoCd(resultVO.getAnoCd());
			String originalFileName
			= MakeFileName.parseFileNameFromUUID(eachVO.getFilename(), "\\$\\$");
			eachVO.setFilename(originalFileName);
		}
		resultVO.setAttachList(attachList);
		log.debug("어태치 : " + resultVO);
		return resultVO;
	}

	@Override
	public void modifyWeekNotice(WeekNoticeVO vo) throws SQLException {
		List<AttachVO> attachList = vo.getAttachList();
		int anoSeq = 0;
		int anoCd = 0;
		if (attachList == null) {
			anoCd = attachDAO.selectAnoNextval();
		}else {
			anoCd = vo.getAnoCd();
			anoSeq = attachDAO.selectMaxAnoSeq(vo.getAnoCd());
		}
		
		for (AttachVO eachVO : attachList) {
			eachVO.setAnoCd(anoCd);
			eachVO.setAnoSeq(anoSeq);
			attachDAO.insertAttach(eachVO);
			anoSeq++;
		}
		weekNoticeDAO.updateWeekNotice(vo);
	}

}
