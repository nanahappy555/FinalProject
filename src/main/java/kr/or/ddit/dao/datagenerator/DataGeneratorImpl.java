package kr.or.ddit.dao.datagenerator;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.datagenerator.DataGeneratorLectureVO;
import kr.or.ddit.dto.datagenerator.DataGeneratorVO;

public class DataGeneratorImpl implements DataGenerator {
	
	SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	@Override
	public void insertIntoMember(DataGeneratorVO dvo) {
		session.insert("Data-Mapper.insertIntoMember",dvo);
	}

	@Override
	public void insertIntoStudent(DataGeneratorVO dvo) {
		session.insert("Data-Mapper.insertIntoStudent",dvo);
	}

	@Override
	public void insertIntoStuMajor(DataGeneratorVO dvo) {
		session.insert("Data-Mapper.insertIntoStuMajor",dvo);
	}

	@Override
	public void insertIntoCompany(DataGeneratorVO dvo) {
		session.insert("Data-Mapper.insertIntoCompany",dvo);
	}

	@Override
	public void insertIntoCompanySec(DataGeneratorVO dvo) {
		session.insert("Data-Mapper.insertIntoCompanySec",dvo);
	}

	@Override
	public void insertIntoMajor(DataGeneratorVO dvo) {
		session.insert("Data-Mapper.insertIntoMajor",dvo);
	}

	@Override
	public void insertIntoCollege(DataGeneratorVO dvo) {
		session.insert("Data-Mapper.insertIntoCollege",dvo);
	}

	
	@Override
	public void insertIntoLecManage(DataGeneratorLectureVO lvo) {
		session.insert("Data-Mapper.insertIntoLecManage",lvo);
	}
	@Override
	public void insertIntoGeCategory(DataGeneratorLectureVO lvo) {
		session.insert("Data-Mapper.insertIntoGeCategory",lvo);
	}
	
	@Override
	public void insertIntoSyllabus(DataGeneratorLectureVO lvo) {
		session.insert("Data-Mapper.insertIntoSyllabus",lvo);
	}
	@Override
	public void insertIntoLecOpen(DataGeneratorLectureVO lvo) {
		session.insert("Data-Mapper.insertIntoLecOpen",lvo);		
	}
	@Override
	public void insertIntoLec(DataGeneratorVO lvo) {
		session.insert("Data-Mapper.insertIntoLec",lvo);
	}
	
	@Override
	public void insertIntoSemesterStu(DataGeneratorLectureVO lvo) {
		session.insert("Data-Mapper.insertIntoSemesterStu",lvo);
	}
	
	@Override
	public void insertIntoProf(DataGeneratorVO dgv) {
		session.insert("Data-Mapper.insertIntoProf",dgv);
	}
	
	@Override
	public void insertIntoMajorSeme(DataGeneratorVO dgv) {
		session.insert("Data-Mapper.insertIntoMajorSeme",dgv);
	}

	@Override
	public List<String> selectSecCdList() {
		List<String> secCdList= session.selectList("Data-Mapper.selectSecCdList");
		return secCdList;
	}

	@Override
	public List<DataGeneratorVO> selectListMember() {
		
		return session.selectList("Data-Mapper.selectListMember");
	}
	
	
	

	@Override
	public List<DataGeneratorVO> selectListStuMajor() {
		return null;
	}

	@Override
	public List<DataGeneratorVO> selectListCollege() {
		
		return null;
	}

	@Override
	public List<String> selectListMajor() {
		List<String> majorList= session.selectList("Data-Mapper.selectListMajor");
		return majorList;
	}
	@Override
	public List<String> selectStudentList() {
		List<String> memberList = session.selectList("Data-Mapper.selectStudentList");
		return memberList;
	}
	@Override
	public List<String> selectListCompanyCdList(){
		List<String> companyList = session.selectList("Data-Mapper.selectListCompanyCdList");
		return companyList;
	}
	@Override
	public List<String> selectListOpenLecFromSyllabus() {
		List<String> openLecList = session.selectList("Data-Mapper.selectListOpenLecFromSyllabus");
		return openLecList;
	}
	@Override
	public List<String> selectListOpenLecFromLecOpen() {
		List<String> openLecList = session.selectList("Data-Mapper.selectListOpenLecFromLecOpen");
		return openLecList;
	}
	@Override
	public List<DataGeneratorVO> selectListLecManage() {
		return session.selectList("Data-Mapper.selectListLecManage");
	}
	@Override
	public List<DataGeneratorVO> selectListProf() {
		return session.selectList("Data-Mapper.selectListProf");
	}
	@Override
	public List<String> selectListSubjectByProfCd(String profId) {
		return session.selectList("Data-Mapper.selectListSubjectByProfCd",profId);
	}
	@Override
	public List<String> selectListGeSubject() {
		return session.selectList("Data-Mapper.selectListGeSubject");
	}
	@Override
	public List<Integer> selectMaxStuNum(){
		return session.selectList("Data-Mapper.selectMaxStuNum");
	}
	@Override
	public List<String> selectSylCd(){
		return session.selectList("Data-Mapper.selectSylCd");
	}
	
	@Override
	public void updateLecOpen(DataGeneratorVO dgv) {
		session.update("Data-Mapper.updateLecOpen",dgv);
	}
	@Override
	public List<String> selectLecCdByStuCd(String str) {
		return session.selectList("Data-Mapper.selectLecCdByStuCd",str);
	}
	@Override
	public void insertIntoSurveyForm(DataGeneratorVO dgv) {
		session.insert("Data-Mapper.insertIntoSurveyForm",dgv);
	}
	@Override
	public String selectMaxCreditbyStuCdSemeCd(String stuCd) {
		return session.selectOne("Data-Mapper.selectMaxCreditbyStuCdSemeCd",stuCd);
	}
	@Override
	public void updateProfName(DataGeneratorVO datagenerator) {
		session.update("Data-Mapper.updateProfName",datagenerator);
	}
	@Override
	public void updateStudentName(DataGeneratorVO datagenerator) {
		session.update("Data-Mapper.updateStudentName",datagenerator);		
	}
	@Override
	public List<DataGeneratorVO> selectStuList() {
		return session.selectList("Data-Mapper.selectStuList");
	}
	@Override
	public DataGeneratorVO selectMemberByMemId(String memId) {
		return session.selectOne("Data-Mapper.selectMemberByMemId",memId);
	}
}
