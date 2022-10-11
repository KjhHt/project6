package pms.dto;


import java.util.List;

public class ProjectDto {
	private int cnt;
	private int pid;
	private String pname;
	private String pcomment;
	private String pstart;
	private String pend;
	private String pregdate;
	private int selectPM;
	private String pstatus;
	private int progress;
	private List<Integer> selectmember;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public int getSelectPM() {
		return selectPM;
	}
	public void setSelectPM(int selectPM) {
		this.selectPM = selectPM;
	}
	public List<Integer> getSelectmember() {
		return selectmember;
	}
	public void setSelectmember(List<Integer> selectmember) {
		this.selectmember = selectmember;
	}
	public ProjectDto() {
		// TODO Auto-generated constructor stub
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcomment() {
		return pcomment;
	}
	public void setPcomment(String pcomment) {
		this.pcomment = pcomment;
	}

	public String getPstart() {
		return pstart;
	}
	public void setPstart(String pstart) {
		this.pstart = pstart;
	}
	public String getPend() {
		return pend;
	}
	public void setPend(String pend) {
		this.pend = pend;
	}
	public String getPregdate() {
		return pregdate;
	}
	public void setPregdate(String pregdate) {
		this.pregdate = pregdate;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	
	


}
