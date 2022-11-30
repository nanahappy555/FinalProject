package kr.or.ddit.dao.stu.tuition;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.stu.TuitionVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository 
public class TuitionDAOImpl implements TuitionDAO {

	@Autowired
	private SqlSession session;


	@Override
	public List<TuitionVO> selectStuTuitionList(String stuCd) throws SQLException {
		List<TuitionVO> tuitionList = session.selectList("StuTuition-Mapper.selectStuTuitionList",stuCd);
		log.debug("다오 체크 >>>>>>>>>>>>>"+ tuitionList); 
		return tuitionList;
	}
}