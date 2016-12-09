<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/script/jquery.js"></script>

<style type="text/css">
table, td, th{
	border: 1px solid black;
	border-collapse: collapse;
}
td, th{
	padding: 5px;
}
</style>
</head>
<body>

<h2>마이페이지</h2>
<br>
<table>
	<tr>
		<td>ID</td>
		<td>${sessionScope.login_info.memberId }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${sessionScope.login_info.name }</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>${sessionScope.login_info.age }</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>
			<fmt:formatDate value="${sessionScope.login_info.birthday}" pattern="yyyy년 MM월 dd일 "/>
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${sessionScope.login_info.email}</td>
	</tr>
	

</table>


</body>
</html>