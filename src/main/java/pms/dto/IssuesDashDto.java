package pms.dto;

import java.util.Date;

public class IssuesDashDto {
    private int iid;
    private String jname;
    private String ititle;
    private String iprogress;
    private String name;
    private Date iuptdate;

    public IssuesDashDto() {
    }

    public IssuesDashDto(int iid, String jname, String ititle, String iprogress, String name, Date iuptdate) {
        this.iid = iid;
        this.jname = jname;
        this.ititle = ititle;
        this.iprogress = iprogress;
        this.name = name;
        this.iuptdate = iuptdate;
    }

    public int getIid() {
        return iid;
    }

    public void setIid(int iid) {
        this.iid = iid;
    }

    public String getJname() {
        return jname;
    }

    public void setJname(String jname) {
        this.jname = jname;
    }

    public String getItitle() {
        return ititle;
    }

    public void setItitle(String ititle) {
        this.ititle = ititle;
    }

    public String getIprogress() {
        return iprogress;
    }

    public void setIprogress(String iprogress) {
        this.iprogress = iprogress;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getIuptdate() {
        return iuptdate;
    }

    public void setIuptdate(Date iuptdate) {
        this.iuptdate = iuptdate;
    }
}
