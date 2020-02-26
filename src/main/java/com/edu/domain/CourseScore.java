package com.edu.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("CourseScore")
public @Data class CourseScore {
	
	private int cosno;	
	private int totalscore;
	private int totalcnt;
	private float score;
	public int getCosno() {
		return cosno;
	}
	public void setCosno(int cosno) {
		this.cosno = cosno;
	}
	public int getTotalscore() {
		return totalscore;
	}
	public void setTotalscore(int totalscore) {
		this.totalscore = totalscore;
	}
	public int getTotalcnt() {
		return totalcnt;
	}
	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	
	
	@Override
	public String toString() {
		return "CourseScore [cosno=" + cosno + ", totalscore=" + totalscore + ", totalcnt=" + totalcnt + ", score="
				+ score + "]";
	}
	
	
}
