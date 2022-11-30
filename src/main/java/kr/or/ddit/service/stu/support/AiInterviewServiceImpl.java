package kr.or.ddit.service.stu.support;

import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import kr.or.ddit.dao.stu.support.AiInterviewDAO;

public class AiInterviewServiceImpl implements AiInterviewService {
	private AiInterviewDAO aiInterviewDAO;

	public void setAiInterviewDAO(AiInterviewDAO aiInterviewDAO) {
		this.aiInterviewDAO = aiInterviewDAO;
	}

	@Override
	public String selectScript() throws SQLException {
		String script = "";
		Random random = new Random();
		List<String> scriptList = aiInterviewDAO.selectScriptList();
		int ranNum = random.nextInt(scriptList.size());
		script = scriptList.get(ranNum);
		return script;
	}

	@Override
	public String selectFaceScript() throws SQLException {
		String script = "";
		Random random = new Random();
		List<String> scriptList = aiInterviewDAO.selectFaceScript();
		int ranNum = random.nextInt(scriptList.size());
		script = scriptList.get(ranNum);
		return script;
		
	}

}
