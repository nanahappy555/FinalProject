package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecEvalItemsVO {
	private String evItemNo;
	private String content;
	private String evalQueCd;
	private String[] evalQueItems;
	private String originEvalCd;
}
