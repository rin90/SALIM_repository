<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#passwordResult").empty();
	$("#emailResult").empty();
	$("#birthdayResult").empty();
	
	$("#modifyBtn").on("click",function(){
		$("#passwordResult").empty();
		$("#birthdayResult").empty();
		$("#emailResult").empty();
	});

	$("#password2").on("blur", function(){
		$("#passwordResult").empty();
		$.ajax({
			 "url":"${initParam.rootPath}/member/passwordCheck.do",
			 "data":{"password":$('#password').val(),"password2":$('#password2').val()},
			 "dataType":"json",
		
			 "success":function(obj){
				 
				 var result= obj.passwordResult;
				 if(!result)
				 {
				 	$("#passwordResult").html("<font color='red' size='2'>비밀번호가 일치하지 않습니다. 다시 입력해주세요.<font>")
				 }
			 },
		/* 	 "error":function()
			 {
				 alert("실패");
			 } */
				
		});
		
		
	});

	$("#email").on("blur", function(){
		$("#emailResult").empty();
		$.ajax({
			 "url":"${initParam.rootPath}/member/checkingDuplicatedEmail.do",
			 "data":"email="+$("#email").val(),
			 "dataType":"json",
			 "beforeSend":function(){
				 
				 if(!$('#email').val())
			     {
			        return false;
			     }
			 },
			 "success":function(obj){
				 
				 var result= obj.flag;
				 if(result)
				 {
				 	$("#emailResult").html("<font color='blue' size='2'>사용할 수 있는 이메일입니다.<font>")
				 }else
				 {
					 $("#emailResult").html("<font color='red' size='2'>사용할 수 없는 이메일입니다.<font>")
				 }
			 },
			 /* "error":function()
			 {
				 alert("실패");
			 } */
				
		});
	});
	
	$("#birthday").on("blur",function(){
		 $("#birthdayResult").empty();
		 $.ajax({
			 "url":"${initParam.rootPath}/member/birthday.do",
			 "data":{"birthday":$('#birthday').val()},
			 "dataType":"json",
			 "success":function(obj){
				 if(!obj.birthdayResult)
				 {
				 	$("#birthdayResult").html("<font color='red' size='2'>생년월일 형식이 틀렸습니다.<font>")
				 }else
				 {
					 var age=obj.age;
					 $("#age").val(age);
				 }
				 
			 },
		
		});
		
		
	});
	
	
});	
</script>
</head>
<body>
<h2>개인정보 수정</h2>
<form action="${initParam.rootPath}/member/modify.do" method="post">
<table>
	<tr>
		<td>회원 아이디</td>
		<td>${sessionScope.login_info.memberId }
		<input type="hidden" id='memberId' name='memberId' value='${sessionScope.login_info.memberId }'>
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>
			<input type="text" id='name' name='name' placeholder='${sessionScope.login_info.name }' value='${sessionScope.login_info.name }'>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" id='password' name='password' value='${sessionScope.login_info.password }'>
		</td>
	</tr>
	<tr>
		<td>비밀번호 재입력</td>
		<td>
			<input type="password" id='password2' name='password2' value='${${sessionScope.login_info.password2 }'>
			<span id='passwordResult'></span>
		</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>
			<input type="text" id='birthday' name='birthday' placeholder='${sessionScope.login_info.birthday}' value='${sessionScope.login_info.birthday}'>
			<span id='birthdayResult'></span>
		</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>
			<input type="text" id='age' name='age' placeholder='${sessionScope.login_info.age}' value='${sessionScope.login_info.age}'>
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			<input type="text" id='email' name='email' size='21' placeholder='${sessionScope.login_info.email}' value='${sessionScope.login_info.email}'>
			<span id='emailResult'></span>
		</td>
	</tr>

	
</table>

	
	<br>
	<p style="text-align:left">
	<span>
		<input type="submit" value='수정하기' id='modifyBtn' >
	</span>
	</p>
</form>
</body>
</html>