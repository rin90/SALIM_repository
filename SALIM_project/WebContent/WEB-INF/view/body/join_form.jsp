<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>SALIM에 오신 것을 환영합니다.</title>
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->


<style type="text/css">
.errorMessage{
	font-size: 12px;
	color: red
}

.smallerror{color:red;}
.smallokay{color:blue;}


 header {
    background-color: #00001E;
    text-align: center;
    padding: 5px;
} 

footer {
    background-color: #00001E;
    padding-top: 30px;
    text-align: center;
    height: 50px;
    clear: both;
    padding-bottom: 50px;
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
				 	$("#idResult").html("<mark class='pull-right'><small class='smallokay'>사용할 수 있는 아이디입니다!</small></mark>")
				 }else
				 {
					 $("#idResult").html("<mark class='pull-right'><small class='smallerror'>이미 사용 중인 아이디입니다!</small></mark>");
				 }
			 }
		
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
				 	$("#passwordResult").html("<mark class='pull-right'><small class='smallerror'>비밀번호를 다시 확인해주세요!</small></mark>")
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
						 if(!result)
						 {
							 $("#emailResult").html("<mark class='pull-right'><small class='smallerror'>이미 사용 중인 이메일입니다!</small></mark>")
						 }
					 }
					 /* "error":function()
					 {
						 alert("실패");
					 } */
						
				});
				
				
			});
		 
		 
});
</script>



</head>


<header>
	
	<!--여기, 로그인 여부에 따라서 header가 달라진다.-->
 
		  <c:choose><%--SALIM 로고 -로그인 여부에 따라 다른 처리(링크의 유무) --%>
			<c:when test="${not empty sessionScope.login_info.memberId}">
				<h2 align="left" style="margin-left: 50px; margin-top: 40px">
					<a id="logo" href="${initParam.rootPath }/collection/findAllCollectionList.do"><font color="#ffffff">SALIM</font></a>
				</h2>
			</c:when>
			<c:otherwise>
				<h2 align="left" style="margin-left: 50px; margin-top: 40px">
					<a href="${initParam.rootPath }/main.do"><font color="#ffffff">SALIM</font></a>
				</h2>
			</c:otherwise>
		</c:choose>
		
		<!-- 로그인시 본인과 그룹 간을 이동할 수 있는 select박스 -->
		<form method="post" action="${initParam.rootPath }/collection/moving.do">
			<c:if test="${sessionScope.login_info != null }">
				<select id="selectInfo" onchange="form.submit()" name="selectId">
					<option value="${sessionScope.login_info}">개인</option>
					<c:forEach items="${sessionScope.groupList }" var="collection">
						<c:choose>
							<c:when test="${sessionScope.group_info.collectionId == collection.collectionId}">
								<option value=${collection.collectionId } selected="selected">${collection.collectionName }</option>
							</c:when>
							<c:otherwise>
								<option value="${collection.collectionId }">${collection.collectionName }</option>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
				</select>
			</c:if>
		</form>
	
	<div align="right" style="margin-right:30px">
			<c:choose>
			<c:when test='${sessionScope.login_info!=null}'>
				<a href="${initParam.rootPath}/myPage.do">마이페이지</a>&nbsp;&nbsp;
				<a href="${initParam.rootPath}/member/logout.do">로그아웃</a>
			
			</c:when>
			<c:otherwise>
				<a href="${initParam.rootPath}/loginMember.do" class="btn btn-success" role="button">로그인</a>&nbsp;&nbsp;
				<a href="${initParam.rootPath }/joinMember.do" class="btn btn-warning" role="button">회원가입</a>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			</c:otherwise>
		</c:choose>
		
		</div>
	
	
	
</header>





<body>


<div class="col-md-9 col-md-offset-3" style="padding-left: 4%; margin-top: 2%; padding-bottom: 2.2%">
<h2 style="padding-left: 17%; padding-bottom: 20px; padding-top: 10px">새 계정 만들기</h2>

<%-- <c:if test="${not empty requestScope.joinFail}">
	${requestScope.joinFail}
</c:if> --%>
<form class="form-horizontal" method="post" action="${initParam.rootPath}/member/join.do" method="POST">
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >아이디 입력</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="memberId" id="memberId" placeholder="salim" style="width: 40%">
      <p id="idResult" class="help-block" style="width: 40%"></p>
      
    </div>
  </div>
  <div class="form-group">
    <h4><label class="control-label col-sm-2" for="pwd">비밀번호 입력</label></h4>
    <div class="col-sm-10"> 
      <input type="password" class="form-control"  id="password" name="password" placeholder="********"  style="width: 40%">
     <font color="gray" style="width: 40%">8~20자의 영문 대/소문자,숫자,특수문자 혼용가능</font>
     <br><br>
    </div>

    <h4><label class="control-label col-sm-2" for="pwd">비밀번호 확인</label></h4>
    <div class="col-sm-10"> 
      <input type="password" class="form-control"  id="password2" name="password2" placeholder="비밀번호를 다시 입력해주세요." style="width: 40%">
      <p id="passwordResult" class="help-block" style="width: 40%"></p>
    </div>
  </div>
  
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >이름</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" name="name" placeholder="홍길동" style="width: 40%">
    </div>
  </div>
  
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >생일</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="birthday" name="birthday" placeholder="clik" style="width: 40%">
    </div>
  </div>
  
  <div class="form-group">
    <h4><label class="control-label col-sm-2" >나이</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="age" name="age" placeholder="생년월일 입력 시 자동으로 입력되오니 나이를 확인해주세요." style="width: 40%">
    </div>
  </div>
  
   <div class="form-group">
    <h4><label class="control-label col-sm-2" >이메일</label></h4>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="email" name="email" placeholder="salim@google.com" style="width: 40%">
      <font color="gray" style="width: 40%">이메일은 그룹 초대를 받을 때 사용될 수 있습니다.</font><p id="emailResult" class="help-block" style="width: 40%"></p>
    </div>
  </div>
 <c:if test="${not empty requestScope.joinFail}">
<div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div>
        <label class="help-block"><font color="red" >${requestScope.joinFail }</font></label>
      </div>
    </div>
  </div>
 </c:if>
  <div class="form-group" style="padding-bottom:30px"> 
    <div class="col-sm-offset-2 col-sm-10" >
      <button type="submit" class="btn btn-lg btn-success pull-right" style="margin-right: 60%; ">새 계정 만들기</button>
    </div>
  </div>
</form>

</div>



</body>




<footer>


<font style="color: white">
	살림프로젝트&nbsp;&nbsp;&nbsp;&nbsp;담당자: SALIM 팀&nbsp;&nbsp;&nbsp;&nbsp;
</font>

<a href="${initParam.rootPath }/inquiry.do">문의하기</a>

</footer>



</html>

