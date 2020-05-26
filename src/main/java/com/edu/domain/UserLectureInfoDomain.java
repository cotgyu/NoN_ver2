package com.edu.domain;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import javax.persistence.*;
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

}
