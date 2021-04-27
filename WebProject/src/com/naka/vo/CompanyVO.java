package com.naka.vo;

public class CompanyVO {
	private int c_id;
	private String compnay_name;
	private String location;
	private String logo_img;
	
	public CompanyVO(int c_id, String compnay_name, String location, String logo_img) {
		super();
		this.c_id = c_id;
		this.compnay_name = compnay_name;
		this.location = location;
		this.logo_img = logo_img;
	}

	public int getC_id() {
		return c_id;
	}

	public String getCompnay_name() {
		return compnay_name;
	}

	public String getLocation() {
		return location;
	}

	public String getLogo_img() {
		return logo_img;
	}
	
	
}
