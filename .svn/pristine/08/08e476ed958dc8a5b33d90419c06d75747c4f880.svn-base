package pms.dao;

import org.springframework.stereotype.Repository;
import pms.dto.IssuesDashDto;
import pms.dto.IssuesSch;
import pms.dto.NoticeSch;
import pms.dto.ProjectSch;
import pms.vo.Notice;
import pms.vo.Project;

import java.util.List;

@Repository
public interface DashboardDao {
    public List<Notice> noticeList(int pid);
    public List<IssuesDashDto> issueList(int pid);
    public int issueTotCnt(int pid);
    public List<IssuesDashDto> issueListPage(IssuesSch sch);
    public int noticeTotCnt(int pid);
    public List<Notice> noticeListPage(NoticeSch sch);
    public List<Project> allProject();
    public int projectTotCnt(ProjectSch sch);
    public List<Project> projectListPage(ProjectSch sch);
}
