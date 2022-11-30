package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.common.ScheduleDAO;
import kr.or.ddit.dto.common.ScheduleJsonVO;
import kr.or.ddit.dto.common.ScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ScheduleServiceImpl implements ScheduleService {
	private ScheduleDAO scheduleDAO;
	public void setScheduleDAO(ScheduleDAO scheduleDAO) {
		this.scheduleDAO = scheduleDAO;
	}
	@Override
	public Map<String,Object> selectScheduleById() throws SQLException {
		Map<String,Object> dataMap=new HashMap<String,Object>();
		String datePattern = "yyyy-MM-dd*HH:mm:ss";
		SimpleDateFormat simpleFormat = new SimpleDateFormat(datePattern);
		
		List<ScheduleVO> scheduleList = scheduleDAO.selectScheduleById();
		List<ScheduleJsonVO> scheduleListForCalendar =new ArrayList<ScheduleJsonVO>();
		int maxScheSeq = -1;
		for(ScheduleVO schedule : scheduleList) {
			int scheduleSeq = schedule.getId();
			if(scheduleSeq>maxScheSeq) {
				maxScheSeq=scheduleSeq;
			}
			ScheduleJsonVO scheduleJson = new ScheduleJsonVO();
			Date start = schedule.getStart();
			String startJson=simpleFormat.format(start);
			Date end = schedule.getEnd();
			if(end!=null) {
				String endJson=simpleFormat.format(end);
				scheduleJson.setEnd(endJson);
			}
			scheduleJson.setStart(startJson);
			scheduleJson.setTitle(schedule.getTitle());
			scheduleJson.setId(schedule.getId());
			scheduleJson.setDetail(schedule.getDetail());
			scheduleJson.setMemId(schedule.getMemId());
			scheduleListForCalendar.add(scheduleJson);
		}
		dataMap.put("scheduleListForCalendar",scheduleListForCalendar);
		dataMap.put("maxScheSeq",maxScheSeq);
		return dataMap;
	}
	@Override
	public void insertCalendar(Map<String, Object> calendarData) throws SQLException {
		String memId = (String) calendarData.get("memId");	
		ScheduleVO schedule = new ScheduleVO();
		schedule.setMemId(memId);
		Integer startYear = (Integer)calendarData.get("startYear");
		Integer startMonth =(Integer)calendarData.get("startMonth");
		Integer startDate = (Integer)calendarData.get("startDate");
		Integer startHour = (Integer)calendarData.get("startHour");
		Integer startMinute = (Integer)calendarData.get("startMinute");
		Integer endYear = (Integer)calendarData.get("endYear");
		Integer endMonth =(Integer)calendarData.get("endMonth");
		Integer endDate = (Integer)calendarData.get("endDate");
		Integer endHour = (Integer)calendarData.get("endHour");
		Integer endMinute = (Integer)calendarData.get("endMinute");
		String scheId = (String)calendarData.get("scheId");
		String title = (String)calendarData.get("title");
		String detail = (String)calendarData.get("detail");
		
		String start = ""+startYear+"/"+String.format("%02d",startMonth)+"/"+String.format("%02d",startDate)+" "+String.format("%02d",startHour)+":"+String.format("%02d",startMinute)+":"+"00";
		if(endYear!=null&&!endYear.equals(0)) {
			String end = ""+endYear+"/"+String.format("%02d",endMonth)+"/"+String.format("%02d",endDate)+" "+String.format("%02d",endHour)+":"+String.format("%02d",endMinute)+":"+"00";
			schedule.setEndDate(end);
			log.debug("end : "+end);
		}
		schedule.setStartDate(start);
		schedule.setScheId(Integer.parseInt(scheId));
		schedule.setTitle(title);
		schedule.setDetail(detail);
		
		log.debug("start : "+start);
		scheduleDAO.insertCalendar(schedule);
	}
	@Override
	public void updateCalendar(Map<String, Object> calendarData) throws SQLException {
		String memId = (String) calendarData.get("memId");	
		ScheduleVO schedule = new ScheduleVO();
		schedule.setMemId(memId);
		Integer startYear = (Integer)calendarData.get("startYear");
		Integer startMonth =(Integer)calendarData.get("startMonth");
		Integer startDate = (Integer)calendarData.get("startDate");
		Integer startHour = (Integer)calendarData.get("startHour");
		Integer startMinute = (Integer)calendarData.get("startMinute");
		Integer endYear = (Integer)calendarData.get("endYear");
		Integer endMonth =(Integer)calendarData.get("endMonth");
		Integer endDate = (Integer)calendarData.get("endDate");
		Integer endHour = (Integer)calendarData.get("endHour");
		Integer endMinute = (Integer)calendarData.get("endMinute");
		String scheId = (String)calendarData.get("scheId");
		String title = (String)calendarData.get("title");
		String detail = (String)calendarData.get("detail");
		
		String start = ""+startYear+"/"+String.format("%02d",startMonth)+"/"+String.format("%02d",startDate)+" "+String.format("%02d",startHour)+":"+String.format("%02d",startMinute)+":"+"00";
		if(endYear!=null&&!endYear.equals(0)) {
			String end = ""+endYear+"/"+String.format("%02d",endMonth)+"/"+String.format("%02d",endDate)+" "+String.format("%02d",endHour)+":"+String.format("%02d",endMinute)+":"+"00";
			schedule.setEndDate(end);
			log.debug("end : "+end);
		}
		schedule.setStartDate(start);
		schedule.setScheId(Integer.parseInt(scheId));
		schedule.setTitle(title);
		schedule.setDetail(detail);

		
		scheduleDAO.updateCalendar(schedule);
	}
	@Override
	public void deleteCalendar(String scheId) throws SQLException {
		scheduleDAO.deleteCalendar(scheId);
	}
	
}
