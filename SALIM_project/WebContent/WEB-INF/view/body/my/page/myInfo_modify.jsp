<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/scripts/jquery.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
		 	 "error":function()
			 {
				 alert("실패");
			 } 
				
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
			  "error":function()
			 {
				 alert("실패");
			 } 
				
		});
	});
	/* 
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
				 
			 }
		
		});
		
		
	}); */
	 $("#birthday").datepicker({
		 changeMonth: true,
	      changeYear: true,
	 		yearRange:"1900:2016",
            showOtherMonths: true, /* 다른 달도 보여줌 */
            selectOtherMonths: true,   /* 다른 달도 선택할 수 있게 해줌 */
             yearSuffix:'년',   /* 달력에 년도를 표시 */
              monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   /* 달의 이름을 지정 */
            dayNamesMin:['일','월','화','수','목','금','토'],   /* 요일의 이름을 지정 */
            dateFormat:'yymmdd',
              onSelect: function(dateText , inst){
                 $("#birthday").text(dateText)
              	   /* $(".incomeDateHidden").val(dateText) */
                /* location.replace("/SALIM_project/household/login/incomeSelect.do?incomeDate="+dateText); */
             	
                $.ajax({
                 "url":"${initParam.rootPath}/member/birthday.do",
       			 "data":{"birthday":$('#birthday').val()},
       			 "dataType":"json",
       			 "success":function(obj){
       				 var age= obj.age;
       				 $("#age").val(age);
       				 alert(age);
       			 }
                	
                });
              
              }
          
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
			<input type="password" id='password' name='password' <%-- value='${sessionScope.login_info.password}' --%>>
		</td>
	</tr>
	<tr>
		<td>비밀번호 재입력</td>
		<td>
			<input type="password" id='password2' name='password2' <%-- value='${sessionScope.login_info.password2}' --%>>
			<span id='passwordResult'></span>
		</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>
			<input type="text" id='birthday' name='birthday' placeholder='<fmt:formatDate value="${sessionScope.login_info.birthday}" pattern="yyyyMMdd"/>'>
			
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