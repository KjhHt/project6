package pms.dto;
import java.util.List;

public class JobDTO {
	private int id;
	private String name;
	private String start;
	private String end;
	private int progress;
	private int required;
	private String dependencies = "";
	private String realstart;
	private String realend;
	private String content;
	private int pid;
	private String jstatus;
	private List<JobMemberDTO> jmlist;
	private List<Integer> ppids;
	public List<Integer> getPpids(){
		return ppids;
	}
	public void setPpids(List<Integer> ppids) {
		this.ppids = ppids;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public void setDependencies() {
		this.dependencies += required;
	}
	public String getDependencies(){
		return dependencies;
	}
	public String getRealstart() {
		return realstart;
	}
	public void setRealstart(String realstart) {
		this.realstart = realstart;
	}
	public String getRealend() {
		return realend;
	}
	public void setRealend(String realend) {
		this.realend = realend;
	}
	public String getJstatus() {
		return jstatus;
	}
	public void setJstatus(String jstatus) {
		this.jstatus = jstatus;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public List<JobMemberDTO> getJmlist() {
		return jmlist;
	}
	public void setJmlist(List<JobMemberDTO> jmlist) {
		this.jmlist = jmlist;
	}
	public int getRequired() {
		return required;
	}
	public void setRequired(int required) {
		this.required = required;
		setDependencies();
	}
	
}
