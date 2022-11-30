package kr.or.ddit.controller.common;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.dto.prof.WeekLearningVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class WeekLearningCommand {
	private String[] weekGoal;
	private String[] weekContent;
	
	public List<WeekLearningVO> ToWeekLearningVOList(){
		ArrayList<WeekLearningVO> arrayList = new ArrayList<WeekLearningVO>();
		
		for (int i = 0; i < weekContent.length; i++) {
			WeekLearningVO vo = new WeekLearningVO();
			vo.setContent(weekGoal[i]);
			vo.setGoal(weekGoal[i]);
			
			arrayList.add(vo);
		}
		
			
		return arrayList;
	}
}
