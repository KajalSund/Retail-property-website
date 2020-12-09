package com.Book;

public class UserType {
	String name;
	String email;
	String prof;
	String tel;
	String adress;
	String dob;
	String gender;
	String uname;
	public UserType(String name, String email, String prof, String tel, String adress, String dob, String gender,
			String uname) {
		super();
		this.name = name;
		this.email = email;
		this.prof = prof;
		this.tel = tel;
		this.adress = adress;
		this.dob = dob;
		this.gender = gender;
		this.uname = uname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProf() {
		return prof;
	}
	public void setProf(String prof) {
		this.prof = prof;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
}
