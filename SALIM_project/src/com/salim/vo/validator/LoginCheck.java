package com.salim.vo.validator;

import org.hibernate.validator.constraints.NotEmpty;

public class LoginCheck {
	@NotEmpty(message="아이디를 입력하세요.")
	String memberId;
	@NotEmpty(message="비밀번호를 입력하세요.")
	String password;
	
	public LoginCheck(){}

	public LoginCheck(String memberId, String password) {
		super();
		this.memberId = memberId;
		this.password = password;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
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
		LoginCheck other = (LoginCheck) obj;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
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
		return "LoginCheck [memberId=" + memberId + ", password=" + password + "]";
	}
	
	

	
}
