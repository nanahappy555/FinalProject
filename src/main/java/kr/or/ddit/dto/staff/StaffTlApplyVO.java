package kr.or.ddit.dto.staff;

import java.util.Date;
import java.util.List;

import kr.or.ddit.dto.common.AttachVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StaffTlApplyVO {

	private int acaChangeSeq;
	private Date applyDate;
	private String majorName;
	private String colName;
	private String stuId;
	private String name;
	private String grade;
	private String backSeme;
	private String tlAppSeme;
	private String stuSemester;
	private String acaClassCd;
	
	private int tlApplySeq;
	private String stuCd;
	private String tlClassCd;
	private String applyStatusCd;
	private String tlReason;
	
	private int anoCd;
	private List<AttachVO> attachList;
	
	
	
}
