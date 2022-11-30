package kr.or.ddit.dto.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScoreVO {
	private String lecCd;
	private String subjCd;
	private double score;
	private String attendStatusCd;
	private String subjName;
	private int attendCount;
	private String lecCategoryCd;
	private String credit;
	private String name;
	
	private int midRatio;
	private int finalRatio;
	private int assignRatio;
	private int attendRatio;
	
	private String finalMarks;
	private double finalScore;
}
