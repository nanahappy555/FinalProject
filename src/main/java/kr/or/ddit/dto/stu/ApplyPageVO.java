package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApplyPageVO {
	
	private String lecCd;
	private String colName;
	private String MajorName;
	private String geCd;
	private String targetGrade;
	private int maxStuNum;
	private int stuNum;
	private String lecDate1;
	private String lecDate2;
	private String classroom;
	private String credit;
	private String subjName;
	private String profName;
	
}
