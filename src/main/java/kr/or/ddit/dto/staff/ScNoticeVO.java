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
public class ScNoticeVO {

	private int scNno;
	private String staffId;
	private String title;
	private String content;
	private Date cdate;
	private int viewCnt;
	private String markCd;
	private String anoCd;
	private String semeCd;
	
	private List<AttachVO> attachList;

	
	
}
