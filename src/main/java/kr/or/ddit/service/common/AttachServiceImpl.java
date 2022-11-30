package kr.or.ddit.service.common;

import java.sql.SQLException;

import kr.or.ddit.dao.common.AttachDAO;

public class AttachServiceImpl implements AttachService {

	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	@Override
	public int selectAnoNextval() throws SQLException {
		return attachDAO.selectAnoNextval();
	}
	
}
