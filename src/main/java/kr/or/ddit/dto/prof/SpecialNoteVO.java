package kr.or.ddit.dto.prof;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class SpecialNoteVO {
	private int specialSeq;
	private String writer;
	private String stuCd;
	private String content;
	private Date createDate;
	
}
