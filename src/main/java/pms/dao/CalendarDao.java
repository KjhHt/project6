package pms.dao;

import org.springframework.stereotype.Repository;
import pms.dto.CalendarMember;

import java.util.List;

@Repository
public interface CalendarDao {

	public List<CalendarMember> getCalList(int mid);
	public void insertCalendar(CalendarMember ins);
	public void updateCalendar(CalendarMember upt);
	public void deleteCalendar(int mcid);
}
