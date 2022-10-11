package pms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.vo.Issues;

@Repository
public interface IssuesDao {
	
	public void insertIssue(Issues ins);
	public void deleteIssue(int iid);
	public List<Issues> getIssuesList(Issues sch);
	public List<Issues> getIssueDetail(int iid);
}
