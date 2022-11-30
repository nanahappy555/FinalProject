package kr.or.ddit.command;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class SurveyCommand {
	private String formRes1;
	private String formRes2;
	private String formRes3;
	private String formRes4;
	private String formRes5;
	private String formRes6;
	private String formRes7;
	private String formRes8;
	private String formRes9;
	private String formRes10;
	private String stuCd;
	
	int surveyNo;
	String response;
	
	public List<String> returnSurveyCommand() {
		List<String> surveyList = new ArrayList<String>();
		surveyList.add(formRes1);
		surveyList.add(formRes2);
		surveyList.add(formRes3);
		surveyList.add(formRes4);
		surveyList.add(formRes5);
		surveyList.add(formRes6);
		surveyList.add(formRes7);
		surveyList.add(formRes8);
		surveyList.add(formRes9);
		surveyList.add(formRes10);
		return surveyList;
	}
}
