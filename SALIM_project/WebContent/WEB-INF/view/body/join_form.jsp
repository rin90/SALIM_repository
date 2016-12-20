<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>jQuery UI Datepicker - Default functionality</title>

<style type="text/css">
.errorMessage{
	font-size: 12px;
	color: red
}

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
var result=false;
$(document).ready(function(){
	
	$("#idResult").empty();
	$("#passwordResult").empty();
	$("#emailResult").empty();
	$("#birthdayResult").empty();
	$("#memberId").on("blur", function(){
	$("#idResult").empty();
		
		$.ajax({
			 "url":"${initParam.rootPath}/member/checkingDuplicatedId.do",
			 "data":"memberId="+$("#memberId").val(),
			 "dataType":"json",
			 "beforeSend":function(){
				 
				 if(!$('#memberId').val())
			     {
			        alert("아이디를 입력하세요.");
			        return false;
			     }
			 },
			 "success":function(obj){
				 
				 var result= obj.flag;
				 if(result)
				 {
				 	$("#idResult").html("<font color='blue' size='2'>사용할 수 있는 아이디입니다.<font>")
				 }else
				 {
					 $("#idResult").html("<font color='red' size='2'>사용할 수 없는 아이디입니다.<font>")
				 }
			 }
			/*  "error":function()
			 {
				 alert("실패");
			 }
				 */
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
			        alert("이메일을 입력하세요.");
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
			 }
			 /* "error":function()
			 {
				 alert("실패");
			 } */
				
		});
		
		
	});
	
	$("#password2").on("blur", function(){
		$("#passwordResult").empty();
		$.ajax({
			 "url":"${initParam.rootPath}/member/passwordCheck.do",
			 "data":{"password":$('#password').val(),"password2":$('#password2').val()},
			 "dataType":"json",
			 "beforeSend":function(){
				 
				 if(!$('#password').val())
			     {
			        alert("비밀번호를 입력하세요.");
			        return false;
			     }
				 if(!$("#password2").val())
				 {
					 alert("비밀번호 재입력을 하세요.");
					 return false;
				 }
			 },
			 "success":function(obj){
				 
				 var result= obj.passwordResult;
				 if(!result)
				 {
				 	$("#passwordResult").html("<font color='red' size='2'>비밀번호가 일치하지 않습니다. 다시 입력해주세요.<font>")
				 }
			 }
		/* 	 "error":function()
			 {
				 alert("실패");
			 } */
				
		});
		
		
	});
	
		 
 		/*  $("#birthday").on("click",function(){
			 $("#birthdayResult").empty();
			 alert("생년월일은 공백없이 8자리를 입력하세요.예)19910101")
		 }); */
		 
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
			
			
		}); 
		
		 $("#birthday").datepicker({
			 changeMonth: true,
		      changeYear: true,
		 		yearRange:"1900:2016",
		 		showMonthAfterYear:true,
	            showOtherMonths: true, //다른 달도 보여줌 
	            selectOtherMonths: true,    //다른 달도 선택할 수 있게 해줌 
	             yearSuffix:'년',   //달력에 년도를 표시 
	             monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],   //달의 이름을 지정 
	            dayNamesMin:['일','월','화','수','목','금','토'],    //요일의 이름을 지정 
	            dateFormat:'yymmdd',
	              onSelect: function(dateText , inst){
	                 $("#birthday").text(dateText)
	              	   // $(".incomeDateHidden").val(dateText) 
	                // location.replace("/SALIM_project/household/login/incomeSelect.do?incomeDate="+dateText); 
	             	
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
<%-- <h2>새 계정 만들기</h2>
<form method="post" action="${initParam.rootPath}/member/join.do" method="POST">
	<table style="width:1000px"  >
		<tr>
			<td width="200">ID</td>
			<td>
				<input type="text" name="memberId" id="memberId" size='21' >&nbsp;&nbsp;&nbsp;
				
					<span id='idResult'></span>
					<span class="errorMessage">
						<form:errors path="member.memberId"/>
					</span>
			</td>
			
		</tr>
		<tr>
			<td>Password</td>
			<td>
				<input type="password" id="password" name="password" size='22'>
				<span class="errorMessage">
						<form:errors path="member.password"/>
				</span>
			</td>
		</tr>
		<tr>
			<td>Password 재입력</td>
			<td>
				<input type="password" id="password2" name="password2" size='22'>&nbsp;&nbsp;&nbsp;
				<span id='passwordResult'></span>
				<span class="errorMessage">
						<form:errors path="member.password2"/>
				</span>
			
			</td>
			
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" id="name" name="name" size='21'>
				<span class="errorMessage">
						<form:errors path="member.name"/>
					</span>
			</td>
		</tr>
		<tr>
			<td>생일</td>
			<td>
				<input type="text" id="birthday" name="birthday" size='21'>
				<span id='birthdayResult'></span>
				<span id='birthdayResult2'></span>
				<span class="errorMessage">
						<form:errors path="member.birthday"/>
				</span>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<input type="text" id="age" name="age" size='21'>
			
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" id="email" name="email" size='21'>&nbsp;&nbsp;&nbsp;
				<span id="emailResult"></span>
				<span class="errorMessage">
						<form:errors path="member.email"/>
					</span>
			</td>
		</tr>
		
				
	</table>
	<br>
	<p style="text-align:center">
	<input type="reset" value="다시작성" id='reset'>&nbsp;&nbsp;
	<input type="submit" value="회원가입">
	
	<p>
</form> --%>

<div class="col-md-10 col-md-offset-2">
<h2>새 계정 만들기</h2><br><br>
<form class="form-horizontal" method="post" action="${initParam.rootPath}/member/join.do" method="POST">
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >아이디 입력</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="memberId" id="memberId" placeholder="salim">
    </div>
  </div>
  <div class="form-group">
    <h4><label class="control-label col-sm-2" for="pwd">비밀번호 입력</label></h4>
    <div class="col-sm-10"> 
      <input type="password" class="form-control"  id="password" name="password" placeholder="********">
     <font color="gray">8~20자의 영문 대/소문자,숫자,특수문자 혼용가능</font>    <br><br>
    </div>

    <h4><label class="control-label col-sm-2" for="pwd">비밀번호 확인</label></h4>
    <div class="col-sm-10"> 
      <input type="password" class="form-control"  id="password2" name="password2" placeholder="비밀번호를 다시 입력해주세요.">
      <p class="help-block"><small>다른 유저의 유저이름과 중복되도 상관없으며, 나중에 변경할 수 있습니다.</small><mark style="display:none;" class="pull-right"><small>한 글자 이상의 사용자 이름을 입력해주세요</small></mark></p>
    </div>
  </div>
  
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >이름</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" name="name" placeholder="홍길동">
    </div>
  </div>
  
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >생일</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="birthday" name="birthday" placeholder="clik">
    </div>
  </div>
  
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >나이</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="age" name="age" placeholder="생년월일 입력 시 자동으로 입력되오니 나이를 확인해주세요.">
    </div>
  </div>
  
   <div class="form-group">
    <h4><label class="control-label col-sm-2" >이메일</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="email" name="email" placeholder="salim@google.com">
      <font color="gray">이메일은 그룹 초대를 받을 때 사용될 수 있습니다.</font>
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
      <button type="submit" class="btn btn-lg btn-success pull-right">새 계정 만들기</button>
    </div>
  </div>
</form>

</div>



</body>

</html>

