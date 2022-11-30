package kr.or.ddit.dto.common;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlarmVO {
	private int alarmSeq;
	private String memId;
	private String contentCd;
	private String checkCd = "uchk";
	private String cdate;
	private String prefix;
	
	private String alarmContent; //실제 출력될 알림내용
	private String sylCd; //강의이름
	private String boardName; //ex) ' - 공지게시판'
	private String Name; //학생이름 ex) '홍길동'
	
}
