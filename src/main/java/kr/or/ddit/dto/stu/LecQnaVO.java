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
public class LecQnaVO {
	private int lecqBno;
	private String stuCd;
	private String lecCd;
	private String title;
	private String content;
	private Date cdate;
	private int viewCnt;
	private String secretCd;
	private String response;
	private Date rdate;
	private String profCd;
	private String profName;
	private String stuName;
	private List<AttachVO> attachList;
	private Integer anoCd;
	
}
