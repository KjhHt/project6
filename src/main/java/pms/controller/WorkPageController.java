package pms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.GlobalService;
import pms.service.WorkPageService;
import pms.vo.Issues;
import pms.vo.Member;
import pms.vo.WorkPage;
import pms.vo.WorkPageFile;
import pms.vo.WorkPageSch;

@Controller
public class WorkPageController {
	@Autowired(required = false)
	private WorkPageService service;
	@Autowired(required = false)
	private GlobalService gservice;

	// http://localhost:7080/project06/WorkPageList.do
	@RequestMapping("WorkPageList.do")
	public String WorkPageList(WorkPageSch sch,@RequestParam(value = "mid", defaultValue = "0") int mid,
											   @RequestParam(value = "pid", defaultValue = "0") int pid,
											   Model d, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member curMem3 = (Member) request.getSession().getAttribute("mem");
		if (curMem3 == null) {
			return "redirect:login.do";
		}
		if (!gservice.checkProjectAuth(curMem3.getMid(), pid)) {
			return "redirect:WorkPageList.do";
		}
		if(pid == 0){
	        return "redirect:projectList.do";
	    }
		System.out.println(curMem3.getEmail());
		

		List<WorkPage> wpList = service.getWorkPageList(sch, curMem3.getMid(), pid);
		
		for(WorkPage wp:wpList) {
			if(wp.getJmstatus().equals("PROG")) {
				wp.setJmstatus("진행중");
			}else if(wp.getJmstatus().equals("REQ")) {
				wp.setJmstatus("승인요청");
			}else if(wp.getJmstatus().equals("REJ")) {
				wp.setJmstatus("반려");
			}else {
				wp.setJmstatus("완료");
			}
		}
		
		d.addAttribute("wlist", wpList);

		return "WEB-INF\\views\\WorkPageList.jsp";
	}
	// 승인요청
	@RequestMapping("updateWorkPage.do")
	public String updateWorkPage(WorkPage upt,Model d) {
				//@RequestParam(value = "jmid") int jmid
			service.updateWorkPage(upt);
	System.out.println("@@@@테스트@@@@@:"+upt.getPid());
			return "redirect:WorkPageList.do?pid="+upt.getPid();
	}
	// 삭제
	@RequestMapping("deleteWorkPage.do")
	public String deleteWorkPage(@RequestParam(value = "fid") int fid,
			@RequestParam(value = "jmid") int jmid,
			@RequestParam(value = "jid") int jid,@RequestParam(value = "pid") int pid,Model d) {
		service.deleteWorkPageFile(fid);
		return "redirect:WorkPageDetail.do?jid="+jid+"&jmid="+jmid+"&pid="+pid;
	}
	@RequestMapping("WorkPageFileinsert.do")
	public String WorkPageInsertForm() {
		return "WEB-INF\\views\\WorkPageDetail.jsp";
	}
	@RequestMapping("WorkPageInsert.do")
	public String WorkPageInsert(WorkPageFile ins, Model d,
						@RequestParam(value = "jmid") int jmid,
						@RequestParam(value = "jid") int jid,@RequestParam(value = "pid") int pid) {
		service.insertWorkPageFile(ins,jmid);
			return "redirect:WorkPageDetail.do?jid="+jid+"&jmid="+jmid+"&pid="+pid;
	}
	// 다운로드컨트롤
	@RequestMapping("download.do")
	public String download(@RequestParam("fname") String fname, Model d) {
		d.addAttribute("downloadFileName", fname);
		return "downloadViewer";
	}
	@RequestMapping("WorkPageDetail.do")
	public String WorkPageDetail(WorkPage sch,@RequestParam(value = "mid", defaultValue = "0") int mid, Model d,
							WorkPage filelist,@RequestParam(value = "jid", defaultValue = "0") int jid,
											  @RequestParam(value = "jmid", defaultValue = "0") int jmid,
											  HttpServletRequest request) {
	
		HttpSession session = request.getSession();
		Member curMem = (Member) request.getSession().getAttribute("mem");
		if (curMem == null) {
			return "redirect:login.do";
		}
		if (!gservice.checkProjectAuth(curMem.getMid(), jid)) {
			return "redirect:WorkPageDetail.do";
		}		
		d.addAttribute("workpage", service.getWokrPageDetail(sch,curMem.getMid(), jid));
		d.addAttribute("flist",service.getWorkPageFile(filelist, curMem.getMid(), jid,jmid));
		return "WEB-INF\\views\\WorkPageDetail.jsp";
	}
	// 이슈사항 등록	
	@RequestMapping("issueInsertForm2.do")
	public String WorkPageIssues() {
		
		return "WEB-INF\\views\\issue\\issue.jsp";
	}
	@RequestMapping("issueInsert2.do")
	public String insertIssues(Issues ins,Model d,
					@RequestParam(value = "jmid") int jmid,
					@RequestParam(value = "pid") int pid) {
			service.insertIssue(ins,jmid);
			return "redirect:WorkPageList.do?pid="+pid;
	}	
	// 이슈사항 상세	
	@RequestMapping("issueDetail3.do")
	public String WorkPageIssuesDetail(Issues sch,@RequestParam(value = "iid") int iid,
												  @RequestParam(value = "pid") int pid, Model d) {
		
		d.addAttribute("isList",service.getWorkIsDetail(sch,iid));
		return "WEB-INF\\views\\issue\\issueDetail.jsp";
	}
	// 이슈사항 수정
	@RequestMapping("uptIssuespage.do")
	public String uptIssuespage(Issues upt,Model d,@RequestParam(value = "pid") int pid) {
					//@RequestParam(value = "iid") int iid,
					//@RequestParam(value = "pid") int pid) {
		service.updateIssues(upt);
			//d.addAttribute("isList",service.updateIssues(upt));
		//return "WEB-INF\\views\\issue\\issueDetail.jsp";
		return "redirect:WorkPageList.do?pid="+pid;
	}
	// 이슈사항 삭제
	@RequestMapping("delIssuespage.do")
	public String delIssuespage(@RequestParam(value = "iid") int iid,
								@RequestParam(value = "pid") int pid) {
			service.deleteIssues(iid);
		
		return "redirect:WorkPageList.do?pid="+pid;
	}


}
