<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>


<script type="text/javascript" src="${initParam.rootPath }/scripts/jquery.js"></script>
<script type="text/javascript">
var err;
$(document).ready(function(){
	$("#emailBtn").on("click", function(){
		$("#sarea").empty();
		$("#sarea2").empty();
		$("#result").empty();
		
		$.ajax({
			"url":"${initParam.rootPath}/member/findPassword.do",
			"type":"post",
			"data":{"id":$('#id').val(),"email":$('#email').val()},
			"dataType":"JSON",
			"beforeSend":function(){
				
				if(!$("#id").val())
				{
					$("#sarea").html("<font color='red' size='2'>아이디를 입력하세요.<font>");
					if(!$("#email").val())
					{	
						$("#sarea2").html("<font color='red' size='2'>이메일을 입력하세요.<font>");
						
					}
					return false;
					
				}else
				{
					if(!$("#email").val())
					{	
						$("#sarea2").html("<font color='red' size='2'>이메일을 입력하세요.<font>");
						return false;
					}
					
				}
				
			},
			"success":function(object){
				
				var resultPassword=object.password;
				var errId=object.idError;
				var errEmail=object.emailError;
				
				if(resultPassword!=null)
				{	
					alert("비밀번호 4자리 : "+resultPassword);
					$("#result").html("<font color='blue' size='4'> 비밀번호는 "+resultPassword+"입니다.</font>");
					
				}else /* 결과 비밀번호가 null인 경우?  */
				{
					$("#result").html("");
					
				}
				if(errId!=null)
				{
					$("#result").html("<font color='red' size='4'>"+errId+"</font>");
					
				}
				if(errEmail!=null)
				{
					$("#result").html("<font color='red' size='4'>"+errEmail+"</font>");
				
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
</head>
<body>
<div class="col-md-8 col-md-offset-2"><br><br>
  <h1>비밀번호를 잊으셨나요?</h1><br><br><br>
 
    <div class="form-group">
    
      <label for="email">계정 생성시 사용한 아이디를 입력해주세요.&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" class="form-control" name="id" id="id" placeholder="salim">
    </div>
    <br>
    <div class="form-group">
      <label for="pwd">계정 생성시 사용한 이메일을 입력해주세요.&nbsp;&nbsp;</label>      
      <input type="password" class="form-control" name="email" id="email" placeholder="salim@google.com">
    </div>
    
    <hr>
    
		<br>
    <button type="submit" class="btn btn-lg btn-success pull-right">비밀번호 찾기</button>
    
    <br><br><br><br><br><br><br><br><br><br>
    <hr><div class="footer_left pull-left">Salim</div><div class="pull-right"><small>&copy; 2016-12.23 Salim.KOSTA</small></div>
 

  
</div>
<%-- <h2>비밀번호를 잊으셨나요?</h2>
<form action="${initParam.rootPath}/member/findPassword.do" method="post">
<table>
	<tr>
		<td>
			<h3>아이디 입력</h3>
		</td>
		
	</tr>
	<tr>
		<td>
			<font color="gray">계정 생성시 사용한 아이디를 입력해주세요.</font>
		</td>
	
	</tr>
	<tr>
		<td>
			<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --><input type="text" name="id" id="id" size="70" >
		</td>
		<td>
			
			<div id="sarea">
			</div>
			
		
		</td>
	</tr>
	<tr>
		<td>
			<h3>이메일 입력</h3>
		</td>
		
	</tr>
	<tr>
		<td>
			<font color="gray">계정 생성시 사용한 이메일을 입력해주세요.</font>
		</td>
	
	</tr>
	<tr>
		<td>
			<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --><input type="text" name="email" id="email" size="70" >
		</td>
		<td>
			<span id="sarea2">
			</span>
			
		</td>
		
	</tr>

	<tr>
		<td align="right">
			<button id="emailBtn">비밀번호 찾기</button>
		<td>
	</tr>
	<tr>
		<td>
			<div id="result">	
			
			</div>
		</td>
	</tr>

</table> --%>
<!-- </form> -->

</body>
</html>