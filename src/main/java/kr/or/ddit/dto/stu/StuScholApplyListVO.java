package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StuScholApplyListVO {
	
	private String StuCd;
	private String grade;
	private String stuSemester;
	private String scholName;
	private int scholAmount;
	private Date applyDate;
	private String applyStatusCd = "ing";
	private int scholAppSeq;
	private String semeCd;
	
}
