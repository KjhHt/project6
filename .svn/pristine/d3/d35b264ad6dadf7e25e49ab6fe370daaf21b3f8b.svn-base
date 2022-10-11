package pms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.PMDao;
import pms.dto.JobDTO;
import pms.dto.JobMemberDTO;

@Service
public class PMService {
	@Autowired(required = false)
	private PMDao dao;
	
	public List<JobDTO> getJobList(int pid) {
		List<JobDTO> jlist = dao.getJobPlan(pid);
		for(JobDTO j : jlist) {
			j.setJmlist(dao.getJobMember(j.getId()));
		}
		return jlist;
	}
	public List<JobMemberDTO> getParticipants(int pid){
		return dao.getParticipants(pid);
	}
	public void addJob(JobDTO j) {
		dao.addJobPlan(j);
		List<Integer> ppids = j.getPpids();
		for(int ppid : ppids) {
			dao.addJobMember(ppid);
		}
	}
}
