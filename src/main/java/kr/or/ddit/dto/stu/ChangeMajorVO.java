package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChangeMajorVO {
	
	private int majorChaSeq;
	private String stuCd;
	private String majorCd;
	private String semeCd;
	private Date applyDate;
	private String applyStatusCd;
	private String rejContent;
	private String majClassCd;
	private String colName;
	private String majorName;
	private int inPersonnel;
	private int outPersonnel;
	private String majorWeb;
	
}
