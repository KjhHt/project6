package pms.vo;


import java.util.Date;

public class Project {
	private int cnt;
	private int pid;
	private String pname;
	private String pcomment;
	private Date pstart;
	private Date pend;
	private Date pregdate;
	private String pstatus;
	
	public Project() {
		// TODO Auto-generated constructor stub
	}
	

	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
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
	public Date getPstart() {
		return pstart;
	}
	public void setPstart(Date pstart) {
		this.pstart = pstart;
	}
	public Date getPend() {
		return pend;
	}
	public void setPend(Date pend) {
		this.pend = pend;
	}
	public Date getPregdate() {
		return pregdate;
	}
	public void setPregdate(Date pregdate) {
		this.pregdate = pregdate;
	}


	public String getPstatus() {
		return pstatus;
	}


	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	
	


}
