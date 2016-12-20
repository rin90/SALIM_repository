<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>


<script type="text/javascript" src="/SALIM_project/scripts/jquery.js"></script>
<script type="text/javascript">
var err;
$(document).ready(function(){
	$("#findIdBtn").on("click", function(){
		$("#result").empty();
		$("#sarea").empty();
		$.ajax({
			
			"url":"/SALIM_project/member/findId.do",
			"type":"post",
			"data" :"email="+$("#email").val(),
			"dataType":"JSON",
			"beforeSend":function(){
				
				if(!$("#email").val())
				{
					$("#sarea").html("<font color='red' size='2'>&nbsp;&nbsp;&nbsp;이메일을 입력하세요.<font>");
					return false;
				}
				
			},
			"success":function(object){
			
				var resultMemberId=object.id;
				var err=object.emailError;
				if(resultMemberId!=null)
				{	
					$("#result").html("<font color='blue' size='4'> 아이디는 "+resultMemberId+"입니다.</font>");
				}else
				{
					$("#result").html("");
				}
				
				if(err!=null)
				{
					$("#result").html("<font color='red' size='4'>"+err+"</font>");
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
  <h1>아이디를 잊으셨나요?</h1><br><br><br>
 <form action="${initParam.rootPath}/member/findId.do" method="post">
    <div class="form-group">
    
      <label for="email">계정 생성시 사용한 이메일 주소를 입력해주세요.&nbsp;&nbsp;&nbsp;&nbsp;</label>
      <input type="text" class="form-control" id="email" name="email" placeholder="salim@google.com">
    </div>
   
	<br>
    <button id="findIdBtn" type="submit" class="btn btn-lg btn-success pull-right">아이디 찾기</button>
    <div id="result">	
			</div>
    <br><br><br><br><br><br><br><br><br><br>
    <hr><div class="footer_left pull-left">Salim</div><div class="pull-right"><small>&copy; 2016-12.23 Salim.KOSTA</small></div>
 
  </form>
  
</div>
<%-- <form action="${initParam.rootPath}/member/findId.do" method="post"> --%>

<%--<table>
	<tr>
		<td>
			<h3>이메일 주소 입력</h3>
		</td>
		
	</tr>
	<tr>
		<td>
			<font color="gray">계정 생성시 사용한 이메일 주소를 입력해주세요.</font>
		</td>
	
	</tr>
	<tr>
		<td>
			<input type="text" class="form-control" id="email" name="email" placeholder="salim@google.com">
			
			
		</td>
		<td>
			<span id="sarea">
			</span>
		</td>
	</tr>

	<tr>
		<td align="right">
			<button id="findIdBtn" type="submit" class="btn btn-lg btn-success pull-right">아이디 찾기</button>
			
		<td>
	</tr>
	<tr>
		<td>
			<div id="result">	
			</div>
		</td>
	</tr>

</table> --%>

<%-- </form> --%>

</body>
</html>