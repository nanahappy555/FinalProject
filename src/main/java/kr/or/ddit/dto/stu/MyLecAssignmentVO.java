package kr.or.ddit.dto.stu;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.ddit.dto.common.AttachVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyLecAssignmentVO {
	private int assBno;
	private String lecCd;
	private String title;
	private Date createDate;
	private Date dueDate;
	private int evalRate;
	private String content;
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date submitDate;
	private int score;
	private String subEvalStatusCd;
	private String name;
	private int viewCnt;
	private int anoCd;
	private String stuCd;
	private List<AttachVO> attachList;
	private String subContent;
	private String evalContent;
	private String subjName;
}
