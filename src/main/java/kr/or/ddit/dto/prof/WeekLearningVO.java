package kr.or.ddit.dto.prof;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WeekLearningVO {

	private int weekNo;
	private String sylCd;
	private String content;
	private String goal;
}
