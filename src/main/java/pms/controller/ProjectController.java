package pms.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.dto.ProjectDto;
import pms.dto.ProjectMemberDTO;
import pms.dto.ProjectSch;
import pms.service.ProjectService;
import pms.vo.Member;




@Controller
public class ProjectController {
	@Autowired(required=false)
	private ProjectService service;
	
	// http://localhost:7080/project06/projectList.do
	@RequestMapping("projectList.do")
	public String projectList(ProjectSch sch,								
							  Model d, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Member curMem3 = (Member) session.getAttribute("mem");
		if (curMem3 == null) {
			return "redirect:login.do";
		}

		List<ProjectDto> pList = service.getProjectList(sch, curMem3.getMid());
		d.addAttribute("prjList", pList);
		return "WEB-INF\\views\\project\\projectlist.jsp";
	}
	
	// http://localhost:7080/project06/adminProjectList.do
	@RequestMapping("adminProjectList.do")
	public String adminProjectList(ProjectSch sch, Model d, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		d.addAttribute("projectList", service.getAdProjectList(sch));
		return "WEB-INF\\views\\project\\adminprojectlist.jsp";
	}
	
	
	// http://localhost:7080/project06/projectInsertForm.do
	@RequestMapping("projectInsertForm.do")
	public String projectInsertForm(){	
		return "WEB-INF\\views\\project\\project.jsp";
	}
	
	@RequestMapping("projectInsert.do")
	public String projectInsert(ProjectDto ins, Model d){	    
	    service.createProject(ins);
		d.addAttribute("isInsert","Y");
	
		return "WEB-INF\\views\\project\\project.jsp";
	}
	
	
	@RequestMapping("updateProject.do")
	public String updateProject(ProjectDto upt, Model d){	
		d.addAttribute("project",service.updateProject(upt));		
		d.addAttribute("proc","upt");

		return "WEB-INF\\views\\project\\projectdetail.jsp";
	}
	
	// http://localhost:7080/project06/projectDetail.do
	@RequestMapping("projectDetail.do")
	public String projectDetail(@RequestParam(value = "pid", defaultValue = "0") int pid, Model d){
		d.addAttribute("project",service.getProjectDetail(pid));
		d.addAttribute("pmemberList", service.getPmemberList(pid));
		
		return "WEB-INF\\views\\project\\projectdetail.jsp";
	}
	

	@RequestMapping("deleteProject.do")
	public String deleteProject(@RequestParam("pid") int pid, Model d){
		service.deleteProject(pid);
		d.addAttribute("proc","del");
		return "WEB-INF\\views\\project\\projectdetail.jsp";
		
	}
	
	@RequestMapping("memberList.do")
	public String ajaxMember() {
		return "WEB-INF\\views\\project\\project.jsp";
		
	}
	// http://localhost:7080/project06/ajaxMember.do
	@RequestMapping("ajaxMember.do")
	public String ajaxMember(Model d) {
		d.addAttribute("memberList", service.getMemberList());

		return "pageJsonReport";
	}	

	// http://localhost:7080/project06/ajaxPmember.do?pid=1
	@RequestMapping("ajaxPmember.do")
	public String ajaxPmember(@RequestParam(value = "pid", defaultValue = "0") int pid, Model d) {
		d.addAttribute("pmemberList", service.getPmemberList(pid));

		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/project06/ajaxPM.do?pauth=PM
	@RequestMapping("ajaxPM.do")
	public String ajaxPM(@RequestParam(value = "pauth", defaultValue = "") String pauth, Model d) {
		d.addAttribute("pmemberList", pauth.equals("PM"));

		return "pageJsonReport";
	}


	/*

	

	
		@RequestMapping("deleteProject.do")
	public String deleteProject(@RequestParam("pid") int pid, Model d){	
		service.deleteProject(pid);
		d.addAttribute("proc","del");
		
		return "WEB-INF\\views\\projectlist.jsp";	
	}
	 */

}

