<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


  �˻� ����� �����ϴ�.
  
  <form action="${initParam.rootPath }/free/form.do">
		<input type="hidden" name="page"
			value="1"> &nbsp;&nbsp;&nbsp;<input
			type="submit" value="�۾���">
	</form>
	
		<form action="${initParam.rootPath }/free/keyword.do" method="post">
		<select name="category">
			
			<c:forEach items="${requestScope.codes }" var="code">
				<option>${code.code }</option>
			</c:forEach>
		</select> 
		
		<input type="hidden" name="page" value="1"> 
		<input type="text" name="search" value="${requestScope.search}"> <input type="submit" value="�˻�">
	</form>
</body>
</html>