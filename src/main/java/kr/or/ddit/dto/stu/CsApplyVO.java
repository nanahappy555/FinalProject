package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CsApplyVO {

	private int counselNo;
	private String profId;
	private String stuId;
	private String stuName;
	private Date applyDate;
	private String appStatusCd = "ing";
	private String appContent;
	private String csLocation;
	
	private String counselContent;
	private String rejReason;
	private int anoCd;
	
}
