package com.salim.vo.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.salim.vo.Member;

public class MemberCheckValidator implements Validator{

	@Override
	public boolean supports(Class<?> c) {
		// TODO Auto-generated method stub
		return c.isAssignableFrom(Member.class);
	}

	@Override
	public void validate(Object obj, Errors err) {
		//업무적인 검증!
		//1.password가 같은지 다른지 처리.
		Member member=(Member)obj;
		if(!member.getPassword().equals(member.getPassword2()))
		{
			System.out.println("비밀번호가 틀렸습니다.");
		}
	}

}
