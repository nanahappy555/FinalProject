package kr.or.ddit.dto.common;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InboxVO {
 
	private int noteSeq; 		//메일번호
	private String title;		//제목
	private String content;		//내용
	private Date sendDate;		//보낸시간
	private String receiverId;	//받는사람 아이디
	private String senderId;	//보낸사람 아이디
	private String anoCd;		//첨부파일 유뮤코드
	private String binStatusCd = "inmail"; //메일함 코드
	private String recvChk;	//조회유무
	private Date recvChkDate;	//조회날짜
	private String memId;		
}
