package kr.or.ddit.dto.staff;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StaffMajorChangeVO {

	private String presentMajorName;
	private String name;
	private String grade;
	private String stuSemester;
	private Date applyDate;
	private String phone;
	private String hopeMajorName;
	private int majorChaSeq;
	private String stuCd;
	private String colName;	
	private String applyStatusCd;
	
}
