package kr.or.ddit.dto.datagenerator;

import java.util.Date;

public class DataGeneratorVO {
	private String colCd;
	private String collegeCd;
	private String colName;
	private String semeCd;
	
	private String stuCd;
	private int tuition;
	private int availCredit;
	
	private int surveyNo;
	private String response;
	private String memId;
	private String memPwd;
	private String memStatusCd;
	private String memClassCd;
	
	
	private String companyCd;
	
	private String secCd;
	private String secName;
	
	private String majorCd;
	private String majorName;
	private String majorPhone;
	private String majorWeb;
	
	private String stuMajorCd;
	private String division;
	
	private String stuCode;
	private Date admDate;
	private String nation;
	private int tlRemained;
	private String acaState;
	private String mbti;
	private String clubCd;
	private int grade;
	private String stuSemester;
	
	private String id;
	private String pwd;
	private String name;
	private String ename;
	private String phone;
	private String add1;
	private String add2;
	private String email;
	private String bankName;
	private String accHolder;
	private String accNum;
	private String picName;
	private String picPath;
	private Date birthDate;
	private String status;
	private int loginFailed;
	private int memClass;
	
	private String stuSemster;
	private int tlTryCount;
	private String acaStateCd;
	private String zipcode;
	private String birthday;
	private String mbtiCd;
	private String stuId;
	
	private String subjCd;
	private String subjName;
	private String lecCategoryCd;
	private String targetGrade;
	private String credit;
	private String geCd;
	
	private String profCd;
	private String profPosiCd;
	
	private String lecOpenStatusCd;
	
	private String lecCd;
	private int finalMarks;
	private String mylecStatusCd;

	private String gradeSemeCd;
	
	private int stuNum;
	
	private int inPersonnel;
	private int outPersonnel;
	private int maxPersonnel;
	private int gradMinCredit;
	private int minReqCredit;
	private int mjElecCredit;
	private int geReqCredit;
	private int geElecCredit;
	private int lecApplyMax;
	
	
	
	public int getSurveyNo() {
		return surveyNo;
	}
	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public int getInPersonnel() {
		return inPersonnel;
	}
	public void setInPersonnel(int inPersonnel) {
		this.inPersonnel = inPersonnel;
	}
	public int getOutPersonnel() {
		return outPersonnel;
	}
	public void setOutPersonnel(int outPersonnel) {
		this.outPersonnel = outPersonnel;
	}
	public int getMaxPersonnel() {
		return maxPersonnel;
	}
	public void setMaxPersonnel(int maxPersonnel) {
		this.maxPersonnel = maxPersonnel;
	}
	public int getGradMinCredit() {
		return gradMinCredit;
	}
	public void setGradMinCredit(int gradMinCredit) {
		this.gradMinCredit = gradMinCredit;
	}
	public int getMinReqCredit() {
		return minReqCredit;
	}
	public void setMinReqCredit(int minReqCredit) {
		this.minReqCredit = minReqCredit;
	}
	public int getMjElecCredit() {
		return mjElecCredit;
	}
	public void setMjElecCredit(int mjElecCredit) {
		this.mjElecCredit = mjElecCredit;
	}
	public int getGeReqCredit() {
		return geReqCredit;
	}
	public void setGeReqCredit(int geReqCredit) {
		this.geReqCredit = geReqCredit;
	}
	public int getGeElecCredit() {
		return geElecCredit;
	}
	public void setGeElecCredit(int geElecCredit) {
		this.geElecCredit = geElecCredit;
	}
	public int getLecApplyMax() {
		return lecApplyMax;
	}
	public void setLecApplyMax(int lecApplyMax) {
		this.lecApplyMax = lecApplyMax;
	}
	public int getStuNum() {
		return stuNum;
	}
	public void setStuNum(int stuNum) {
		this.stuNum = stuNum;
	}
	public String getMylecStatusCd() {
		return mylecStatusCd;
	}
	public void setMylecStatusCd(String mylecStatusCd) {
		this.mylecStatusCd = mylecStatusCd;
	}
	
