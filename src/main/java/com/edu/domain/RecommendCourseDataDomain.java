package com.edu.domain;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "recommend_coursedata")
public  class RecommendCourseDataDomain {

	@Id
	private int recommendnumber;

	@Column
	private int cosno;

	@Column
	private int userno;

	@Column
	private int userscore;


	@Override
	public String toString() {
		return "RecommendCourseData [cosno=" + cosno + ", userno=" + userno + ", userscore=" + userscore + "]";
	}

	@Builder
	public RecommendCourseDataDomain(int cosno, int userno, int userscore){
		this.cosno = cosno;
		this.userno= userno;
		this.userscore = userscore;
	}
	
}
