<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>

	<form action="${initParam.rootPath }/free/update.do" method="post">
		<h4>�����Խ���</h4>
		 ����:<input type="text" name="title" value="${requestScope.freeboard.title }"><br> 

		����÷��:<input type="file" value="����" name="fileRoot">${requestScope.freeboard.fileRoot }<br>

		<textarea rows="10" cols="50" name="content">${requestScope.freeboard.content }</textarea>

		<br> <input type="hidden" name="memberId" value="${requestScope.freeboard.memberId }"> 
		<input type="submit" value="�����Ϸ�"> <a href="${initParam.rootPath }/free/delete.do?page=${requestScope.page}&no=${requestScope.freeboard.no}">����</a>
	</form>
		<p/>
	
	
	<form action="${initParam.rootPath }/free/list.do" method="post">
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="submit" value="���">
	</form>
	
</body>
</html>