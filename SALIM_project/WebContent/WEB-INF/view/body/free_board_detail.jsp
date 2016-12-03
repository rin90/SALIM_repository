<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.rootPath }/free/list.do" method="post">
		${requestScope.freeBoard.title } &nbsp;&nbsp;&nbsp;${requestScope.freeBoard.registerTime }	
	<hr>
		${requestScope.freeBoard.memberId } &nbsp;&nbsp;&nbsp; ${requestScope.freeBoard.fileRoot }
		<p/>
		${requestScope.freeBoard.content }
		<p/>
		${requestScope.commentTotal }&nbsp;&nbsp;${requestScope.click }
		<hr>
			<p/>
			<input type="hidden" name="page" value="${requestScope.page }">
			<input type="submit" value="목록">
</form>
			<a href="${initParam.rootPath }/free/updateForm.do?page=${requestScope.page}&no=${requestScope.freeBoard.no}">수정</a> &nbsp;&nbsp;
			<a href="${initParam.rootPath }/free/delete.do?page=${requestScope.page}&no=${requestScope.freeBoard.no}">삭제</a>	<p/>
			
<form action="${initParam.rootPath }/free/comment.do" method="post">
	★&nbsp;&nbsp;<textarea rows="2" cols="10"></textarea>
	<input type="submit" value="등록">
</form>







</body>
</html>