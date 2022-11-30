package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.common.PortletDAO;
import kr.or.ddit.dao.common.PortletListDAO;
import kr.or.ddit.dao.stu.lec.LecOpenDAO;
import kr.or.ddit.dto.common.PortletListVO;
import kr.or.ddit.dto.common.PortletVO;
import kr.or.ddit.dto.prof.LecOpenVO;
import kr.or.ddit.dto.stu.AttendVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PortletServiceImpl implements PortletService{

	@Autowired
	private PortletDAO portletDAO;
	
	@Autowired
	private PortletListDAO portletListDAO;
	
	@Autowired
	private LecOpenDAO lecOpenDAO;

	@Override
	public List<PortletVO> getWidgetList(String memId) throws SQLException {
		List<PortletVO> poList = portletDAO.selectWidgetList(memId);
		
		return poList;
	}
	

	@Override
	public List<PortletListVO> getAllWidgetList(String memClassCd) throws SQLException {
		List<PortletListVO> poList = portletListDAO.selectAllWidgetListByMemClassCd(memClassCd);
		return poList;
	}
	
	
	@Override
	public int getTotalCountWidgetList(String memId) throws SQLException {
		int count = portletDAO.selectTotalCountWidgetList(memId);
		return count;
	}

	@Override
	public PortletVO getWidgetById(PortletVO portlet) throws SQLException {
		PortletVO po = portletDAO.selectWidgetById(portlet);
		return po;
	}

	@Override
	public void registWidgetList(String memId,String memClassCd) throws SQLException {
		
		PortletVO portlet = new PortletVO();
		portlet.setMemId(memId);
		
		//액터 별 기본위젯 
		List<Integer> defaultWidNoList = portletListDAO.selectDefaultWidgetList(memClassCd);
		
		for(Integer widNo : defaultWidNoList) {
			portlet.setId(widNo);
			portlet.setPoAvail("selected");
			portletDAO.insertWidgetByIdAvail(portlet);
		}
	
		//액터 별 기본위젯 외 위젯
		List<Integer> notDefaultWidNoList = portletListDAO.selectNotDefaultWidgetList(memClassCd);
		
		for(Integer widNo : notDefaultWidNoList) {
			portlet.setId(widNo);
			portlet.setPoAvail("unselect");
			portletDAO.insertWidgetByIdAvail(portlet);
		}
			
		
	}
	
	@Override
	public void saveWidgetNewUser(String memId, String memClassCd, List<PortletVO> poList) throws SQLException {
		log.debug("신규서비스"+poList);
		
		PortletVO portlet = new PortletVO();
		portlet.setMemId(memId);
		
		//액터 별 기본위젯 insert
		List<Integer> defaultWidNoList = portletListDAO.selectDefaultWidgetList(memClassCd);
		
		for(Integer widNo : defaultWidNoList) {
			portlet.setId(widNo);
			portlet.setPoAvail("selected");
			portletDAO.insertWidgetByIdAvail(portlet);
		}
	
		//액터 별 기본위젯 외 위젯 insert
		List<Integer> notDefaultWidNoList = portletListDAO.selectNotDefaultWidgetList(memClassCd);
		
		for(Integer widNo : notDefaultWidNoList) {
			portlet.setId(widNo);
			portlet.setPoAvail("unselect");
			portletDAO.insertWidgetByIdAvail(portlet);
		}
		
		//사용할 위젯 업데이트
		for(PortletVO po : poList) {
			po.setMemId(memId);
			po.setPoAvail("selected");
			portletDAO.updateWidget(po);
		}
		
		List<PortletVO> allWidList = portletDAO.selectAllWidgetListByMemId(memId);
		
//		allWidList.removeAll(poList);
		
		for(PortletVO po : poList) {
			int id = po.getId();
			for(int i=0; i<allWidList.size(); i++) {
				if(allWidList.get(i).getId() == id) {
					allWidList.remove(i);
				}
			}
		}
		
		//사용안 할 위젯 업데이트
		for(PortletVO po : allWidList) {
			po.setMemId(memId);
			po.setPoAvail("unselect");
			portletDAO.updateWidget(po);
		}
		
	}

	@Override
	public void saveWidgetExistingUser(String memId, String memClassCd, List<PortletVO> poList) throws SQLException {
		log.debug("기존유저서비스"+poList);
		//사용할 위젯 업데이트
		for(PortletVO po : poList) {
			po.setMemId(memId);
			po.setPoAvail("selected");
			portletDAO.updateWidget(po);
		}
		
		List<PortletVO> allWidList = portletDAO.selectAllWidgetListByMemId(memId);
		
//		allWidList.removeAll(poList);
		
		for(PortletVO po : poList) {
			int id = po.getId();
			for(int i=0; i<allWidList.size(); i++) {
				if(allWidList.get(i).getId() == id) {
					allWidList.remove(i);
				}
			}
		}
		
		//사용안 할 위젯 업데이트
		for(PortletVO po : allWidList) {
			po.setMemId(memId);
			po.setPoAvail("unselect");
			portletDAO.updateWidget(po);
		}
		
	}

	
	//과제제출현황리스트
	@Override
	public List<LecOpenVO> getLecAssSubmitStuList(String memId) throws SQLException {
		List<LecOpenVO> lecList = lecOpenDAO.selectLecAssSubmitStuList(memId);
		return lecList;
	}


	@Override
	public List<AttendVO> getAllAttendByStuCd(AttendVO attend) throws SQLException {
		List<AttendVO> attendList = portletDAO.selectAllAttendByStuCd(attend);
		return attendList;
	}





}
