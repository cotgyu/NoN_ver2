package com.edu.domain;

import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Alias("UserLectureInfo")
public class UserLectureInfo {
    private String userid;
    private int coursenum;
    private int lecturenum;

    private Timestamp regDate;
    private Timestamp updateDate;

    private String checkflag;
    private String delflag;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getCoursenum() {
        return coursenum;
    }

    public void setCoursenum(int coursenum) {
        this.coursenum = coursenum;
    }

    public int getLecturenum() {
        return lecturenum;
    }

    public void setLecturenum(int lecturenum) {
        this.lecturenum = lecturenum;
    }

    public Timestamp getRegDate() {
        return regDate;
    }

    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }

    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    public String getCheckflag() {
        return checkflag;
    }

    public void setCheckflag(String checkflag) {
        this.checkflag = checkflag;
    }

    public String getDelflag() {
        return delflag;
    }

    public void setDelflag(String delflag) {
        this.delflag = delflag;
    }

    @Override
    public String toString() {
        return "UserLectureInfo{" +
                "userId='" + userid + '\'' +
                ", coursenum=" + coursenum +
                ", lecturenum=" + lecturenum +
                ", regDate=" + regDate +
                ", updateDate=" + updateDate +
                ", checkflag='" + checkflag + '\'' +
                ", delflag='" + delflag + '\'' +
                '}';
    }

}
