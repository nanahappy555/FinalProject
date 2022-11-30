package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StuMajorVO {
	
	private String stuMajorCd; // 학생 전공 기본키
	private String id; // 학번
	private String majorCd; // 학과코드
	private String majClassCd; // 전공구분코드
	
}
