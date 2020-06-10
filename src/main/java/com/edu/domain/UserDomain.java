package com.edu.domain;

import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;


@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity(name = "user")
public class UserDomain {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	int usernum;

	@Column
	String id;

	@Column
	String password;

	@Column
	String nickname;

	@Column
	String email;

	@Column
	String logintype;

	@Column
	Timestamp regdate;

	@Column
	Timestamp updatedate;

	@Column
	int grade;

	@Column
	String delflag;


	@Builder
	public UserDomain(int userNum, String id, String password, String nickName, String email, String loginType, Timestamp regDate, Timestamp updateDate, int grade ,String delFlag){
		this.usernum = userNum;
		this.id = id;
		this.password = password;
		this.nickname = nickName;
		this.email = email;
		this.logintype = loginType;
		this.regdate = regDate;
		this.updatedate = updateDate;
		this.grade = grade;
		this.delflag = delFlag;
	}

}
