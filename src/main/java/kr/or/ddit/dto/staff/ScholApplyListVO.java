package kr.or.ddit.dto.staff;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholApplyListVO {
	
	private int scholAppSeq;
	private String stuCd;
	private int grade;
	private int stuSemester;
	private String name;
	private String phone;
	private String email;
	private Date applyDate;
	private String applyStatusCd;
	private String scholName;
	private String colName;
	private String majorName;
	
}
