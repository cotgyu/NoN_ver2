package com.edu.domain;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "course_score")
public class CourseScoreDomain {

	@Id
	private int cosno;

	@Column
	private int totalscore;

	@Column
	private int totalcnt;

	@Column
	private double score;

	@Override
	public String toString() {
		return "CourseScore [cosno=" + cosno + ", totalscore=" + totalscore + ", totalcnt=" + totalcnt + ", score="
				+ score + "]";
	}
	
	@Builder
	CourseScoreDomain(int cosno, int totalscore, int totalcnt, double score){
		this.cosno = cosno;
		this.totalscore = totalscore;
		this.totalcnt = totalcnt;
		this.score = score;
	}
}
