package pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.dto.JobDTO;
import pms.dto.JobMemberDTO;

@Repository
public interface PMDao {
	public List<JobDTO> getJobPlan(int pid);
	public List<JobMemberDTO> getJobMember(int jid);
	public List<JobMemberDTO> getParticipants(int pid);
	public void addJobPlan(JobDTO j);
	public void addJobMember(int ppid);
}