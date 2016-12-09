package com.salim.vo.validator;

import java.util.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.salim.util.DateJsonSerializer2;

public class MemberModifyCheck {
	
	private String memberId;
	private String name;
	private int age; 
	
	@JsonSerialize(using=DateJsonSerializer2.class)
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date birthday;
	

	private String password;
	
	@Email
	private String email;

	private String password2;
	
	public MemberModifyCheck(){}
	
	public MemberModifyCheck(String memberId, String name, int age, Date birthday, String password, String email,
			String password2) {
		super();
		this.memberId = memberId;
		this.name = name;
		this.age = age;
		this.birthday = birthday;
		this.password = password;
		this.email = email;
		this.password2 = password2;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + age;
		result = prime * result + ((birthday == null) ? 0 : birthday.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((password2 == null) ? 0 : password2.hashCode());
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
		MemberModifyCheck other = (MemberModifyCheck) obj;
		if (age != other.age)
			return false;
		if (birthday == null) {
			if (other.birthday != null)
				return false;
		} else if (!birthday.equals(other.birthday))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
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
		if (password2 == null) {
			if (other.password2 != null)
				return false;
		} else if (!password2.equals(other.password2))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberModifyCheck [memberId=" + memberId + ", name=" + name + ", age=" + age + ", birthday=" + birthday
				+ ", password=" + password + ", email=" + email + ", password2=" + password2 + "]";
	}
	
	
	

}
