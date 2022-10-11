package pms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.GlobalDao;
import pms.vo.Jobplan;
import pms.vo.Member;
import pms.vo.Notice;
import pms.vo.Project;

@Service
public class GlobalService {
    @Autowired(required = false)
    private GlobalDao dao;

    public Member getMember(String email) {
        return dao.getMember(email);
    }
    public List<Jobplan> jobplanListPrj(int pid) {
        List<Jobplan> temp = dao.jobplanListPrj(pid);
        for(Jobplan job : temp) {
            int all = dao.jobMemberCount(job.getJid());
            int comp = dao.jobMemberCompCount(job.getJid());
            if(comp == 0)
                job.setPercent(0);
            else
                job.setPercent(comp/(double)all);
            //System.out.println("우와아! : " + job.getPercent());
        }
        
        return temp;
    }

    public boolean isProjectMember(Integer mid, Integer pid) {
        Map<String, Object> map = new HashMap<>();
        map.put("mid", mid);
        map.put("pid", pid);
        return dao.isProjectMember(map);
    }
    public boolean checkProjectAuth(Integer mid, Integer pid) {
        Map<String, Object> map = new HashMap<>();
        map.put("mid", mid);
        map.put("pid", pid);
        return dao.checkProjectAuth(map);
    }
    public boolean isAdmin(int mid){
        return dao.isAdmin(mid);
    }
    public List<Member> getPrjMembers(int pid) {
        return dao.getPrjMembers(pid);
    }
    public List<Project> getMyPrjList(int mid) {
        return dao.getMyPrjList(mid);
    }
    public Notice getNotice(int nid){
        return dao.getNotice(nid);
    }
}
