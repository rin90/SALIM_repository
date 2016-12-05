<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>로그인</h2>
<form action="${initParam.rootPath}/member/login.do ">
	Id : <input type="text" name="memberId"> &nbsp;&nbsp;
	Password : <input type="text" name="password">&nbsp;&nbsp;
	<input type="submit" value="로그인"> 
</form>
</body>
</html>