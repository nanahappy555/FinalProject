package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.stu.MyLecAssignmentVO;

@Repository
public class AssignmentEvalDAOImpl implements AssignmentEvalDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<MyLecAssignmentVO> selectAllStuListByLecCdAssBno(MyLecAssignmentVO vo) throws SQLException {
		List<MyLecAssignmentVO> allStuList = session.selectList("AssignmentEval-Mapper.selectStuListByLecCd",vo);
		return allStuList;
	}

	@Override
	public MyLecAssignmentVO selectStuAssDetail(MyLecAssignmentVO vo) throws SQLException {
		MyLecAssignmentVO assDetail = session.selectOne("AssignmentEval-Mapper.selectStuAssDetail",vo);
		return assDetail;
	}

	@Override
	public void updateAssignment(MyLecAssignmentVO vo) throws SQLException {
		session.update("AssignmentEval-Mapper.updateAssignment" ,vo);
	}
	
	


}