	public String getLecCd() {
		return lecCd;
	}
	public void setLecCd(String lecCd) {
		this.lecCd = lecCd;
	}
	public int getFinalMarks() {
		return finalMarks;
	}
	public void setFinalMarks(int finalMarks) {
		this.finalMarks = finalMarks;
	}
	public String getGradeSemeCd() {
		return gradeSemeCd;
	}
	public void setGradeSemeCd(String gradeSemeCd) {
		this.gradeSemeCd = gradeSemeCd;
	}
	public String getLecOpenStatusCd() {
		return lecOpenStatusCd;
	}
	public void setLecOpenStatusCd(String lecOpenStatusCd) {
		this.lecOpenStatusCd = lecOpenStatusCd;
	}
	public String getProfPosiCd() {
		return profPosiCd;
	}
	public void setProfPosiCd(String profPosiCd) {
		this.profPosiCd = profPosiCd;
	}
	public String getProfCd() {
		return profCd;
	}
	public void setProfCd(String profCd) {
		this.profCd = profCd;
	}
	public String getSubjCd() {
		return subjCd;
	}
	public void setSubjCd(String subjCd) {
		this.subjCd = subjCd;
	}
	public String getSubjName() {
		return subjName;
	}
	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}
	public String getLecCategoryCd() {
		return lecCategoryCd;
	}
	public void setLecCategoryCd(String lecCategoryCd) {
		this.lecCategoryCd = lecCategoryCd;
	}
	public String getTargetGrade() {
		return targetGrade;
	}
	public void setTargetGrade(String targetGrade) {
		this.targetGrade = targetGrade;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getGeCd() {
		return geCd;
	}
	public void setGeCd(String geCd) {
		this.geCd = geCd;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getStuSemster() {
		return stuSemster;
	}
	public void setStuSemster(String stuSemster) {
		this.stuSemster = stuSemster;
	}
	public int getTlTryCount() {
		return tlTryCount;
	}
	public void setTlTryCount(int tlTryCount) {
		this.tlTryCount = tlTryCount;
	}
	public String getAcaStateCd() {
		return acaStateCd;
	}
	public void setAcaStateCd(String acaStateCd) {
		this.acaStateCd = acaStateCd;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getMbtiCd() {
		return mbtiCd;
	}
	public void setMbtiCd(String mbtiCd) {
		this.mbtiCd = mbtiCd;
	}
	public String getStuCd() {
		return stuCd;
	}
	public void setStuCd(String stuCd) {
		this.stuCd = stuCd;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemStatusCd() {
		return memStatusCd;
	}
	public void setMemStatusCd(String memStatusCd) {
		this.memStatusCd = memStatusCd;
	}
	public String getMemClassCd() {
		return memClassCd;
	}
	public void setMemClassCd(String memClassCd) {
		this.memClassCd = memClassCd;
	}
	public String getSemeCd() {
		return semeCd;
	}
	public void setSemeCd(String semeCd) {
		this.semeCd = semeCd;
	}
	public String getCollegeCd() {
		return collegeCd;
	}
	public void setCollegeCd(String collegeCd) {
		this.collegeCd = collegeCd;
	}
	public String getColCd() {
		return colCd;
	}
	public void setColCd(String colCd) {
		this.colCd = colCd;
	}
	public String getColName() {
		return colName;
	}
	public void setColName(String colName) {
		this.colName = colName;
	}
	public int getTuition() {
		return tuition;
	}
	public void setTuition(int tuition) {
		this.tuition = tuition;
	}
	public int getAvailCredit() {
		return availCredit;
	}
	public void setAvailCredit(int availCredit) {
		this.availCredit = availCredit;
	}
	public String getCompanyCd() {
		return companyCd;
	}
	public void setCompanyCd(String companyCd) {
		this.companyCd = companyCd;
	}
	public String getSecCd() {
		return secCd;
	}
	public void setSecCd(String secCd) {
		this.secCd = secCd;
	}
	public String getSecName() {
		return secName;
	}
	public void setSecName(String secName) {
		this.secName = secName;
	}
	public String getMajorCd() {
		return majorCd;
	}
	public void setMajorCd(String majorCd) {
		this.majorCd = majorCd;
	}
	public String getMajorName() {
		return majorName;
	}
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public String getMajorPhone() {
		return majorPhone;
	}
	public void setMajorPhone(String majorPhone) {
		this.majorPhone = majorPhone;
	}
	public String getMajorWeb() {
		return majorWeb;
	}
	public void setMajorWeb(String majorWeb) {
		this.majorWeb = majorWeb;
	}
	public String getStuMajorCd() {
		return stuMajorCd;
	}
	public void setStuMajorCd(String stuMajorCd) {
		this.stuMajorCd = stuMajorCd;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getStuCode() {
		return stuCode;
	}
	public void setStuCode(String stuCode) {
		this.stuCode = stuCode;
	}
	public Date getAdmDate() {
		return admDate;
	}
	public void setAdmDate(Date admDate) {
		this.admDate = admDate;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public int getTlRemained() {
		return tlRemained;
	}
	public void setTlRemained(int tlRemained) {
		this.tlRemained = tlRemained;
	}
	public String getAcaState() {
		return acaState;
	}
	public void setAcaState(String acaState) {
		this.acaState = acaState;
	}
	public String getMbti() {
		return mbti;
	}
	public void setMbti(String mbti) {
		this.mbti = mbti;
	}
	public String getClubCd() {
		return clubCd;
	}
	public void setClubCd(String clubCd) {
		this.clubCd = clubCd;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getStuSemester() {
		return stuSemester;
	}
	public void setStuSemester(String stuSemester) {
		this.stuSemester = stuSemester;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccHolder() {
		return accHolder;
	}
	public void setAccHolder(String accHolder) {
		this.accHolder = accHolder;
	}
	public String getAccNum() {
		return accNum;
	}
	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}
	public String getPicName() {
		return picName;
	}
	public void setPicName(String picName) {
		this.picName = picName;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getLoginFailed() {
		return loginFailed;
	}
	public void setLoginFailed(int loginFailed) {
		this.loginFailed = loginFailed;
	}
	public int getMemClass() {
		return memClass;
	}
	public void setMemClass(int memClass) {
		this.memClass = memClass;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
	
	
	
}
