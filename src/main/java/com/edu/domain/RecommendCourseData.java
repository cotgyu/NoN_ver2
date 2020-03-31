package com.edu.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("RecommendCourseData")
public @Data class RecommendCourseData {
	
	
	private int cosno;
	private int userno;	
	private int userscore;
	
	public RecommendCourseData() {}

	public int getCosno() {
		return cosno;
	}

	public void setCosno(int cosno) {
		this.cosno = cosno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getUserscore() {
		return userscore;
	}

	public void setUserscore(int userscore) {
		this.userscore = userscore;
	}

	@Override
	public String toString() {
		return "RecommendCourseData [cosno=" + cosno + ", userno=" + userno + ", userscore=" + userscore + "]";
	}
	
	
}
