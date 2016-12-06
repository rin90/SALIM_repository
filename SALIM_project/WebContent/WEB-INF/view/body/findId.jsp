<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/jQuery_class/scripts/jquery.js"></script>
<script type="text/javascript">
var err;
$(document).ready(function(){
	$("#findIdBtn").on("click", function(){
		
		$.ajax({
			
			"url":"/SALIM_project/member/findId.do",
			"type":"post",
			"data" :"email="+$("#email").val(),
			"dataType":"JSON",
			"beforeSend":function(){
				
				if(!$("#email").val())
				{
					$("#sarea").html("<font color='red' size='2'>이메일을 입력하세요.<font>");
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

<h2>아이디를 잊으셨나요?</h2>
<%-- <form action="${initParam.rootPath}/member/findId.do" method="post"> --%>
<table>
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
			<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --><input type="text" name="email" id="email" size="70" >
		</td>
	</tr>
	<tr>
		<td>
			<div id="sarea">
			</div>
		</td>
	</tr>
	<tr>
		<td align="right">
			<button id="findIdBtn">아이디 찾기</button>
		<td>
	</tr>
	<tr>
		<td>
			<div id="result">	
			</div>
		</td>
	</tr>

</table>
<%-- </form> --%>

</body>
</html>