package com.edu.domain;


import lombok.Data;
import org.apache.ibatis.type.Alias;


/**
 * @author SK
 *
 */
@Alias("Course")
public @Data class Course {
	
	
	private int cosno;	
	private String cosname;
	private String cosintro;
	private String cosintrovideo;
	private String coscategory1;
	private String coscategory2;
	private String cosregtime;
	private String cospicture;
	private int coseval;

	public Course() {}
	
	public int getCosno() {
		return cosno;
	}
	public void setCosno(int cosno) {
		this.cosno = cosno;
	}
	public String getCosname() {
		return cosname;
	}
	public void setCosname(String cosname) {
		this.cosname = cosname;
	}
	public String getCosintro() {
		return cosintro;
	}
	public void setCosintro(String cosintro) {
		this.cosintro = cosintro;
	}
	public String getCosintrovideo() {
		return cosintrovideo;
	}
	public void setCosintrovideo(String cosintrovideo) {
		this.cosintrovideo = cosintrovideo;
	}
	
	public String getCosregtime() {
		return cosregtime;
	}
	public void setCosregtime(String cosregtime) {
		this.cosregtime = cosregtime;
	}
	public String getCospicture() {
		return cospicture;
	}
	public void setCospicture(String cospicture) {
		this.cospicture = cospicture;
	}

	public String getCoscategory1() {
		return coscategory1;
	}

	public void setCoscategory1(String coscategory1) {
		this.coscategory1 = coscategory1;
	}

	public String getCoscategory2() {
		return coscategory2;
	}

	public void setCoscategory2(String coscategory2) {
		this.coscategory2 = coscategory2;
	}

	
	public int getCoseval() {
		return coseval;
	}

	public void setCoseval(int coseval) {
		this.coseval = coseval;
	}

	@Override
	public String toString() {
		return "Course [cosno=" + cosno + ", cosname=" + cosname + ", cosintro=" + cosintro + ", cosintrovideo="
				+ cosintrovideo + ", coscategory1=" + coscategory1 + ", coscategory2=" + coscategory2 + ", cosregtime="
				+ cosregtime + ", cospicture=" + cospicture + ", coseval=" + coseval + "]";
	}

	
	

	
}
