package com.Book;

public class Spaces {
	String space;
	String area;
	String duration;
	String rent_type;
	int cost;
	public Spaces(String space, String area, String duration, String rent_type, int cost) {
		super();
		this.space = space;
		this.area = area;
		this.duration = duration;
		this.rent_type = rent_type;
		this.cost = cost;
	}
	public String getSpace() {
		return space;
	}
	public void setSpace(String space) {
		this.space = space;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getRent_type() {
		return rent_type;
	}
	public void setRent_type(String rent_type) {
		this.rent_type = rent_type;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}

}
