<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>가계부 환경설정 </h2><br>
<h3>- 권한자만 가계부 변경이 가능합니다 !</h3>
<form action="">
<table>
	<tr>
		<td>
			그룹 가계부명 
		</td>
		<td>
			<input type="text" id="collectionName" name="colletionName" value="${sessionScope.group_info.collectionName }">
		</td>
	</tr>
	<tr>
		<td>
		 	그룹 가계부 설명 
		</td>
		<td>
			<input type="text" id='collectionIntro' name="collectionIntro" value="${sessionScope.group_info.collectionIntro }">
		</td>
	</tr>
	
	<tr>
		<td> 
			그룹 가계부 권한자 &nbsp;
		</td>
		<td>
			<input type="text" id='grantId' name='grantId' value="${sessionScope.group_info.grantId}" >
		</td>
	</tr>
	<tr>	
		<td>
			<br>
		</td>
	</tr>
	<tr>
		<td colspan='2' align='right'> 
			<input type='submit' value='수정하기'>
		</td>
	<tr>
	
</table>
</form>
</body>
</html>