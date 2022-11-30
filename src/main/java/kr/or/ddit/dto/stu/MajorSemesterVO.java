package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MajorSemesterVO {
	
	private String semeCd; // 학사년도학기코드
	private String majorCd; // 학과코드
	private int inPersonnel; // 전입인원
	private int outPersonnel; // 전출인원
	private int maxPersonnel; //최대인원
	private int gradMinCredit; // 졸업최소이수학점
	private int minReqCredit; // 전필최소이수학점
	private int mjElecCredit; // 전선최소이수학점
	private int geReqCredit; //교필최소이수학점
	private int geElecCredit; // 교선최소이수학점
	private int lecApplyMax; // 수강신청최대학점
	
}
