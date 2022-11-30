package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SurveyAnswerVO {

	private String stuCd;
	private int surveyNo;
	private String response;
}
