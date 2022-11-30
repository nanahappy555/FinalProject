package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.prof.MarkVO;

public interface MarkDAO {

	public List<MarkVO> selectAllStudent(String lecCd)throws SQLException;
	public List<MarkVO> selectMidScore(String lecCd)throws SQLException;
	public List<MarkVO> selectFinScore(String lecCd)throws SQLException;
	public List<MarkVO> selectAssScore(String lecCd)throws SQLException;
	public List<MarkVO> selectAttendScore(String lecCd)throws SQLException;
	public MarkVO selectRatio(String lecCd)throws SQLException;
	public void updateScore(MarkVO vo)throws SQLException;
	
	public MarkVO selectMidScore(MarkVO vo)throws SQLException;
	public void insertMidScore(MarkVO vo)throws SQLException;
	public void updateMidScore(MarkVO vo)throws SQLException;
	
	public MarkVO selectFinScore(MarkVO vo)throws SQLException;
	public void insertFinScore(MarkVO vo)throws SQLException;
	public void updateFinScore(MarkVO vo)throws SQLException;
	
}
