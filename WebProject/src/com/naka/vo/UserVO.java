package com.naka.vo;

import java.util.Date;

public class UserVO {
	private String u_id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String status;
	private String email;
	private String job_field;
	private String education;
	private String birth_day;
	private String scrap;
	private String salt;
	
	
	public UserVO(String u_id, String password, String name, String email) {
		super();
		this.u_id = u_id;
		this.password = password;
		this.name = name;
		this.email = email;
	}
	
	public UserVO(String u_id, String name, String address, String phone, String status, String email, String job_field,
			String education, String birth_day) {
		super();
		this.u_id = u_id;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.status = status;
		this.email = email;
		this.job_field = job_field;
		this.education = education;
		this.birth_day = birth_day;
	}

	public UserVO(String u_id, String password, String name, String address, String phone, String status, String email, String job_field,
			String education, String birth_day) {
		super();
		this.u_id = u_id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.status = status;
		this.email = email;
		this.job_field = job_field;
		this.education = education;
		this.birth_day = birth_day;
	}


	public UserVO(String u_id, String password, String name, String address, String phone, String status, String email,
			String job_field, String education, String birth_day, String scrap, String salt) {
		super();
		this.u_id = u_id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.status = status;
		this.email = email;
		this.job_field = job_field;
		this.education = education;
		this.birth_day = birth_day;
		this.scrap = scrap;
		this.salt = salt;
	}
	public String getStatus() {
		return status;
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
	public void setStatus(String status) {
		this.status = status;
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
	public String getBirth_day() {
		return birth_day;
	}
	public String getScrap() {
		return scrap;
	}
	public String getSalt() {
		return salt;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setJob_field(String job_field) {
		this.job_field = job_field;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}
	public void setScrap(String scrap) {
		this.scrap = scrap;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}	
	
	
}
