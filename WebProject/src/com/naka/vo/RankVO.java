package com.naka.vo;

public class RankVO {
	private String id;
	private String name;
	private int value;
	
	public RankVO(String id, String name, int value) {
		super();
		this.id = id;
		this.name = name;
		this.value = value;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getValue() {
		return value;
	}
	
	
}
