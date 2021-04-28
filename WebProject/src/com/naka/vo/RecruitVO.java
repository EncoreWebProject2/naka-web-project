package com.naka.vo;

import java.util.Date;

public class RecruitVO {
	private int r_id;
	private String position;
	private String tech;
	private String job_type;
	private String education;
	private String img;
	private String link;
	private int c_id;
	private Date exp_date;
	private Date start_date;
	private String title;
	
	public RecruitVO(int r_id, String position, String tech, String job_type, String education,
			String img, String link, int c_id, Date exp_date, Date start_date,String title) {
		this.r_id = r_id;
		this.position = position;
		this.tech = tech;
		this.job_type = job_type;
		this.education = education;
		this.img = img;
		this.link = link;
		this.c_id = c_id;
		this.exp_date = exp_date;
		this.start_date = start_date;
		this.title = title;
	}
	
	public RecruitVO(int r_id, String position, String tech, String job_type, String education,
			String img, String link,  Date exp_date, Date start_date,String title) {
		this.r_id = r_id;
		this.position = position;
		this.tech = tech;
		this.job_type = job_type;
		this.education = education;
		this.img = img;
		this.link = link;
		
		this.exp_date = exp_date;
		this.start_date = start_date;
		this.title = title;
	}
	
	
	public int getR_id() {
		return r_id;
	}
	public String getPosition() {
		return position;
	}
	public String getTech() {
		return tech;
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
	public String getTitle() {
		return title;
	}
	
}
