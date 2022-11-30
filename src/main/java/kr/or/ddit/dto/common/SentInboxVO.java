package kr.or.ddit.dto.common;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SentInboxVO {
 
	private int sentNoteSeq;
	private String title;
	private String content;
	private Date sendDate;
	private String anoCd;
	private String binStatusCd; //메일함 코드
	private String receiverId;
	private String senderId;
	private String memId;	
}
