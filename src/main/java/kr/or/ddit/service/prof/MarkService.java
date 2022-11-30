package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.prof.MarkVO;

public interface MarkService {
	public List<MarkVO> getMarkList(String lecCd)throws SQLException;
	public void modifyScore(MarkVO vo)throws SQLException;
}
