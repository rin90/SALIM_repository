<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function messageKeep()
{
	
	 alert($("#emailMessage").val());
	 //keepMessage=$("#emailMessage").val();
}

function emailClick()
{
	var keepMessage=window.document.getElementsByClassName("emailMessage");
	var m=keepMessage.value;
	alert(m+"초대장을 보냈습니다.");
}

</script>
</head>
<body>
<h2>멤버 초대하기</h2>

<form action="${initParam.rootPath }/collection/inviteMember.do" method="post">
<table>
<tr>
	<td>
	<h3>멤버 이메일 입력</h3>
	</td>
</tr>
<tr>
	<td>
		<input type="text" name="email" class='emailMessage' onblur="messageKeep();">&nbsp;&nbsp;
	</td>
	<td>
		<input type="submit" value="초대하기" onclick="emailClick();" >
	</td>
</tr>


</table>

</form>
</body>
</html>