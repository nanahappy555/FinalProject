package kr.or.ddit.dto.prof;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyLecSyllabusVO {
	
	private String subjCd;
	private String subjName;
	private String lecCategoryCd;
	private String targetGrade;
	private int credit;
	private int maxStuNum;
	private int lecHour;
	private String materials;
	private String geCd;
	private int midRatio;
	private int finalRatio;
	private int assignRatio;
	private int attendRatio;
	private String evalClassCd;
	private String lecDate1;
	private String lecDate2;
	private String outline;
	private int weekNo;
	private String sylCd;
	private String content;
	private String goal;

}
