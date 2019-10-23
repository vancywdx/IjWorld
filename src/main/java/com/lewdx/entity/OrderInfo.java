package com.lewdx.entity;

import java.util.Date;

public class OrderInfo {
    private Integer id;

    private String oExpress;

    private String oPaytype;

    private Double oPaycount;

    private Date oOrderdate;

    private Integer oOrderstatus;

    private Boolean oShippingstatus;

    private Boolean oPaystatus;

    private Integer userid;

    private String oReceiver;

    private String oRecphone;

    private String oRecaddres;

    private Boolean flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getoExpress() {
        return oExpress;
    }

    public void setoExpress(String oExpress) {
        this.oExpress = oExpress == null ? null : oExpress.trim();
    }

    public String getoPaytype() {
        return oPaytype;
    }

    public void setoPaytype(String oPaytype) {
        this.oPaytype = oPaytype == null ? null : oPaytype.trim();
    }

    public Double getoPaycount() {
        return oPaycount;
    }

    public void setoPaycount(Double oPaycount) {
        this.oPaycount = oPaycount;
    }

    public Date getoOrderdate() {
        return oOrderdate;
    }

    public void setoOrderdate(Date oOrderdate) {
        this.oOrderdate = oOrderdate;
    }

    public Integer getoOrderstatus() {
        return oOrderstatus;
    }

    public void setoOrderstatus(Integer oOrderstatus) {
        this.oOrderstatus = oOrderstatus;
    }

    public Boolean getoShippingstatus() {
        return oShippingstatus;
    }

    public void setoShippingstatus(Boolean oShippingstatus) {
        this.oShippingstatus = oShippingstatus;
    }

    public Boolean getoPaystatus() {
        return oPaystatus;
    }

    public void setoPaystatus(Boolean oPaystatus) {
        this.oPaystatus = oPaystatus;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getoReceiver() {
        return oReceiver;
    }

    public void setoReceiver(String oReceiver) {
        this.oReceiver = oReceiver == null ? null : oReceiver.trim();
    }

    public String getoRecphone() {
        return oRecphone;
    }

    public void setoRecphone(String oRecphone) {
        this.oRecphone = oRecphone == null ? null : oRecphone.trim();
    }

    public String getoRecaddres() {
        return oRecaddres;
    }

    public void setoRecaddres(String oRecaddres) {
        this.oRecaddres = oRecaddres == null ? null : oRecaddres.trim();
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
                "id=" + id +
                ", oExpress='" + oExpress + '\'' +
                ", oPaytype='" + oPaytype + '\'' +
                ", oPaycount=" + oPaycount +
                ", oOrderdate=" + oOrderdate +
                ", oOrderstatus=" + oOrderstatus +
                ", oShippingstatus=" + oShippingstatus +
                ", oPaystatus=" + oPaystatus +
                ", userid=" + userid +
                ", oReceiver='" + oReceiver + '\'' +
                ", oRecphone='" + oRecphone + '\'' +
                ", oRecaddres='" + oRecaddres + '\'' +
                ", flag=" + flag +
                '}';
    }
}