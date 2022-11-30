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
public class AssSubmitVO {
	private int assBno;
	private String stuCd;
	private String lecCd;
	private Date submitDate;
	private int finalMarks;
	private String subContent;
	private String evalContent;
	private int score;
	private int anoCd;
	private List<AttachVO> attachList;
}
