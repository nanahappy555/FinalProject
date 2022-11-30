package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecVO {
	private String stuCd;
	private String lecCd;
	private String finalMarks;
	private int finalScore;
	private String mylecStatusCd;
	private String gradeSemeCd;
	private String evalSubjContent;
	private String subjName;
	private String profName;
	private String lecDate1;
	private String lecDate2;
	private String evalStatusCd;
	private String semeCd;
	
	private String name;
	private String lecCategoryCd;
	private String credit;
	private String grade;
	
	private double attendScore;
	private double assScore;
	private double midScore;
	private double finScore;
	private int lecHour;
	
}
