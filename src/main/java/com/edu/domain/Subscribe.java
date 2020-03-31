package com.edu.domain;


import org.apache.ibatis.type.Alias;

import lombok.Data;


@Alias("Subscribe")
public @Data class Subscribe {
	
	
	private int cosno;	
	private String id;
	

	public Subscribe() {}


	public int getCosno() {
		return cosno;
	}


	public void setCosno(int cosno) {
		this.cosno = cosno;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	@Override
	public String toString() {
		return "Subscribe [cosno=" + cosno + ", id=" + id + "]";
	}
	
}
