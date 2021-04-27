package com.naka.vo;

import java.util.Date;

public class RecruitVO {
	private int r_id;
	private String position;
	private String language;
	private int salary;
	private String job_type;
	private String education;
	private String img;
	private String link;
	private int c_id;
	private Date exp_date;
	private Date start_date;
	
	public RecruitVO(int r_id, String position, String language, int salary, String job_type, String education,
			String img, String link, int c_id, Date exp_date, Date start_date) {
		super();
		this.r_id = r_id;
		this.position = position;
		this.language = language;
		this.salary = salary;
		this.job_type = job_type;
		this.education = education;
		this.img = img;
		this.link = link;
		this.c_id = c_id;
		this.exp_date = exp_date;
		this.start_date = start_date;
	}
	
	
	public int getR_id() {
		return r_id;
	}
	public String getPosition() {
		return position;
	}
	public String getLanguage() {
		return language;
	}
	public int getSalary() {
		return salary;
	}
	public String getJob_type() {
		return job_type;
	}
	public String getEducation() {
		return education;
	}
	public String getImg() {
		return img;
	}
	public String getLink() {
		return link;
	}
	public int getC_id() {
		return c_id;
	}
	public Date getExp_date() {
		return exp_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	
	
	
}
