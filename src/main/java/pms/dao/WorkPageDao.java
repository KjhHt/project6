package pms.dao;

import java.util.List;

// pms.dao.WorkPageDao
import org.springframework.stereotype.Repository;

import pms.vo.Issues;
import pms.vo.WorkPage;
import pms.vo.WorkPageFile;
import pms.vo.WorkPageSch;

@Repository
public interface WorkPageDao {
	// 리스트
	public List<WorkPage> WorkPageList(int mid,int pid);
	public List<WorkPage> getWorkPageList(WorkPageSch sch);
	// 총개수
    public int WorkPageTotCnt(WorkPageSch sch);
	// 파일등록
	public void insertFile(WorkPageFile file);
	// 상세화면
	public List<WorkPage> WorkPageDetailList(int mid,int jid);
	public List<WorkPage> getWorkPageDetailList(WorkPage sch);
	// 상세화면 파일 다운로드
	public List<WorkPage> getWorkPageFile(WorkPage filelist);
	// 승인요청 보내기
	public void updateWorkPage(WorkPage upt);	
	// 파일 삭제하기
	public void deleteWorkPageFile(int fid);	
	// 이슈사항 등록
	public void insertIssue(Issues ins);
	// 이슈 상세
	public Issues getWorkIsDetail(int iid);
	// 이슈등록삭제
	public void updateIssues(Issues upt);
	
	public void deleteIssues(int iid);

}




