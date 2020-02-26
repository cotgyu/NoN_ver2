package com.edu.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;
 
@Alias("code")
public @Data class Code {
	private String group;
	 
	private String code;	
	private String desc;
	private String ref01;
	private String ref02;
	private String ref03;
	private String ref04;
	private String ref05;
}
