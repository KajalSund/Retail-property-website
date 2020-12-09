package com.Book;

import java.util.Date;

public class BookinStatus {
     String cat;
     String num;
     String status;
	String floor;
     Date from;
     Date to;
	 String uname;
	 int payment;
	 
	public BookinStatus(String cat, String num, String status, String floor) {
		super();
		this.cat = cat;
		this.num = num;
		this.status = status;
		this.floor = floor;
	}
	public BookinStatus(String cat, String num, String status, String floor, Date from, Date to, String uname,
			int payment) {
		this.cat = cat;
		this.num = num;
		this.status = status;
		this.floor = floor;
		this.from = from;
		this.to = to;
		this.uname = uname;
		this.payment = payment;
	}
	public BookinStatus(String cat2, String num2, String status2, String floor2, Date from2, Date to2) {
		cat = cat2;
		num = num2;
		this.status = status2;
		this.floor = floor2;
		this.from = from2;
		this.to = to2;
	}
	public BookinStatus(String cat, String num, Date from, Date to, String uname) {
		super();
		this.cat = cat;
		this.num = num;
		this.from = from;
		this.to = to;
		this.uname = uname;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public Date getFrom() {
		return from;
	}
	public void setFrom(Date from) {
		this.from = from;
	}
	public Date getTo() {
		return to;
	}
	public void setTo(Date to) {
		this.to = to;
	}
	  public String getUname() {
			return uname;
		}
		public void setUname(String uname) {
			this.uname = uname;
		}
		public int getPayment() {
			return payment;
		}
		public void setPayment(int payment) {
			this.payment = payment;
		}
     
}