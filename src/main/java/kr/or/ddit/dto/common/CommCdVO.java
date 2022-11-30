package kr.or.ddit.dto.common;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommCdVO {
	
	private String commCdVal;
	private String commCdGr;
	private String commCdName;
	private String commCdDetail;
	private String available;
	private String upCommCdGr;
	private String upCommCdVal;
}
