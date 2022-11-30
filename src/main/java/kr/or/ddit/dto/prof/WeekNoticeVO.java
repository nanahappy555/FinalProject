package kr.or.ddit.dto.prof;

import java.util.Date;
import java.util.List;

import kr.or.ddit.dto.common.AttachVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WeekNoticeVO {

	private int weekNo;
	private String lecCd;
	private String content;
	private Date cDate;
	private int anoCd;
	List<AttachVO> attachList;
	
}
