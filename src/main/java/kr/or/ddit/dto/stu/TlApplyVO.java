package kr.or.ddit.dto.stu;

import java.util.Date;
import java.util.List;

import kr.or.ddit.dto.common.AttachVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TlApplyVO {

	private int tlApplySeq;
	private String tlClassCd;
	private String tlReason;
	private Date applyDate;
	private String tlAppYear;
	private String tlAppSeme;
	private String backYear;
	private String backSeme;
	private String applyStatusCd;
	private String stuId;
	private String semeCd;
	private int anoCd;
	private String rejContent;
	private List<AttachVO> attachList;
	private String applyDateString;
}
