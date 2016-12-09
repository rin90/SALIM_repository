<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>가입 환영합니다.</h2>
<h3>가입 시 입력하신 정보입니다.</h3>
<table style="width:500px"> 
	<tr>
		<th width="100px" align="left">ID</th>
		<td>${requestScope.member.memberId }</td>
	</tr>
	<tr>
		<th  align="left">패스워드</th>
		<td>${requestScope.member.password}</td>
	</tr>
	<tr>
		<th align="left">이름</th>
		<td>${requestScope.member.name}</td>
	</tr>
	 <tr>
		<th align="left">나이</th>
		<td>${requestScope.member.age}</td>
	</tr>
	<tr>
		<th align="left">생일</th>
		<td><fmt:formatDate value="${requestScope.member.birthday}" pattern="yyyy년 MM월 dd일"/></td>
	</tr>
	<tr>
		<th align="left">이메일</th>
		<td>${requestScope.member.email}</td>
	</tr>
	
</table>











