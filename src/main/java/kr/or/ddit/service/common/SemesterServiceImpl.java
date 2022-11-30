package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.Date;

import kr.or.ddit.dao.common.SemesterDAO;
import kr.or.ddit.dto.common.SemesterVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SemesterServiceImpl implements SemesterService {
	
	private SemesterDAO semesterDAO;
	public void setSemesterDAO(SemesterDAO semesterDAO) {
		this.semesterDAO=semesterDAO;
	}
	@Override
	public SemesterVO selectAvailableSemester() throws SQLException {
		

		SemesterVO seme = semesterDAO.selectAvailableSemester();
		Date semeStartDate = seme.getSemeStartDate();
		
		int currentWeek = getCurrentSemeWeek(semeStartDate);
		seme.setCurrentWeek(currentWeek);
		return seme;
	}
	
	
	public static int getCurrentSemeWeek(Date startSemeDate) {
	    LocalDate currentDate = LocalDate.now();
	    int year = startSemeDate.getYear();
	    int month = startSemeDate.getMonth()+1;
	    int date = startSemeDate.getDate();
	    LocalDate semeStartDate= LocalDate.of(year,month,date);
	    
	    int presentWeekOfYear = currentDate.get(WeekFields.ISO.weekOfYear());
	    int startSemeWeekOfYear = semeStartDate.get(WeekFields.ISO.weekOfYear());
	    
	    int attendWeek = presentWeekOfYear-startSemeWeekOfYear+2;
	    
	    return attendWeek;
	}
	
	public static int getCurrentSemeWeek(Date startSemeDate,Date selectedDate) {
		int selectYear = selectedDate.getYear();
	    int selectMonth = selectedDate.getMonth()+1;
	    int selectDate = selectedDate.getDate();
		
		LocalDate selectLocalDate = LocalDate.of(selectYear,selectMonth,selectDate);
	    int year = startSemeDate.getYear();
	    int month = startSemeDate.getMonth()+1;
	    int date = startSemeDate.getDate();
	    LocalDate semeStartDate= LocalDate.of(year,month,date);
	    
	    int selectWeekOfYear = selectLocalDate.get(WeekFields.ISO.weekOfYear());
	    int startSemeWeekOfYear = semeStartDate.get(WeekFields.ISO.weekOfYear());
	    
	    int selectWeek = selectWeekOfYear-startSemeWeekOfYear+1;
	    
	    return selectWeek;
	}
}
