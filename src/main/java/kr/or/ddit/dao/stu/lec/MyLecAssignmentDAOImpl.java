package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;

public class MyLecAssignmentDAOImpl implements MyLecAssignmentDAO{
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MyLecAssignmentVO> selectMyAssignmentList(CriteriaLec cri) throws SQLException{
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<MyLecAssignmentVO> assignmentList= session.selectList("StuAssignment-Mapper.selectAssignmentListByLecCd",cri,rowBounds);
		return assignmentList;
	}

	@Override
	public int selectMyAssignmentTotalCount(CriteriaLec cri) throws SQLException {
		return session.selectOne("StuAssignment-Mapper.selectMyAssignmentTotalCount",cri);
	}

	@Override
	public MyLecAssignmentVO selectMyAssignMent(int assBno) throws SQLException{
		return session.selectOne("StuAssignment-Mapper.selectMyAssignMent",assBno);
	}
	
	@Override
	public void increaseAssignmentViewCnt(int assBno)throws SQLException {
		session.update("StuAssignment-Mapper.increaseAssignmentViewCnt",assBno);
	}

	@Override
	public MyLecAssignmentVO selectAssSubmit(MyLecAssignmentVO assSub) throws SQLException {
		return session.selectOne("StuAssignment-Mapper.selectAssSubmit",assSub);
	}

	@Override
	public void insertAssSubmit(MyLecAssignmentVO assSub) throws SQLException {
		session.insert("StuAssignment-Mapper.insertAssSub",assSub);
	}

	@Override
	public void updateAssSubmit(MyLecAssignmentVO assSub) throws SQLException {
		session.update("StuAssignment-Mapper.updateAssSubmit",assSub);
	}
	
}
