<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>그룹 가계부 추가</h2>

<form action="${initParam.rootPath }/collection/collection_add.do" method="post">
<table>
<tr>
	<td>
		가계부 이름
	</td>
</tr>
<tr>
	<td>
		<input type='text' name='collectionName' size='30'>
	</td>
</tr>
<tr><td><br></td></tr>
<tr>
	<td>
		가계부 설명
	</td>
</tr>
<tr>
	<td>
		<input type='text' name='collectionIntro' size='30'>
	</td>
</tr>
<tr><td><br></td></tr>
<tr>
	<td colspan='2' align=right>
		<input type='submit' value='추가하기'>
	</td>
</tr>
	
</table>
	
</form>

</body>
</html>