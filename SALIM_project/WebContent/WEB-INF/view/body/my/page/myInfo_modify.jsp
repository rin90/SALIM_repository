<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

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
	 		showMonthAfterYear:true,
            showOtherMonths: true, /* 다른 달도 보여줌 */
            selectOtherMonths: true,   /* 다른 달도 선택할 수 있게 해줌 */
             yearSuffix:'년',   /* 달력에 년도를 표시 */
              monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   /* 달의 이름을 지정 */
            dayNamesMin:['일','월','화','수','목','금','토'],   /* 요일의 이름을 지정 */
            dateFormat:'yymmdd',
              onSelect: function(dateText , inst){
                 $("#birthday").text(dateText)
                $.ajax({
                 "url":"${initParam.rootPath}/member/birthday.do",
       			 "data":{"birthday":$('#birthday').val()},
       			 "dataType":"json",
       			 "success":function(obj){
       				 var age= obj.age;
       				 $("#age").val(age);
       				
       			 }
                	
                });
              
              }
          
         });
	
	
	
});	
</script>
</head>
<body>
<div class="col-md-10 col-md-offset-2">
<h2>개인정보 수정</h2><br><br>
<form action="${initParam.rootPath}/member/modify.do" method="post">
<div class="form-group">
    <h4><label class="control-label col-sm-2" >회원 아이디</label></h4>
    <div class="col-sm-8">
      ${sessionScope.login_info.memberId }
		<input type="hidden" id='memberId' name='memberId' value='${sessionScope.login_info.memberId }'>
      <br>
    </div>
  </div>
  <br><br>
  <div class="form-group">
    <h4><label class="control-label col-sm-2" for="pwd">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</label></h4>
    <div class="col-sm-10"> 
      <input type="password" class="form-control"  id="password" name="password" placeholder="비밀번호를 변경할 수 있습니다."> <%-- value='${sessionScope.login_info.password}' --%>
     <font color="gray">8~20자의 영문 대/소문자,숫자,특수문자 혼용가능</font>
     <br><br>
    </div>

    <h4><label class="control-label col-sm-2" for="pwd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;재입력</label></h4>
    <div class="col-sm-10"> 
       
          <input type="password" class="form-control"  id="password2" name="password2" placeholder="비밀번호를 다시 입력해주세요." ><%-- value='${sessionScope.login_info.password2}'> --%>
		  <span id='passwordResult'></span><br>
      
    </div>
  </div>
  
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" name="name" placeholder='${sessionScope.login_info.name }' value='${sessionScope.login_info.name }'>
    	<br>
    </div>
  </div>
  
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생일</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="birthday" name="birthday" placeholder='<fmt:formatDate value="${sessionScope.login_info.birthday}" pattern="yyyyMMdd"/>'>
		<span id='birthdayResult'></span>   	  
    	<br>
    </div>
  </div>
  
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나이</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="age" name="age" placeholder='${sessionScope.login_info.age}' value='${sessionScope.login_info.age}'>
    	<br>
    </div>
  </div>
  
   <div class="form-group">
    <h4><label class="control-label col-sm-2" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="email" name="email" placeholder='${sessionScope.login_info.email}' value='${sessionScope.login_info.email}'>
      <span id='emailResult'></span><br>
    </div>
  </div>
  
 <!--  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label><input type="checkbox"> Remember me</label>
      </div>
    </div>
  </div> -->
  
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <br><button type="submit" id='modifyBtn' class="btn btn-lg btn-success pull-right">수정하기</button>
    </div>
  </div>

</form>
</div>
<%-- 
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
			<input type="password" id='password' name='password' value='${sessionScope.login_info.password}'>
		</td>
	</tr>
	<tr>
		<td>비밀번호 재입력</td>
		<td>
			<input type="password" id='password2' name='password2' value='${sessionScope.login_info.password2}'>
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
</form> --%>
</body>
</html>