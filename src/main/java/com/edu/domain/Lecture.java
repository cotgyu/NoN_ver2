package com.edu.domain;


import lombok.Data;
import org.apache.ibatis.type.Alias;


@Alias("Lecture")
public @Data class Lecture {
	
	
	private int cosno;
	private int lecno;	
	//재생시간 관련 타입 찾아보기
	private String lectime;
	private String lecname;
	private String lecvideo;
	private int lecup;
	private int lecdown;
	
	public Lecture() {}

	public int getCosno() {
		return cosno;
	}

	public void setCosno(int cosno) {
		this.cosno = cosno;
	}

	public int getLecno() {
		return lecno;
	}

	public void setLecno(int lecno) {
		this.lecno = lecno;
	}

	public String getLectime() {
		return lectime;
	}

	public void setLectime(String lectime) {
		this.lectime = lectime;
	}

	public String getLecname() {
		return lecname;
	}

	public void setLecname(String lecname) {
		this.lecname = lecname;
	}

	public String getLecvideo() {
		return lecvideo;
	}

	public void setLecvideo(String lecvideo) {
		this.lecvideo = lecvideo;
	}

	public int getLecup() {
		return lecup;
	}

	public void setLecup(int lecup) {
		this.lecup = lecup;
	}

	public int getLecdown() {
		return lecdown;
	}

	public void setLecdown(int lecdown) {
		this.lecdown = lecdown;
	}

	@Override
	public String toString() {
		return "Lecture [cosno=" + cosno + ", lecno=" + lecno + ", lectime=" + lectime + ", lecname=" + lecname
				+ ", lecvideo=" + lecvideo + ", lecup=" + lecup + ", lecdown=" + lecdown + "]";
	}
	
	

	
	
}
