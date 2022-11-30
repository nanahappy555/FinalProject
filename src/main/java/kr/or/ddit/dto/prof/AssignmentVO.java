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
public class AssignmentVO {
	private int assBno;
	private String lecCd;
	private String title;
	private Date createDate;
	private Date dueDate;
	private int evalRate;
	private String content;
	private int anoCd;
	private List<AttachVO> attachList;
	
}
