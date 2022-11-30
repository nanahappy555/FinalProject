package kr.or.ddit.dto.prof;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecQnaResponseVO {

	private int lecqResq;
	private int lecqBno;
	private String profId;
	private String stuCd;
	private String lecCd;
	private String response;
	private Date cDate;
}
