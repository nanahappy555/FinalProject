package kr.or.ddit.dto.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyLectureVO {
	private String lecCd;
	private String lecName;
	private String name;
	private String lecDate1;
	private String lecDate2;
	private String emailAddr;
	private String classroom;
	private int anoCd;
	private String lecCategoryCd;
	private String subjCd;
	private int credit;
	
	private String finalMarks;
	private double finalScore;
	private String subjName;
	private int maxStuNum;
	private int lecHour;
	private String geCd;

}
