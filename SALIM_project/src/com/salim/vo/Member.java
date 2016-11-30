package com.salim.vo;

import java.io.Serializable;
import java.util.Date;

public class Member implements Serializable{
 
	String MemberId;
	String name;
	int age;
	Date brithday;
	String password;
	
	Member(){}

	public Member(String memberId, String name, int age, Date brithday, String password) {
		super();
		MemberId = memberId;
		this.name = name;
		this.age = age;
		this.brithday = brithday;
		this.password = password;
	}

	public String getMemberId() {
		return MemberId;
	}

	public void setMemberId(String memberId) {
		MemberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getBrithday() {
		return brithday;
	}

	public void setBrithday(Date brithday) {
		this.brithday = brithday;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((MemberId == null) ? 0 : MemberId.hashCode());
		result = prime * result + age;
		result = prime * result + ((brithday == null) ? 0 : brithday.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		if (MemberId == null) {
			if (other.MemberId != null)
				return false;
		} else if (!MemberId.equals(other.MemberId))
			return false;
		if (age != other.age)
			return false;
		if (brithday == null) {
			if (other.brithday != null)
				return false;
		} else if (!brithday.equals(other.brithday))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Member [MemberId=" + MemberId + ", name=" + name + ", age=" + age + ", brithday=" + brithday
				+ ", password=" + password + "]";
	}
	
}
