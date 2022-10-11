package pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pms.service.GlobalService;
import pms.vo.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
// http://localhost:7080/project06/test.do
public class GlobalController {
    @Autowired(required = false)
    private GlobalService service;

	// http://localhost:7080/project06/test.do
    @RequestMapping("test.do")
    public String boardList(Model d){
        return "WEB-INF\\views\\test.jsp";
    }

    @RequestMapping("tabdefault.do")
    public String tabdefault(Model d){
        return "WEB-INF\\views\\tabdefault.jsp";
    }

    @RequestMapping("teamMemberAjax.do")
    public String prjMemberAjax(@RequestParam(value = "pid", defaultValue = "0") int pid,
                                 Model d, HttpServletRequest request){
        HttpSession session = request.getSession();
        Member curMem = (Member)request.getSession().getAttribute("mem");
        System.out.println("pid : " + pid);
        if(curMem == null || pid == 0){
            return "pageJsonReport";
        }
        System.out.println("curMem : " + curMem.getMid());

        List<Member> memList = service.getPrjMembers(pid);
        for(Member mem : memList){
            System.out.println("prj Member : " + mem.getName());
        }

        d.addAttribute("members", service.getPrjMembers(pid));
        return "pageJsonReport";
    }

    @RequestMapping("myProjectAjax.do")
    public String myProjectAjax(@RequestParam(value = "mid", defaultValue = "0") int mid,
                                 Model d, HttpServletRequest request){
        HttpSession session = request.getSession();
        Member curMem = (Member)request.getSession().getAttribute("mem");

        if(curMem == null){
            return "pageJsonReport";
        }
        if(mid == 0) {
            mid = curMem.getMid();
        }
        d.addAttribute("projects", service.getMyPrjList(mid));
        return "pageJsonReport";
    }
}
