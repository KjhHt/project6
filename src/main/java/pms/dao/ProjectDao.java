package pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.dto.ProjectDto;
import pms.dto.ProjectMemberDTO;
import pms.dto.ProjectSch;
import pms.vo.Member;
import pms.vo.Participants;
import pms.vo.Project;



@Repository
public interface ProjectDao {
	public int totMemCnt(ProjectSch sch);
	
	public int totCnt(ProjectSch sch);
	public List<ProjectDto> getProjectList(ProjectSch sch);
	public List<ProjectDto> getAdProjectList(ProjectSch sch);

	
	public List<Member> getMemberList();
	public List<ProjectMemberDTO> getPmemberList(int pid); //조회
	
	public ProjectDto getProjectDetail(int pid);
	
	public void insertProject(ProjectDto ins);	
	public void insertParticipants(Participants p);
	
	public void updateProject(ProjectDto upt);

	
	public void deleteProject(int pid);
	public void deleteMember(int pid);
	public void deleteMemberPm(int pid);
	public void insertParticipantsManual(Participants p);
}
