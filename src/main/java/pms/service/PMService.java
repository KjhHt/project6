package pms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.PMDao;
import pms.dao.WorkPageDao;
import pms.dto.JobDTO;
import pms.dto.JobMemberDTO;
import pms.vo.Issues;
import pms.vo.Notice;
import pms.vo.Project;
import pms.vo.UpdateJobVO;
import pms.vo.WorkPage;
import pms.vo.WorkPageSch;

@Service
public class PMService {
	@Autowired(required = false)
	private PMDao dao;
	
	public List<JobDTO> getJobList(int pid) {
		List<JobDTO> jlist = dao.getJobPlan(pid);
		for(JobDTO j : jlist) {
			List<JobMemberDTO> jmlist = dao.getJobMember(j.getId());
			j.setJmlist(jmlist);
			int sum = 0;
			int size = jmlist.size();
			if(size == 0) {
				j.setProgress(0);
			}
			else {
				for(int i = 0; i < size; i++) {
					if(jmlist.get(i).getJmstatus().equals("COMP")) {
						sum++;
					}
				}
				j.setProgress(sum * 100 / size);
			}
		}
		return jlist;
	}
	public List<JobMemberDTO> getParticipants(int pid){
		return dao.getParticipants(pid);
	}
	public List<JobMemberDTO> getNonPPMember(int pid) {
		return dao.getNonPPMember(pid);
	}
	public void addJob(JobDTO j) {
		dao.addJobPlan(j);
		List<Integer> ppids = j.getPpids();
		for(int ppid : ppids) {
			dao.addJobMember(ppid);
		}
	}
	public void removePP(int ppid) {
		dao.removePP(ppid);
	}
	public void addPP(JobMemberDTO jm) {
		dao.addPP(jm);
	}
	public List<Project> prjList(int mid) {
		return dao.prjList(mid);
	}
	public String getPauth(JobMemberDTO jm) {
		return dao.getPauth(jm);
	}
	public void updateJob(JobDTO j) {
		System.out.println("jid: " + j.getId());
		dao.updateJobPlan(j);
		UpdateJobVO uptjob = new UpdateJobVO();
		uptjob.setJid(j.getId());
		List<Integer> ppids = j.getPpids();
		uptjob.setPpids(ppids);
		dao.deleteJobMember(uptjob);
		Map<String, Integer> map = new HashMap<String, Integer>();	
		map.put("jid", j.getId());
		map.put("ppid", 0);
		if(ppids != null) {
			for(int ppid : ppids) {
				map.replace("ppid", ppid);
				dao.updateJobMember(map);
			}
		}
	}
	public void deleteJob(int jid) {
		dao.deleteJob(jid);
	}
	public List<WorkPage> getJobCheckList(WorkPageSch sch){
		sch.setPid(sch.getPid());
		sch.setJmstatus(sch.getJmstatus());
        // 1. ?????? ????????? ?????? ??????
        sch.setCount(	dao.jobCheckCount(sch) ); 
        //System.out.println("?????????:"+sch.getCount());
        // 2. ????????? ????????? ????????? ????????? ??????(?????????)
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
        // 3. ??????????????? : ???????????????/????????? ?????????????????? ??????  [1][2][3][4]
        //    ex) 18/5 ==> 3
        //    ex) 18/5.0 (??????) ==> Math.ceil(3.6) : 4.0 ==> ??????????????? ???????????? 4??? ?????????????????? ??????
        sch.setPageCount( (int)Math.ceil( sch.getCount() /(double)sch.getPageSize()) );
        
        
        // 4. ????????? ?????? ????????? ??????..(?????????)
        if(sch.getCurPage()==0) {
            sch.setCurPage(1);
        }
        if(sch.getCurPage() > sch.getPageCount()){
            sch.setCurPage(sch.getPageCount());
        }
        // 5. ???????????????(???????????????*????????????????????????????????????)
        int end = sch.getCurPage()*sch.getPageSize();
        if(end>sch.getCount()) { // ???????????? ???????????? ??????..
            sch.setEnd(sch.getCount());
        }else {
            sch.setEnd(end);
        }
        if(end == 0) {
            sch.setStart(0);
        } else {
            sch.setStart((sch.getCurPage() - 1) * sch.getPageSize() + 1);
        }
        // 1. ????????? ?????? ??????.
        sch.setBlockSize(5);
        // 2. ????????? ?????? ??????..
        int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));

        int endBlock = blocknum*sch.getBlockSize();
        if(endBlock>sch.getPageCount()) {
            endBlock = sch.getPageCount();
        }
        if(endBlock == 0) {
            sch.setEndBlock(1);
            sch.setStartBlock(1);
        } else {
            sch.setEndBlock(endBlock);
            sch.setStartBlock((blocknum - 1) * sch.getBlockSize() + 1);
        }
		return dao.getJobCheckList(sch);
	}
	public void treatIssues(Issues issue) {
		dao.treatIssues(issue);
	}
	public void changeJobStatus(JobMemberDTO jm) {
		dao.changeJobStatus(jm);
	}
	public WorkPage getJobDetailList(WorkPage wp) {
		return dao.getJobDetailList(wp);
	}
	public WorkPage getJobFile(WorkPage wp) {
		return dao.getJobFile(wp);
	}
	public Issues getIssues(int pid) {
		return dao.getIssues(pid);
	}
	public List<Notice> getNoticeList(int pid){
		return dao.getNoticeList(pid);
	}
	public void insertNotice(Notice ins) {
		dao.insertNotice(ins);
	}
	public Notice pmNoticeDetail(int nid) {
		return dao.pmNoticeDetail(nid);
	}
	public void updateNotice(Notice upt) {
		dao.updateNotice(upt);
	}
}
