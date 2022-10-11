package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pms.service.CalendarService;
import pms.dto.CalendarMember;
import pms.service.GlobalService;
import pms.vo.Member;
import pms.vo.Participants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CalendarController {
	@Autowired(required = false)
	private CalendarService service;
	@Autowired(required = false)
	private GlobalService gservice;

	// http://localhost:7080/springweb/calendar.do
	@RequestMapping("calendar.do")
	public String calendar() {
		return "WEB-INF/views/calendar/calendarMember.jsp";
	}
	// http://localhost:7080/springweb/calList.do callist
	@RequestMapping("calList.do")
	public String calList(@RequestParam(value = "mid", defaultValue = "0") int mid,
						  @RequestParam(value = "job", defaultValue = "0") int job,
						  @RequestParam(value = "pid", defaultValue = "0") int pid,
						  Participants sch,
						  Model d, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member curMem = (Member)request.getSession().getAttribute("mem");
		if(curMem == null){
			return "redirect:login.do";
		}
		if(mid == 0) {
			mid = curMem.getMid();
		}
		if (job == 0) {
			d.addAttribute("callist", service.getCalList(mid));
		} else
			d.addAttribute("callist", service.getCalJobList(sch, mid));
		return "pageJsonReport";
	}
	@RequestMapping("calPrjList.do")
	public String calPrjList(Model d, HttpServletRequest request){
		HttpSession session = request.getSession();
		Member curMem = (Member)request.getSession().getAttribute("mem");
		if(curMem == null || !(curMem.getAuth().equals("ADMIN") || curMem.getAuth().equals("CEO"))){
			return "redirect:login.do";
		}
		d.addAttribute("pcallist", service.getCalPrjList());
		return "pageJsonReport";
	}
	// http://localhost:7080/springweb/calInsert.do
	@RequestMapping("calInsert.do")
	public String calInsert(CalendarMember ins,
							HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member curMem = (Member)request.getSession().getAttribute("mem");
		if(curMem == null){
			return "redirect:login.do";
		}
		if(ins.getMid() == 0) {
			ins.setMid(curMem.getMid());
		}
		service.insertCalendar(ins);
		
		// 등록 후, 초기화면으로 이동
		return "redirect:/calendar.do";
	} // calUpdate.do calDelete.do
	// http://localhost:7080/springweb/calUpdate.do
	@RequestMapping("calUpdate.do")
	public String updateCalendar(CalendarMember upt) {
		System.out.println("## 수정 ##");
		System.out.println(upt.getTitle());
		System.out.println(upt.getCstart());
		
		
		service.updateCalendar(upt);
		return "redirect:/calendar.do";
	}
	// http://localhost:7080/springweb/calDelete.do
	@RequestMapping("calDelete.do")
	public String deleteCalendar(int mcid) {
		service.deleteCalendar(mcid);
		return "redirect:/calendar.do";
	}
}

