package kr.or.ddit.dto.common;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PortletVO {
	
	private int id;
	private String memId;
	private String memClassCd;
	private String poAvail;
	private String poName;
	private int w;
	private int h;
	private int x;
	private int y;
	private String noResize;
	private String noMove;
	private String locked;
	
	
}
