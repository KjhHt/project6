package pms.vo;

import java.util.List;

public class UpdateJobVO {
	private int jid;
	private List<Integer> ppids;
	
	public List<Integer> getPpids() {
		return ppids;
	}
	public void setPpids(List<Integer> ppids) {
		this.ppids = ppids;
	}
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
	}
}
