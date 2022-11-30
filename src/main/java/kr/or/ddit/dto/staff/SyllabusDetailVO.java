package kr.or.ddit.dto.staff;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SyllabusDetailVO {

	private String sylCd;
	private String subjCd;
	private String lecCategoryCd;
	private String targetGrade;
	private String credit;
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
	private String outLine;
	private String rejReason;
	private String classroom;
	
}
