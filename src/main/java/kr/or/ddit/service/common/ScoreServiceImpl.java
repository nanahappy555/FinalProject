package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.common.ScoreDAO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.common.ScoreVO;
import kr.or.ddit.dto.stu.AttendVO;
import kr.or.ddit.dto.stu.LecVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import kr.or.ddit.dto.stu.SemesterStuVO;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ScoreServiceImpl implements ScoreService{
	
	private ScoreDAO scoreDAO;
	public void setScoreDAO(ScoreDAO scoreDAO) {
		this.scoreDAO=scoreDAO;
	}
	
	@Override
	public List<MyLectureVO> selectSubScorejInfo(LecVO lec) throws SQLException {
		return scoreDAO.selectSubScorejInfo(lec);
	}
	
	@Override
	public StudentVO selectStuInfo(String stuCd) throws SQLException {
		return scoreDAO.selectStuInfo(stuCd);
	}

	@Override
	public List<String> selectStuSubjGradeSeme(String stuCd) throws SQLException {
		return scoreDAO.selectStuSubjGradeSeme(stuCd);
	}
	
	public ScoreVO selectSubjScoreStd(LecVO lec)	throws SQLException{
		return scoreDAO.selectSubjScoreStd(lec);
	}

	@Override
	public LecVO selectLecInfo(LecVO lec) throws SQLException {
		LecVO lecture = scoreDAO.selectLecInfo(lec);
		return lecture;
	}

	@Override
	public AttendVO selectAttendScore(LecVO lec) throws SQLException {
		List<AttendVO> attendList = scoreDAO.selectAttendScore(lec);
		AttendVO attendResult = new AttendVO();
		for(AttendVO attend: attendList) {
			int	cnt = attend.getCount();
			String attendStatusCd = attend.getAttendStatusCd();
			if(attendStatusCd.equals("attend")) {
				attendResult.setAttendCnt(cnt);
			}else if(attendStatusCd.equals("late")) {
				attendResult.setLateCnt(cnt);
			}else if(attendStatusCd.equals("le")) {
				attendResult.setLeCnt(cnt);
			}else if(attendStatusCd.equals("absent")) {
				attendResult.setAbsentCnt(cnt);
			}
		}
		return attendResult;
	}

	@Override
	public List<MyLecAssignmentVO> selectAssList(LecVO lec) throws SQLException {
		return scoreDAO.selectAssList(lec);
	}

	@Override
	public Map<String,Object> selectStuSemeScore(String stuCd) throws SQLException {
		Map<String,Object> semeScoreMap = new HashMap<String,Object>();
		List<SemesterStuVO> semeScoreList = scoreDAO.selectStuSemeScore(stuCd);
		List<String> label = new ArrayList<String>();
		List<Double> data = new ArrayList<Double>();
		for(SemesterStuVO semeScoreStu : semeScoreList) {
			label.add(semeScoreStu.getGradeSeme());
			data.add(semeScoreStu.getTotalScore());
		}
		semeScoreMap.put("label",label);
		semeScoreMap.put("data",data);
		log.debug("확인 : "+semeScoreMap.get("label"));
		return semeScoreMap;
	}

	@Override
	public Map<String, Object> selectSubScoreDist(LecVO lec) throws SQLException {
		List<MyLectureVO> subScoreList = scoreDAO.selectSubScorejInfo(lec);
		Map<String, Object> subScoreMap = new HashMap<String,Object>();
		List<String> label = new ArrayList<String>();
		List<Double> data = new ArrayList<Double>();
		for(MyLectureVO subject : subScoreList) {
			label.add(subject.getSubjName());
			data.add(subject.getFinalScore());
		}
		subScoreMap.put("label",label);
		subScoreMap.put("data",data);
		return subScoreMap;
	}
	
	
	
	
	
	/*
	public List<ScoreVO> selectSubjTotalScore(LecVO lec) throws SQLException{
		List<ScoreVO> scoreList =new ArrayList<ScoreVO>();
		List<String> subjList = scoreDAO.selectThisSemesterSubjList(lec);
		for(int i=0;i<subjList.size();i++) {
			ScoreVO score = new ScoreVO();
			score.setLecCd(subjList.get(i));
			scoreList.add(score);
		}
		int [] calcAttendScore = new int[subjList.size()];
		int [] calcAttendStCd = new int[subjList.size()];
		for(int i=0;i<calcAttendScore.length;i++) {
			calcAttendScore[i]=100;
		}
		List<ScoreVO> subjStdList = scoreDAO.selectSubjScoreStd(lec);
		List<ScoreVO> assSubScoreList = scoreDAO.selectAllSubjAssSubScore(lec);
		List<ScoreVO> attendScoreList = scoreDAO.selectAllSubjAttendScore(lec);
		List<ScoreVO> midScoreList = scoreDAO.selectAllSubjMidScore(lec);
		List<ScoreVO> finScoreList = scoreDAO.selectAllSubjFinScore(lec);
		
		//출석 점수 계산
		for(ScoreVO attend: attendScoreList) {
			int subjIndex = subjList.indexOf(attend.getLecCd());
			String attendStCd = attend.getAttendStatusCd();
			if(attendStCd.equals("absent")) {
				calcAttendScore[subjIndex]-=attend.getAttendCount();
			}else if(attendStCd.equals("le")||attendStCd.equals("late")) {
				calcAttendStCd[subjIndex]+=attend.getAttendCount();
			}
		}
		
		for(int i=0;i<calcAttendStCd.length;i++) {
			calcAttendScore[i]-=calcAttendStCd[i]/3;
		}
		
		//전체 성적 점수 계산
		for(int i=0;i<subjStdList.size();i++) {
			ScoreVO subject  = subjStdList.get(i);
			double midRatio = subject.getMidRatio();
			double finRatio = subject.getFinalRatio();
			double assignRatio = subject.getAssignRatio();
			double attendRatio = subject.getAttendRatio();
			
			double assSubScore = assSubScoreList.get(i).getScore()*assignRatio*0.01;
			double attendScore = calcAttendScore[i]*attendRatio*0.01;
			double midScore = midScoreList.get(i).getScore()*midRatio*0.01;
			double finScore = finScoreList.get(i).getScore()*finRatio*0.01;
			
			double finalScore = assSubScore+attendScore+midScore+finScore;
			
			scoreList.get(i).setFinalScore(finalScore);
			
		}
		for(ScoreVO score: scoreList) {
			
			log.debug("확인 : "+score.getLecCd()+" : "+score.getFinalScore());
		}
		
	
		return scoreList;
	}
	*/
	
}
