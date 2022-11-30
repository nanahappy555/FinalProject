package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SurveyFormVO {

	private int surveyNo;
	private String content;
	private String firRes;
	private String secRes;
	private String thiRes;
	private String fouRes;
	private String fifRes;
}
