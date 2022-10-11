package pms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import pms.dto.JobDTO;
import pms.dto.JobMemberDTO;
import pms.vo.Issues;
import pms.vo.Notice;
import pms.vo.Project;
import pms.vo.UpdateJobVO;
import pms.vo.WorkPage;
import pms.vo.WorkPageSch;

@Repository
public interface PMDao {
	public List<JobDTO> getJobPlan(int pid);
	public List<JobMemberDTO> getJobMember(int jid);
	public List<JobMemberDTO> getParticipants(int pid);
	public void addJobPlan(JobDTO j);
	public void addJobMember(int ppid);
	public List<JobMemberDTO> getNonPPMember(int pid);
	public void removePP(int ppid);
	public void addPP(JobMemberDTO jm);
	public List<Project> prjList(int mid);
	public String getPauth(JobMemberDTO jm);
	public void updateJobPlan(JobDTO j);
	public void deleteJobMember(UpdateJobVO uptjob);
	public void updateJobMember(Map<String, Integer> map);
	public void deleteJob(int jid);
	public List<WorkPage> getJobCheckList(WorkPageSch sch);
	public int jobCheckCount(WorkPageSch sch);
	public void treatIssues(Issues issue);
	public void changeJobStatus(JobMemberDTO jm);
	public WorkPage getJobDetailList(WorkPage wp);
	public WorkPage getJobFile(WorkPage wp);
	public Issues getIssues(int pid);
	public List<Notice> getNoticeList(int pid);
	public void insertNotice(Notice ins);
	public Notice pmNoticeDetail(int nid);
	public void updateNotice(Notice upt);
}