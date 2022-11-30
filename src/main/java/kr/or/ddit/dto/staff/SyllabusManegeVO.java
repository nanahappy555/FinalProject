package kr.or.ddit.dto.staff;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SyllabusManegeVO {

	private String subjCd;
	private String subjName;
	private String name;
	private String sylCd;
	private String lecCategoryCd;
	private int maxStuNum;
	private String credit;
	private String applyStatusCd;
}
