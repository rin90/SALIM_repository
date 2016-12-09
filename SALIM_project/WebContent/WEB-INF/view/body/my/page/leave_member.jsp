<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#leaveBtn").on("click",function(){
		
	});
	
});
</script>
</head>
<body>
<h2>회원 탈퇴</h2>
<form action="${initParam.rootPath}/member/leave.do" onsubmit="return confirm('정말로 탈퇴하시겠습니까?')" method="post">
	
	<!-- 회원아이디로 요청파라미터로 hidden으로 보내고. -->
	<!-- id : <input type="text" name="memberId">
	password :<input type="text" name="password"> -->
	<input type="hidden" name="memberId" value='${sessionScope.login_info.memberId}'>
	<input type="submit" value="회원탈퇴" id='leaveBtn'>
	
</form>

</body>
</html>