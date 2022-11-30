package kr.or.ddit.dto.prof;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecOpenVO {
	private String lecCd;
	private String lecOpenStatusCd;
	private int stuNum;
	
	private String subjName;
	private int count;
	private int submitCount;
}
