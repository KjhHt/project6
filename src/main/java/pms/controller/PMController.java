package pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.JobDTO;
import pms.dto.JobMemberDTO;
import pms.dto.NoticeSch;
import pms.service.DashboardService;
import pms.service.PMService;
import pms.service.WorkPageService;
import pms.vo.Issues;
import pms.vo.Member;
import pms.vo.Notice;
import pms.vo.WorkPage;
import pms.vo.WorkPageSch;

@Controller
public class PMController {
	@Autowired(required = false)
	private PMService service;
	@Autowired(required = false)
	private WorkPageService wpservice;
	@Autowired(required = false)
	private DashboardService dbservice;
	// http://localhost:7080/project06/manage.do
	@RequestMapping("manage.do")
	public String manage(@RequestParam(value="pid", defaultValue = "0") int pid, HttpServletRequest request, Model d) {
		if(pid == 0) {
			return "redirect:projectList.do";
		}
		HttpSession session = request.getSession();
        Member mem = (Member)session.getAttribute("mem");
        if(mem == null){
            return "redirect:login.do";
        }
        
        JobMemberDTO jm = new JobMemberDTO();
        jm.setPid(pid);
        jm.setMid(mem.getMid());
        System.out.println(jm.getPid());
        System.out.println(jm.getMid());
        String pauth = service.getPauth(jm);
        if(!pauth.equals("PM")) {
        	return "redirect:dashboard.do?pid=" + pid;
        }
        if(session.getAttribute("prjlist") == null) {
        	session.setAttribute("prjlist", service.prjList(mem.getMid()));
        }
		d.addAttribute("pid", pid);
        d.addAttribute("pplist", service.getParticipants(pid));
		return "WEB-INF\\views\\pm\\pm-gantt.jsp";
	}
	@RequestMapping("joblist.do")
	public String joblist(@RequestParam(value="pid", defaultValue = "0") int pid, Model d) {
		if(pid == 0) {
			return "redirect:projectList.do";
		}
		d.addAttribute("joblist", service.getJobList(pid));
		return "pageJsonReport";
	}
	@RequestMapping("addjob.do")
	public String addjob(JobDTO j, Model d) {
		service.addJob(j);
		return "pageJsonReport";
	}
	@RequestMapping("edit_pp.do")
	public String editParticipants(@RequestParam(value="pid", defaultValue = "0") int pid, HttpServletRequest request, Model d) {
		if(pid == 0) {
			return "redirect:projectList.do";
		}
		HttpSession session = request.getSession();
        Member mem = (Member)session.getAttribute("mem");
        if(mem == null){
            return "redirect:login.do";
        }
        
        JobMemberDTO jm = new JobMemberDTO();
        jm.setPid(pid);
        jm.setMid(mem.getMid());
        System.out.println(jm.getPid());
        System.out.println(jm.getMid());
        String pauth = service.getPauth(jm);
        if(!pauth.equals("PM")) {
        	return "redirect:dashboard.do?pid=" + pid;
        }
		d.addAttribute("pid", pid);
		return "WEB-INF\\views\\pm\\editparticipants.jsp";
	}
	@RequestMapping("removepp.do")
	public String removePP(JobMemberDTO jm, Model d) {
		service.removePP(jm.getPpid());
		d.addAttribute("pplist", service.getParticipants(jm.getPid()));
		d.addAttribute("mlist", service.getNonPPMember(jm.getPid()));
		return "pageJsonReport";
	}
	@RequestMapping("addpp.do")
	public String addPP(JobMemberDTO jm, Model d) {
		service.addPP(jm);
		d.addAttribute("pplist", service.getParticipants(jm.getPid()));
		d.addAttribute("mlist", service.getNonPPMember(jm.getPid()));
		return "pageJsonReport";
	}
	@RequestMapping("pplist.do")
	public String pplist(JobMemberDTO jm, Model d) {
		d.addAttribute("pplist", service.getParticipants(jm.getPid()));
		d.addAttribute("mlist", service.getNonPPMember(jm.getPid()));
		return "pageJsonReport";
	}
	@RequestMapping("updatejob.do")
	public String updatejob(JobDTO j) {
		service.updateJob(j);
		
		return "pageJsonReport";
	}
	@RequestMapping("deletejob.do")
	public String deletejob(@RequestParam("id") int jid, Model d) {
		service.deleteJob(jid);
		return "pageJsonReport";
	}
	@RequestMapping("jobcheck.do")
	public String jobcheck(WorkPageSch sch, HttpServletRequest request, Model d) {
		if(sch.getPid() == 0) {
			return "redirect:projectList.do";
		}
		HttpSession session = request.getSession();
        Member mem = (Member)session.getAttribute("mem");
        if(mem == null){
            return "redirect:login.do";
        }
        
        JobMemberDTO jm = new JobMemberDTO();
        jm.setPid(sch.getPid());
        jm.setMid(mem.getMid());
        System.out.println(jm.getPid());
        System.out.println(jm.getMid());
        String pauth = service.getPauth(jm);
        if(!pauth.equals("PM")) {
        	return "redirect:dashboard.do?pid=" + sch.getPid();
        }
		d.addAttribute("wlist", service.getJobCheckList(sch));
		d.addAttribute("pid", sch.getPid());
		return "WEB-INF\\views\\pm\\jobcheck.jsp";
	}
	@RequestMapping("pmissuedetail.do")
	public String pmIssueDetail(@RequestParam("iid") int iid, Model d) {
		d.addAttribute("is", wpservice.getWorkIsDetail(new Issues(), iid));
		return "WEB-INF\\views\\pm\\issueDetail.jsp";
	}
	@RequestMapping("treatIssue.do")
	public String treatIssue(Issues issue, @RequestParam("pid") int pid) {
		service.treatIssues(issue);
		return "redirect:jobcheck.do?pid=" + pid;
	}
	@RequestMapping("jobcheckDetail.do")
	public String jobcheckDetail(WorkPage sch, HttpServletRequest request, Model d) {
		if(sch.getPid() == 0) {
			return "redirect:projectList.do";
		}
		HttpSession session = request.getSession();
        Member mem = (Member)session.getAttribute("mem");
        if(mem == null){
            return "redirect:login.do";
        }
        d.addAttribute("workpage", wpservice.getWokrPageDetail(sch, sch.getMid(), sch.getJid()));
        d.addAttribute("flist", wpservice.getWorkPageFile(sch, sch.getMid(), sch.getJid(), sch.getJmid()));
		return "WEB-INF\\views\\pm\\jobcheckDetail.jsp";
	}
	@RequestMapping("changeJobStatus.do")
	public String changeJobStatus(JobMemberDTO jm, Model d){
		service.changeJobStatus(jm);
		return "redirect:jobcheck.do?pid=" + jm.getPid();
	}
	@RequestMapping("jobIssueDetail.do")
	public String jobIssueDetail(@RequestParam("pid") int pid, @RequestParam("iid") int iid, Model d) {
		d.addAttribute("is",wpservice.getWorkIsDetail(new Issues(),iid));
		return "WEB-INF\\views\\pm\\issueDetail.jsp";
	}
	@RequestMapping("noticeList.do")
	public String noticeList(NoticeSch sch, HttpServletRequest request, Model d){
		if(sch.getPid() == 0) {
			return "redirect:projectList.do";
		}
		HttpSession session = request.getSession();
        Member mem = (Member)session.getAttribute("mem");
        if(mem == null){
            return "redirect:login.do";
        }
		d.addAttribute("nlist", dbservice.noticePaging(sch, sch.getPid()));
		d.addAttribute("sch", sch);
		return "WEB-INF\\views\\pm\\noticelist.jsp";
	}
	@RequestMapping("insertNoticeForm.do")
	public String insertNotice(@RequestParam("pid") int pid, Model d) {
		return "WEB-INF\\views\\pm\\insertNoticeForm.jsp";
	}
	@RequestMapping("insertNotice.do")
	public String insertNotice(Notice ins, Model d) {
		service.insertNotice(ins);
		return "redirect:noticeList.do?pid="+ins.getPid();
	}
	@RequestMapping("updateNotice.do")
	public String updateNotice(Notice upt, Model d) {
		service.updateNotice(upt);
		return "redirect:noticeList.do?pid="+upt.getPid();
	}
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(Notice n, Model d) {
		d.addAttribute("notice", service.pmNoticeDetail(n.getNid()));
		return "WEB-INF\\views\\pm\\noticeDetail.jsp";
	}
}
