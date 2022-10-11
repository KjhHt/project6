package pms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pms.dao.CalendarDao;
import pms.dao.GlobalDao;
import pms.dto.CalendarMember;
import pms.vo.Jobplan;
import pms.vo.Participants;
import pms.vo.Project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

@Service
public class CalendarService {
	@Autowired(required=false)
	private CalendarDao dao;
	@Autowired(required = false)
	private GlobalDao gdao;

	public List<CalendarMember> getCalPrjList(){
		List<Project> plist = gdao.getAllPrjList();
		List<CalendarMember> list = new ArrayList<>();
		for(Project p : plist){
			CalendarMember temp = new CalendarMember();
			temp.setMcid(p.getPid()+1300000);
			temp.setTitle(p.getPname());
			temp.setContent(p.getPcomment());
			temp.setCstart(p.getPstart());
			temp.setCend(p.getPend());
			temp.setBackgroundColor("#99FFFF");
			temp.setTextColor("#000000");
			temp.setAllDay(true);
			list.add(temp);
		}
		for(CalendarMember calendar : list){
			calendar.setId(calendar.getMcid());
			SimpleDateFormat sdf;
			sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
			sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
			String datetime = sdf.format(calendar.getCstart());
			calendar.setStart(datetime);
			datetime = sdf.format(calendar.getCend());
			calendar.setEnd(datetime);
			System.out.println(calendar.getTitle());
		}
		return list;
	}
	public List<CalendarMember> getCalJobList(Participants sch, int mid){
		sch.setMid(mid);
		List<Jobplan> jlist = gdao.memJobListPrj(sch);
		List<CalendarMember> list = dao.getCalList(sch.getMid());
		for(Jobplan j : jlist){
			CalendarMember temp = new CalendarMember();
			temp.setMcid(j.getJid()+990000);
			temp.setTitle(j.getJname());
			temp.setContent(j.getContent());
			temp.setCstart(j.getJstart());
			temp.setCend(j.getJend());
			temp.setBackgroundColor("#99FF33");
			temp.setTextColor("#000000");
			temp.setAllDay(true);
			list.add(temp);
		}
		for(CalendarMember calendar : list){
			calendar.setId(calendar.getMcid());
			SimpleDateFormat sdf;
			sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
			sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
			String datetime = sdf.format(calendar.getCstart());
			calendar.setStart(datetime);
			datetime = sdf.format(calendar.getCend());
			calendar.setEnd(datetime);
		}
		return list;
	}
	public List<CalendarMember> getCalList(int mid){
		List<CalendarMember> list = dao.getCalList(mid);
		for(CalendarMember calendar : list){
			calendar.setId(calendar.getMcid());
			SimpleDateFormat sdf;
			sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
			sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
			String datetime = sdf.format(calendar.getCstart());
			calendar.setStart(datetime);
			datetime = sdf.format(calendar.getCend());
			calendar.setEnd(datetime);
		}
		return list;
	}
	public void insertCalendar(CalendarMember ins) {
		SimpleDateFormat sdf;
		sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		try {
			ins.setCstart(sdf.parse(ins.getStart()));
			ins.setCend(sdf.parse(ins.getEnd()));
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}

		dao.insertCalendar(ins);
	}
	public void updateCalendar(CalendarMember upt) {
		SimpleDateFormat sdf;
		sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		try {
			System.out.println(upt.getStart());
			System.out.println(sdf.parse(upt.getStart()));
			upt.setCstart(sdf.parse(upt.getStart()));
			upt.setCend(sdf.parse(upt.getEnd()));
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}

		dao.updateCalendar(upt);
	}
	public void deleteCalendar(int mcid) {
		dao.deleteCalendar(mcid);
	}
	
}
