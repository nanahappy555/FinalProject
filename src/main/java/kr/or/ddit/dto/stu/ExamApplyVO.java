package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ExamApplyVO {
	private String stuCd;
	private String lecCd;
	private String examCd;
	private String examDivCd;
	private int score;
}
