package kr.or.ddit.command;

import kr.or.ddit.dto.stu.AcaStatusVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BackApplyCommand {
	
	private String backApplyYear;
	private String backApplySeme;
	private String backReason;
	
	public AcaStatusVO backCommandToAcaStatus() {
		AcaStatusVO acaStatus = new AcaStatusVO();
		acaStatus.setApplyYearSeme(backApplyYear+backApplySeme);
		acaStatus.setApplyReason(backReason);
		return acaStatus;
	}
}
