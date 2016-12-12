<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h3><font color='coral'>${sessionScope.login_info.memberId}님 환영합니다!</font></h3>

<table>
<tr>
	<td></td>
	<td>
		<h2><a href="${initParam.rootPath }/household/login/incomeSelect.do">개인 가계부</a></h2>
	</td>
</tr>
<tr>
	<td></td>
	<td>
	 	<h2>그룹 가계부</h2>
	</td>
	
</tr>
<tr>
	<td></td>
	<td></td>
	<th>
		<form action="${initParam.rootPath }/collection.do" method='get'>
			<input type='submit' value='그룹 가계부 추가'>
		</form>	
	</th>
</tr>
</table>
</body>
</html>