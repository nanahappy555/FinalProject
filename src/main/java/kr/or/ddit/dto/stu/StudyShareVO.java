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
public class StudyShareVO {

	private int shaBno;
	private String stuCd;
	private String lecCd = "SYL0000";
	private String title;
	private Date cdate;
	private int recoNum;
	private int viewCnt;
	private String boardDivCd;
	private String content;
	private int reportCnt;
	private String available = "1";
	
	private int anoCd;
	private List<AttachVO> attachList;
	
	private String subjName;
}
