package kr.or.ddit.dto.prof;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecManageVO {

	private String subjCd;
	private String subjName;
	private String lecCategoryCd;
	private String targetGrade;
	private String credit;
	private String majorCd;
	private String geCd;
}
