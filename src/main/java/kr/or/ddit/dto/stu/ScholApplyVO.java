package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholApplyVO {
	private int scholAppSeq;
	private String scholCd;
	private String rejContent;
	private Date applyDate;
	private String applyStatusCd ="ing";
	private String accountHolder;
	private String accountNum;
	private String bankName;
	private int amount;
	private String stuId;
	private String anoCd;
	private String semeCd;
}
