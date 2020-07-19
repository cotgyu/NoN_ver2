package com.edu.domain;


import lombok.*;

import javax.persistence.*;


@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "lecture")
public class LectureDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private int lecno;

	@Column
	private int cosno;

	@Column
	private String lectime;

	@Column
	private String lecname;

	@Column
	private String lecvideo;

	@Column
	private Integer lecup;

	@Column
	private Integer lecdown;


	@Override
	public String toString() {
		return "Lecture [cosno=" + cosno + ", lecno=" + lecno + ", lectime=" + lectime + ", lecname=" + lecname
				+ ", lecvideo=" + lecvideo + ", lecup=" + lecup + ", lecdown=" + lecdown + "]";
	}

	@Builder
	public LectureDomain(int lecNo, int cosNo, String lecTime, String lecName ,String lecVideo, Integer lecUp, Integer lecDown){
		this.lecno = lecNo;
		this.cosno = cosNo;
		this.lectime = lecTime;
		this.lecname = lecName;
		this.lecvideo = lecVideo;
		this.lecup = lecUp;
		this.lecdown = lecDown;
	}

	
	
}
