package kr.or.ddit.dao.datagenerator;

import java.util.List;

import kr.or.ddit.dto.datagenerator.DataGeneratorLectureVO;
import kr.or.ddit.dto.datagenerator.DataGeneratorVO;

public interface DataGenerator {
	public void insertIntoMember(DataGeneratorVO dvo);
	public void insertIntoStudent(DataGeneratorVO dvo);
	public void insertIntoStuMajor(DataGeneratorVO dvo);
	public void insertIntoCompany(DataGeneratorVO dvo);
	public void insertIntoCompanySec(DataGeneratorVO dvo);
	public void insertIntoMajor(DataGeneratorVO dvo);
	public void insertIntoCollege(DataGeneratorVO dvo);
	public void insertIntoLecManage(DataGeneratorLectureVO lvo);
	public void insertIntoGeCategory(DataGeneratorLectureVO lvo);
	public void insertIntoSyllabus(DataGeneratorLectureVO lvo);
	public void insertIntoLecOpen(DataGeneratorLectureVO lvo);
	public void insertIntoLec(DataGeneratorVO lvo);
	public void insertIntoSemesterStu(DataGeneratorLectureVO lvo);
	public void insertIntoProf(DataGeneratorVO dgv);
	void updateLecOpen(DataGeneratorVO dgv);
	void insertIntoMajorSeme(DataGeneratorVO dgv);
	void insertIntoSurveyForm(DataGeneratorVO dgv);
	
	public String selectMaxCreditbyStuCdSemeCd(String stuCd);
	
	public List<String> selectListGeSubject();
	public List<String> selectSecCdList();
	public List<DataGeneratorVO> selectListMember();
	public List<DataGeneratorVO> selectListStuMajor();
	public List<DataGeneratorVO> selectListCollege();
	public List<String> selectListMajor();
	public List<String> selectStudentList();
	public List<String> selectListCompanyCdList();
	public List<String> selectListOpenLecFromSyllabus();
	public List<String> selectListOpenLecFromLecOpen();
	public List<DataGeneratorVO> selectListLecManage();
	public List<DataGeneratorVO> selectListProf();
	public List<String> selectListSubjectByProfCd(String profId);
	public List<Integer> selectMaxStuNum();
	List<String> selectSylCd();

	List<String> selectLecCdByStuCd(String str);
	void updateProfName(DataGeneratorVO datagenerator);
	void updateStudentName(DataGeneratorVO datagenerator);
	
	List<DataGeneratorVO> selectStuList();
	DataGeneratorVO selectMemberByMemId(String memId);
}
