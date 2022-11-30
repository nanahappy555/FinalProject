package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SemesterStuVO {
	
	private String semeCd; // 학사년도학기코드
	private String stuCd; // 학번
	private String grade; // 학년
	private String stuSemester; // 학기
	private double totalScore; // 종합성적점수
	private String gradeSeme;
}
