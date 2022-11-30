package kr.or.ddit.dao.stu.schol;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.stu.ScholApplyVO;
import kr.or.ddit.dto.stu.ScholManageVO;
import kr.or.ddit.dto.stu.StuScholApplyListVO;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository 
public class ManageDAOImpl implements ManageDAO {

	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<ScholManageVO> selectManageList() throws SQLException {
		/* log.debug("------------------요기------------------"+ session); */
		List<ScholManageVO> manageList = session.selectList("StuSchol-Mapper.selectManageList");
		
		return manageList;
	}
	
	@Override
	public List<StuScholApplyListVO> selectApplyInfo(String stuCd) throws SQLException {
		List<StuScholApplyListVO> applyInfo = session.selectList("StuSchol-Mapper.selectApplyInfo",stuCd);
		/* log.debug("ScholApply다오확인"+applyInfo); */
		return applyInfo;
	}



	@Override
	public StudentVO selectManageRegistList(String stuCd) throws SQLException {
		StudentVO stuinfo = session.selectOne("StuSchol-Mapper.selectManageRegistList",stuCd);
		return stuinfo;
	}


	@Override
	public void insertInfo(ScholApplyVO scholApply) throws SQLException {
		
		log.debug("ScholApply다오확인"+scholApply);

		session.insert("StuSchol-Mapper.insertInfo",scholApply);
	}


	@Override
	public int selectScholAppSeqNextVal() throws SQLException {
		return session.selectOne("StuSchol-Mapper.selectScholAppSeqNextVal");
	}

	@Override
	public void deleteInfo(ScholApplyVO scholApply) throws SQLException {
		/* log.debug("ScholApply다오확인"+scholApply); */
		session.delete("StuSchol-Mapper.deleteInfo",scholApply);
		
	}






	

	
}
