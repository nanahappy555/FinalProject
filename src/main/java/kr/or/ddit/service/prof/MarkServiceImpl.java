package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.prof.MarkDAO;
import kr.or.ddit.dto.prof.MarkVO;
import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class MarkServiceImpl implements MarkService {

	
	@Autowired
	private MarkDAO markDAO;
	
	@Override
	public List<MarkVO> getMarkList(String lecCd) throws SQLException {
		
		MarkVO ratioVO = markDAO.selectRatio(lecCd);
		log.debug("비율" + ratioVO);
		int attendRatio = ratioVO.getAttendRatio();
		int assignRatio = ratioVO.getAssignRatio();
		int midRatio = ratioVO.getMidRatio();
		int finalRatio = ratioVO.getFinalRatio();
		
		
		
		
		List<MarkVO> allStudent = markDAO.selectAllStudent(lecCd);
		List<MarkVO> assScoreList = markDAO.selectAssScore(lecCd);
		List<MarkVO> midScoreList = markDAO.selectMidScore(lecCd);
		List<MarkVO> finScoreList = markDAO.selectFinScore(lecCd);
		List<MarkVO> attendList = markDAO.selectAttendScore(lecCd);
		
		List<String> attendNoDuple=new ArrayList<String>();
		for(MarkVO mark : attendList) {
			String stuCd = mark.getStuCd();
			if(attendNoDuple.indexOf(stuCd)<0) {
				attendNoDuple.add(stuCd);
			}
		}
		
		log.debug("중복제거 학생 수 : "+attendNoDuple.size());
		
		log.debug("모든학생 수 :" + allStudent.size());
		log.debug("모든출석학생 수 :" + attendList.size());
		
		
		log.debug("중간고사리스트 :" + midScoreList.toString());
		
		
		
		String[] allStu = new String[allStudent.size()];
		double[] allAttendScore = new double[allStudent.size()];
		int[] countArr = new int[allStudent.size()];
		
		for (int i = 0; i < allStudent.size(); i++) {
			allStu[i] = allStudent.get(i).getStuCd();
		}
		
		 for (int i = 0; i < attendNoDuple.size(); i++) {
		 	String stuCd= attendNoDuple.get(i);
			int index = Arrays.asList(allStu).indexOf(stuCd);
			
			allAttendScore[index] = 100;
			 
		} 
		
		int index=-1;
		for (int i = 0; i < attendList.size(); i++) {
			MarkVO vo = attendList.get(i);
			String stuCd = vo.getStuCd();
			index = Arrays.asList(allStu).indexOf(stuCd);
			
			if (vo.getAttendStatusCd().equals("absent")) {
				
				allAttendScore[index]-=vo.getAttendCount();
			}
			if (vo.getAttendStatusCd().equals("late") || vo.getAttendStatusCd().equals("le")) {
				
				countArr[index]+=vo.getAttendCount();
			}
			
		}
		
		for (int i = 0; i < countArr.length; i++) {
			allAttendScore[index]-= countArr[i]/3;
		}
		
		
		
		
		
		
		
		
		
		
		
		for (int i = 0; i < allStudent.size(); i++) {
			String allStuCd =allStudent.get(i).getStuCd();
			
			allStudent.get(i).setAssignRatio(assignRatio);
			allStudent.get(i).setMidRatio(midRatio);
			allStudent.get(i).setFinalRatio(finalRatio);
			allStudent.get(i).setAttendRatio(attendRatio);
			allStudent.get(i).setLecCd(lecCd);
			
			
			
			
			
			
			
			
			
			for (int j = 0; j < assScoreList.size(); j++) {
				String assStuCd = assScoreList.get(j).getStuCd();
				
				if (allStuCd.equals(assStuCd)) {
					double assScore = assScoreList.get(j).getAssScore();
					allStudent.get(i).setAssScore(assScore);
				}
			}
			
			for (int k = 0; k < midScoreList.size(); k++) {
				String midStuCd = midScoreList.get(k).getStuCd();
				if (allStuCd.equals(midStuCd)) {
					log.debug("중간고사 : " + midScoreList.get(k).getMidRatio());
					
					double midScore = midScoreList.get(k).getMidScore();
					
					allStudent.get(i).setMidScore(midScore);
				}
			}
			
			for (int p = 0; p < finScoreList.size(); p++) {
				String finStuCd = finScoreList.get(p).getStuCd();
				if (allStuCd.equals(finStuCd)) {
					double finScore = finScoreList.get(p).getFinScore();
					
					allStudent.get(i).setFinScore(finScore);
				}
			}
			log.debug("출결점수" + allAttendScore[i]);
			allStudent.get(i).setAttendScore(allAttendScore[i]);
			
		}
		

		return allStudent;
	}

	@Override
	public void modifyScore(MarkVO vo) throws SQLException {
		markDAO.updateScore(vo);
		
		MarkVO midScore = markDAO.selectMidScore(vo);
		MarkVO finScore = markDAO.selectFinScore(vo);
		
		log.debug("중간점수 : " + midScore);
		log.debug("기말점수 : " + finScore);
		if (midScore == null) {
			markDAO.insertMidScore(vo);
		}else {
			markDAO.updateMidScore(vo);
		}
		
		if (finScore == null) {
			markDAO.insertFinScore(vo);
		}else {
			markDAO.updateFinScore(vo);
		}
		
	}
	
	

}
