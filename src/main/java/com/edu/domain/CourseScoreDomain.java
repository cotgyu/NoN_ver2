package com.edu.domain;

import lombok.*;
import org.apache.ibatis.type.Alias;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "coursescore")
public @Data class CourseScoreDomain {

	@Id
	private int cosno;

	@Column
	private int totalscore;

	@Column
	private int totalcnt;

	@Column
	private float score;

	@Override
	public String toString() {
		return "CourseScore [cosno=" + cosno + ", totalscore=" + totalscore + ", totalcnt=" + totalcnt + ", score="
				+ score + "]";
	}
	
	@Builder
	CourseScoreDomain(int cosno, int totalscore, int totalcnt, float score){
		this.cosno = cosno;
		this.totalscore = totalscore;
		this.totalcnt = totalcnt;
		this.score = score;
	}
}
