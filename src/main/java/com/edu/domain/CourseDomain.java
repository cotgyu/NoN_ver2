package com.edu.domain;

import lombok.*;

import javax.persistence.Entity;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "course")
public class CourseDomain {
    private int cosno;
    private String cosname;
    private String cosintro;
    private String cosintrovideo;
    private String coscategory1;
    private String coscategory2;
    private String cosregtime;
    private String cospicture;
    private int coseval;

    @Override
    public String toString() {
        return "Course [cosno=" + cosno + ", cosname=" + cosname + ", cosintro=" + cosintro + ", cosintrovideo="
                + cosintrovideo + ", coscategory1=" + coscategory1 + ", coscategory2=" + coscategory2 + ", cosregtime="
                + cosregtime + ", cospicture=" + cospicture + ", coseval=" + coseval + "]";
    }

    @Builder
    public CourseDomain(int cosNo, String cosName, String cosIntro, String cosIntrovideo, String cosCategory1, String cosCategory2, String cosRegTime, String cosPicture, int cosEval ){
        this.cosno = cosNo;
        this.cosname = cosName;
        this.cosintro = cosIntro;
        this.cosintrovideo = cosIntrovideo;
        this.coscategory1 = cosCategory1;
        this.coscategory2 = cosCategory2;
        this.cosregtime = cosRegTime;
        this.cospicture = cosPicture;
        this.coseval = cosEval;
    }
}
