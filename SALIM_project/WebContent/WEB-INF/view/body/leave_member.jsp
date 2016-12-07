<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 탈퇴</h2>
<form action="${initParam.rootPath}/member/leave.do" method="post">
	id : <input type="text" name="memberId">
	password :<input type="text" name="password">
	<input type="submit" value="회원탈퇴">
</form>

</body>
</html>