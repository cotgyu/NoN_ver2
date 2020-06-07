package com.edu.domain;

import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "course")
public class CourseDomain {
    @Id
    private int cosno;

    @Column
    private String cosname;

    @Column
    private String cosintro;

    @Column
    private String cosintrovideo;

    @Column
    private String coscategory1;

    @Column
    private String coscategory2;

    @Column
    private String cosregtime;

    @Column
    private String cospicture;

    @Column
    @ColumnDefault(value = "0")
    private Integer coseval;

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
