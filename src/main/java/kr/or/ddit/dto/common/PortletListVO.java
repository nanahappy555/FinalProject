package kr.or.ddit.dto.common;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PortletListVO {
	
	private int id;
	private String memClassCd;
	private String poName;
	private int w;
	private int h;
	private int x;
	private int y;
	private String noResize;
	private String noMove;
	private String locked;
	private Character defaultCd = 'Y';
	
}
