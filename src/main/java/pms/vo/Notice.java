package pms.vo;

import java.util.Date;

public class Notice {
    private int nid;
    private int pid;
    private String ntitle;
    private String ncontent;
    private Date nregdate;
    private Date nuptdate;

    public Notice() {
    }

    public Notice(int nid, int pid, String ntitle, String ncontent, Date nregdate, Date nuptdate) {
        this.nid = nid;
        this.pid = pid;
        this.ntitle = ntitle;
        this.ncontent = ncontent;
        this.nregdate = nregdate;
        this.nuptdate = nuptdate;
    }

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getNtitle() {
        return ntitle;
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle;
    }

    public String getNcontent() {
        return ncontent;
    }

    public void setNcontent(String ncontent) {
        this.ncontent = ncontent;
    }

    public Date getNregdate() {
        return nregdate;
    }

    public void setNregdate(Date nregdate) {
        this.nregdate = nregdate;
    }

    public Date getNuptdate() {
        return nuptdate;
    }

    public void setNuptdate(Date nuptdate) {
        this.nuptdate = nuptdate;
    }
}
