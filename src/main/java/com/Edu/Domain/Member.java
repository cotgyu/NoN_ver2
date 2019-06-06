package com.Edu.Domain;

import java.sql.Timestamp;

public class Member {
	private String name, id, pass, email, mobile,nick;
	private String phone, zipcode, address1, address2,birth,gender,profile_image;
	private boolean emailGet;
	private int grade;
	private Timestamp regDate;
	private int userno;
	
	public Member() {}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public boolean isEmailGet() {
		return emailGet;
	}
	public void setEmailGet(boolean emailGet) {
		this.emailGet = emailGet;
	}

	public Timestamp getRegDate() {
		return regDate;
	}
	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	
	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", id=" + id + ", pass=" + pass + ", email=" + email + ", mobile=" + mobile
				+ ", nick=" + nick + ", phone=" + phone + ", zipcode=" + zipcode + ", address1=" + address1
				+ ", address2=" + address2 + ", birth=" + birth + ", gender=" + gender + ", profile_image="
				+ profile_image + ", emailGet=" + emailGet + ", grade=" + grade + ", regDate=" + regDate + "]";
	}


}
