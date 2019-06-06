//package com.example.demo.board.domain;
package com.Edu.Domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("CommentVO")
public @Data class CommentVO {
	private int cno;
	private int cosno;
	private int eva_count;
	private String content;
	private String writer;
	private String reg_date;
	private int userno;

	public int getEva_count() {
		return eva_count;
	}

	public void setEva_count(int eva_count) {
		this.eva_count = eva_count;
	}

	public int getCno() {
		return cno;
	}

	public int getCosno() {
		return cosno;
	}

	public String getContent() {
		return content;
	}

	public String getWriter() {
		return writer;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public void setCosno(int cosno) {
		this.cosno = cosno;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	
	


}
