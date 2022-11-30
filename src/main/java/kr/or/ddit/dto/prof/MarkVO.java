package kr.or.ddit.dto.prof;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MarkVO {
	private String lecCd;
	private String stuCd;
	private String name;
	private String attendStatusCd;
	private int attendCount;
	
	private int midRatio;
	private int finalRatio;
	private int assignRatio;
	private int attendRatio;
	
	private double midScore;
	private double finScore;
	private double assScore;
	private double attendScore;
	private double finalScore;
	
	private String finalMarks;
	
	public MarkVO() {
	}
	
}
