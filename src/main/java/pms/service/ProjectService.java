package pms.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.PMDao;
import pms.dao.ProjectDao;
import pms.dto.JobDTO;
import pms.dto.JobMemberDTO;
import pms.dto.ProjectDto;
import pms.dto.ProjectMemberDTO;
import pms.dto.ProjectSch;
import pms.vo.Member;
import pms.vo.Participants;

@Service
public class ProjectService {
    @Autowired(required = false)
    private ProjectDao dao;
    @Autowired(required = false)
    private PMDao dao2;
    
    public List<ProjectDto> getProjectList(ProjectSch sch, int mid){
    	sch.setMid(mid);
    	
        // 1. 전체 데이터 건수 설정
        sch.setCount(	dao.totMemCnt(sch) ); // 프로젝트 선택파트 완료시 pid로 변경
        //System.out.println("총건수:"+sch.getCount());
        // 2. 선언한 한번에 보여줄 데이터 건수(요청값)
        if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
        // 3. 총페이지수 : 데이터건수/한번에 보여주페이지 크기  [1][2][3][4]
        //    ex) 18/5 ==> 3
        //    ex) 18/5.0 (실수) ==> Math.ceil(3.6) : 4.0 ==> 정수형으로 변환하여 4를 총페이지수로 처리
        sch.setPageCount( (int)Math.ceil( sch.getCount() /(double)sch.getPageSize()) );
        // 4. 클릭한 현재 페이지 번호..(요청값)
        if(sch.getCurPage()==0) {
            sch.setCurPage(1);
        }
        if(sch.getCurPage() > sch.getPageCount()){
            sch.setCurPage(sch.getPageCount());
        }
        // 5. 마지막번호(현재페이지*한번에보여주는페이지건수)
        int end = sch.getCurPage()*sch.getPageSize();
        if(end>sch.getCount()) { // 총데이터 건수보다 크면..
            sch.setEnd(sch.getCount());
        }else {
            sch.setEnd(end);
        }
        if(end == 0) {
            sch.setStart(0);
        } else {
            sch.setStart((sch.getCurPage() - 1) * sch.getPageSize() + 1);
        }

        // 1. 블럭의 크기 지정.
        sch.setBlockSize(5);
        // 2. 블럭의 번호 지정..
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
        
        List<ProjectDto> list = dao.getProjectList(sch);
        int jobcomp = 0;
		for (ProjectDto p : list) {
			List<JobDTO> jlist = dao2.getJobPlan(p.getPid());
			for(JobDTO j : jlist) {
				List<JobMemberDTO> jmlist = dao2.getJobMember(j.getId());
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
				if(j.getProgress() == 100) {
					jobcomp++;
				}
			}
			if(jlist.size() == 0) {
				p.setProgress(0);
			}
			else {
				p.setProgress(jobcomp * 100 / jlist.size());
			}
			
		}
        return list;

	}
    
    public List<ProjectDto> getAdProjectList(ProjectSch sch){
    
        // 1. 전체 데이터 건수 설정
        sch.setCount(	dao.totCnt(sch) ); // 프로젝트 선택파트 완료시 pid로 변경
        //System.out.println("총건수:"+sch.getCount());
        // 2. 선언한 한번에 보여줄 데이터 건수(요청값)
        if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
        // 3. 총페이지수 : 데이터건수/한번에 보여주페이지 크기  [1][2][3][4]
        //    ex) 18/5 ==> 3
        //    ex) 18/5.0 (실수) ==> Math.ceil(3.6) : 4.0 ==> 정수형으로 변환하여 4를 총페이지수로 처리
        sch.setPageCount( (int)Math.ceil( sch.getCount() /(double)sch.getPageSize()) );
        // 4. 클릭한 현재 페이지 번호..(요청값)
        if(sch.getCurPage()==0) {
            sch.setCurPage(1);
        }
        if(sch.getCurPage() > sch.getPageCount()){
            sch.setCurPage(sch.getPageCount());
        }
        // 5. 마지막번호(현재페이지*한번에보여주는페이지건수)
        int end = sch.getCurPage()*sch.getPageSize();
        if(end>sch.getCount()) { // 총데이터 건수보다 크면..
            sch.setEnd(sch.getCount());
        }else {
            sch.setEnd(end);
        }
        if(end == 0) {
            sch.setStart(0);
        } else {
            sch.setStart((sch.getCurPage() - 1) * sch.getPageSize() + 1);
        }

        // 1. 블럭의 크기 지정.
        sch.setBlockSize(5);
        // 2. 블럭의 번호 지정..
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
        
        List<ProjectDto> list = dao.getAdProjectList(sch);
        int jobcomp = 0;
		for (ProjectDto p : list) {
			List<JobDTO> jlist = dao2.getJobPlan(p.getPid());
			for(JobDTO j : jlist) {
				List<JobMemberDTO> jmlist = dao2.getJobMember(j.getId());
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
				if(j.getProgress() == 100) {
					jobcomp++;
				}
			}
			if(jlist.size() == 0) {
				p.setProgress(0);
			}
			else {
				p.setProgress(jobcomp * 100 / jlist.size());
			}
			
		}
        return list;

	}
   
    
    public List<Member> getMemberList(){
    	return dao.getMemberList();
	}
    
    public List<ProjectMemberDTO> getPmemberList(int pid) {	
    	return dao.getPmemberList(pid);
	}
 
	
    public ProjectDto getProjectDetail(int pid){
      	return dao.getProjectDetail(pid);
    }
    
   
    public void createProject(ProjectDto ins) {   	
        dao.insertProject(ins);
        
        if(ins.getSelectPM()!= 0) 
        	dao.insertParticipants(new Participants(ins.getSelectPM(), "PM"));
        
        if(ins.getSelectmember() != null) {
            for(int m:ins.getSelectmember()) { 
                dao.insertParticipants(new Participants(m, "Developer"));
            }
        }

        
     }
    
    public ProjectDto updateProject(ProjectDto upt) {
        dao.deleteMemberPm(upt.getPid());
        Participants temp = new Participants(upt.getSelectPM(), "PM");
        temp.setPid(upt.getPid());
        dao.insertParticipantsManual(temp);
        dao.updateProject(upt);
        return dao.getProjectDetail(upt.getPid()); 
     }
    
    public void deleteProject(int pid) {   	
    	dao.deleteMember(pid);
    	dao.deleteProject(pid);    
    }



	
}
