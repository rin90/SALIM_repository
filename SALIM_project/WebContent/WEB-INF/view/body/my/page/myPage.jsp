<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript"
	src="${initParam.rootPath }/script/jquery.js"></script>

<style type="text/css">
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}

td, th {
	padding: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-8 ">
				<div class="colspan" style="margin-top: 50px; margin-bottom: 50px;">
					<h2>마이페이지</h2>
				</div>
				<br>
				<table class="table table-bordered">
					<tr>
					<td>
						<div class="col-md-offset-1"><h4>ID</h4></div>
					</td>
						<td><div class="col-md-offset-1"><h4>${sessionScope.login_info.memberId }</h4></div></td>
					</tr>
					<tr>
						<td><div class="col-md-offset-1"><h4>Password</h4></div></td>
						<td><div class="col-md-offset-1"><h4>${sessionScope.login_info.password }</h4></div></td>
					</tr>
					<tr>
						<td><div class="col-md-offset-1"><h4>이름</h4></div></td>
						<td><div class="col-md-offset-1"><h4>${sessionScope.login_info.name }</h4></div></td>
					</tr>
					<tr>
						<td><div class="col-md-offset-1"><h4>생년월일</h4></div></td>
						<td><div class="col-md-offset-1"><h4><fmt:formatDate
								value="${sessionScope.login_info.birthday}"
								pattern="yyyy년 MM월 dd일 " /></h4></div></td>
					</tr>
					<tr>
						<td><div class="col-md-offset-1"><h4>나이</h4></div></td>
						<td><div class="col-md-offset-1"><h4>만 ${sessionScope.login_info.age }세</h4></div></td>
					</tr>
					<tr>
						<td><div class="col-md-offset-1"><h4>이메일</h4></div></td>
						<td><div class="col-md-offset-1"><h4>${sessionScope.login_info.email}</h4></div></td>
					</tr>


				</table>
			</div>
		</div>
	</div>
</body>
</html>