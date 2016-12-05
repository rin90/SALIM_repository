<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>마이페이지</h2>
<br>

ID : ${sessionScope.login_info.memberId }<br>
이름 : ${sessionScope.login_info.name }<br>
나이: ${sessionScope.login_info.age }<br>
생년월일 :${sessionScope.login_info.birthday }<br>
이메일 :${sessionScope.login_info.email}<br>


</body>
</html>