package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TuitionVO {

	private int tuitionSeq; //글번호
	private Date paymentDate; // 납부기한
	private int amount; //납입금
	private String payStatusCd; //납부여부 코드
	private String semeCd; //구분
	private String stuCd; //학번
	
	
}
