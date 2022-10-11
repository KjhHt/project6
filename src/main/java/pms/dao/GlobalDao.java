package pms.dao;
// pms.dao.GlobalDao
import org.springframework.stereotype.Repository;
import pms.vo.*;

import java.util.List;
import java.util.Map;

@Repository
public interface GlobalDao {
    public List<Project> getAllPrjList();
    public Member getMember(String email);
    public List<Jobplan> memJobListPrj(Participants sch);
    public List<Jobplan> jobplanListPrj(int pid);
    public int jobMemberCount(int jid);
    public int jobMemberCompCount(int jid);
    public boolean isProjectMember(Map check);
    public boolean checkProjectAuth(Map check);
    public boolean isAdmin(int mid);
    public List<Member> getPrjMembers(int pid);
    public List<Project> getMyPrjList(int mid);
    public Notice getNotice(int nid);
    public boolean testMember(Map check);
    public Member getTestMember(int mid);
}