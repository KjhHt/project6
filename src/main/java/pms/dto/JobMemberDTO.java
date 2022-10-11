package pms.dto;

public class JobMemberDTO {
	private int mid;
	private String email;
	private String name;
	private int jmid;
	private int progress;
	private String jmstatus;
	private int ppid;
	private String pauth;
	private String auth;
	private int pid;
	
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getPauth() {
		return pauth;
	}
	public void setPauth(String auth) {
		this.pauth = auth;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getJmid() {
		return jmid;
	}
	public void setJmid(int jmid) {
		this.jmid = jmid;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public String getJmstatus() {
		return jmstatus;
	}
	public void setJmstatus(String jmstatus) {
		this.jmstatus = jmstatus;
	}
	public int getPpid() {
		return ppid;
	}
	public void setPpid(int ppid) {
		this.ppid = ppid;
	}
}
