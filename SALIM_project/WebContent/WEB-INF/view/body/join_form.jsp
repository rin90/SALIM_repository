<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 이 부분 jquery.js 추가해야함! -->
<script type="text/javascript" src="${initParam.rootPath}/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#idCheckBtn").on("click", function(){
		
		$.ajax({
			
			/* url:"/My_SALIM_project/member/" */
			
		});
		
		
	});
	
});
</script>

<!-- <a href="/My_SALIM_project/leaveMember.do">회원탈퇴</a>
<a href="/My_SALIM_project/loginMember.do">로그인</a> -->

<h2>가입양식</h2>
<form method="post" action="${initParam.rootPath}/body/join.do">
	<table style="width:600px">
		<tr>
			<td width="100">ID</td>
			<td>
				<input type="text" name="memberId" > <button id="idCheckBtn">아이디 중복 체크</button>
				
			</td>
		</tr>
		<tr>
			<td>Password</td>
			<td>
				<input type="password" name="password">
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" id="name" name="name">
			</td>
		</tr>
		<tr>
			<td>생일</td>
			<td>
				<input type="text" id="birthday" name="birthday">
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<input type="text" id="age" name="age">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" id="email" name="email">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="회원가입">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
