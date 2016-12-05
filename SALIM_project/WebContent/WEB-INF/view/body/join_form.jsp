<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 이 부분 jquery.js 추가해야함! -->
<script type="text/javascript" src="${initParam.rootPath}/scripts/jquery.js"></script>

<script type="text/javascript">
var result=false;
$(document).ready(function(){
	$("#idCheckBtn").on("click", function(){
	
		$.ajax({
			 "url":"${initParam.rootPath}/member/idDueCheck.do",
			 "data":"memberId="+$("#id").val() ,
			 "dataType":"json",
			 "beforeSend":function(){
				 if(!memberId)
			     {
					 $("#idCheckLayer").html("아이디를 입력하세요.")
					 return false;
			     }
			 },
			 "success":function(obj)
			 {
				 alert("success");
				 result= obj.flag;
				 if(result) //트루인 경우! 사용가능
				 {
					 alert("성공, true인 경우");
					 $("#idCheckLayer").html("사용할 수 있는 아이디입니다.");
					 
				 }
					 
			 },
			 "error":function()
			 {
				 alert("실패");
			 }
				
		});
		
		
	});
	
});
</script>

<!-- <a href="/My_SALIM_project/leaveMember.do">회원탈퇴</a>
<a href="/My_SALIM_project/loginMember.do">로그인</a> -->

<h2>가입양식</h2>
<form method="post" action="${initParam.rootPath}/member/join.do">
	<table style="width:600px">
		<tr>
			<td width="100">ID</td>
			<td>
				<input type="text" name="memberId" id='id' ><button id="idCheckBtn">아이디 중복 체크</button><div id="idCheckLayer"></div>
				
			</td>
		</tr>
		<tr>
			<td>Password</td>
			<td>
				<input type="password" name="password">
			</td>
		</tr>
		<tr>
			<td>Password 재입력</td>
			<td>
				<input type="password" name="password2">
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
				<input type="text" id="email" name="email"> <button id="emailCheckBtn">이메일 중복 체크가 필요한가?</button>
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
