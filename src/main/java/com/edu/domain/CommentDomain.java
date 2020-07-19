package com.edu.domain;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;


@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "comment")
public class CommentDomain {

	@Id
	private int cno;

	@Column
	private int cosno;

	@Column
	private int eva_count;

	@Column
	private String content;

	@Column
	private String writer;

	@Column
	private String reg_date;

	@Column
	private int userno;


	@Builder
	public CommentDomain(int cno, int cosno, int eva_count, String content, String writer, String reg_date, int userno){
		this.cno = cno;
		this.cosno = cosno;
		this.eva_count = eva_count;
		this.content = content;
		this.writer = writer;
		this.reg_date = reg_date;
		this.userno = userno;
	}



}
