package com.edu.domain;

import lombok.*;
import org.apache.ibatis.type.Alias;

import javax.persistence.*;
import java.sql.Time;
import java.sql.Timestamp;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "userlectureinfo")
public class UserLectureInfoDomain {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY )
    private int lectureinfonum;

    @Column
    private String userid;

    @Column
    private int coursenum;

    @Column
    private int lecturenum;

    @Column
    private Timestamp regDate;

    @Column
    private Timestamp updateDate;

    @Column
    private String checkflag;

    @Column
    private String delflag;



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

    @Builder
    public UserLectureInfoDomain(int lectureInfoNum, String userId, int courseNum, int lectureNum, Timestamp regDate, Timestamp updateDate, String checkFlag, String delFlag){
        this.lectureinfonum = lectureInfoNum;
        this.userid = userId;
        this.coursenum = courseNum;
        this.lecturenum = lectureNum;
        this.regDate = regDate;
        this.updateDate = updateDate;
        this.checkflag = checkFlag;
        this.delflag = delFlag;
    }
}
