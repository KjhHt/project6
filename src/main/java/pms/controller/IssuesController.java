package pms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.service.GlobalService;
import pms.service.IssuesService;
import pms.vo.Issues;

@Controller
public class IssuesController {

	@Autowired(required = false)
	private IssuesService service;
	@Autowired(required = false)
    private GlobalService gservice;
	
	// http://localhost:7080/project06/insertIssue.do
	@RequestMapping("insertIssue.do")
	public String insertIssue(Model d, Issues ins, HttpServletRequest request) { // 이슈사항 등록
		HttpSession session = request.getSession();
		session.setAttribute("mem", gservice.getMember("test@test.com"));
		service.insertIssue(ins);
		d.addAttribute("isInsert","Y");
		return "WEB-INF\\views\\issue\\issue.jsp";
	}
	
	// http://localhost:7080/project06/issueInsertForm.do
	@RequestMapping("issueInsertForm.do")
	public String issueInsertForm(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("mem", gservice.getMember("test@test.com"));
		return "WEB-INF\\views\\issue\\issue.jsp";
	}
	
	@RequestMapping("deleteIssue.do")
	public String deleteIssue(Model d, @RequestParam(value="iid")int iid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("mem", gservice.getMember("test@test.com"));
		service.deleteIssue(iid);
		d.addAttribute("proc", "del");
		return "WEB-INF\\views\\issue\\issuelist.jsp";
	}
	
	// http://localhost:7080/project06/issueDetail.do
	@RequestMapping("issueDetail.do")
	public String getIssueDetail(Model d, Issues sch,
						@RequestParam("iid")int iid, HttpServletRequest request) { // 이슈사항 내용 및 업데이트 내역 확인 (리스트에서 클릭 시 해당 이슈사항으로 이동)
		HttpSession session = request.getSession();
		session.setAttribute("mem", gservice.getMember("test@test.com"));
		service.getIssueDetail(iid);
		return "WEB-INF\\views\\issue\\issuedetail.jsp";
	}
	
	// http://localhost:7080/project06/editIssue.do
	@RequestMapping("editIssue.do")
	public String editIssue(HttpServletRequest request) { // 이슈사항 업데이트
		HttpSession session = request.getSession();
		session.setAttribute("mem", gservice.getMember("test@test.com"));
		return "WEB-INF\\views\\issue\\issueedit.jsp";
	}
	
	// http://localhost:7080/project06/issueList.do
	@RequestMapping("issueList.do")
	public String getIssuesList(Model d, Issues sch, HttpServletRequest request) { // 이슈사항 리스트 (이슈사항명, 작성자, status 확인 가능, 수정 및 삭제)
		HttpSession session = request.getSession();
		session.setAttribute("mem", gservice.getMember("test@test.com"));
		d.addAttribute("issues", service.getIssuesList(sch));
		return "WEB-INF\\views\\issue\\issuelist.jsp";
	}
}
