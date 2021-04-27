package com.naka.vo;

import java.util.Date;

public class UserVO {
	private String u_id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String email;
	private String job_field;
	private String education;
	private Date birth_day;
	private String scrap;
	
	
	public UserVO(String u_id, String password, String name, String email) {
		super();
		this.u_id = u_id;
		this.password = password;
		this.name = name;
		this.email = email;
	}
	public UserVO(String u_id, String password, String name, String address, String phone, String email,
			String job_field, String education, Date birth_day, String scrap) {
		super();
		this.u_id = u_id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.job_field = job_field;
		this.education = education;
		this.birth_day = birth_day;
		this.scrap = scrap;
	}
	public String getU_id() {
		return u_id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getJob_field() {
		return job_field;
	}
	public String getEducation() {
		return education;
	}
	public Date getBirth_day() {
		return birth_day;
	}
	public String getScrap() {
		return scrap;
	}	
}
