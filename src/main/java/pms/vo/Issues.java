package pms.vo;

import java.util.Date;

public class Issues {
    private int iid;
    private String ititle;
    private String icontent;
    private String iprogress;
    private Date iregdate;
    private Date iuptdate;
    private int jmid;
    private int pid;
    public Issues() {
    }

    public Issues(int iid, String ititle, String icontent, String iprogress, Date iregdate, Date iuptdate, int jmid,int pid) {
        this.iid = iid;
        this.ititle = ititle;
        this.icontent = icontent;
        this.iprogress = iprogress;
        this.iregdate = iregdate;
        this.iuptdate = iuptdate;
        this.jmid = jmid;
        this.pid = pid;
    }
    
    public int getIid() {
        return iid;
    }

    public void setIid(int iid) {
        this.iid = iid;
    }

    public String getItitle() {
        return ititle;
    }

    public void setItitle(String ititle) {
        this.ititle = ititle;
    }

    public String getIcontent() {
        return icontent;
    }

    public void setIcontent(String icontent) {
        this.icontent = icontent;
    }

    public String getIprogress() {
        return iprogress;
    }

    public void setIprogress(String iprogress) {
        this.iprogress = iprogress;
    }

    public Date getIregdate() {
        return iregdate;
    }

    public void setIregdate(Date iregdate) {
        this.iregdate = iregdate;
    }

    public Date getIuptdate() {
        return iuptdate;
    }

    public void setIuptdate(Date iuptdate) {
        this.iuptdate = iuptdate;
    }

    public int getJmid() {
        return jmid;
    }

    public void setJmid(int jmid) {
        this.jmid = jmid;
    }

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
    
}
