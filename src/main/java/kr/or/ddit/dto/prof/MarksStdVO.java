package kr.or.ddit.dto.prof;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MarksStdVO {

	private String marksStdCd;
	private int midRatio;
	private int finalRatio;
	private int assignRatio;
	private int attendRatio;
	private String sylCd;
}
