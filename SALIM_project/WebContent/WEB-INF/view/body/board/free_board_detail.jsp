<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="${initParam.rootPath }/free/list.do" method="post">
		${requestScope.freeBoard.title } &nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${requestScope.freeBoard.registerTime }"/>	
	<hr>
		${requestScope.freeBoard.memberId } &nbsp;&nbsp;&nbsp; ${requestScope.freeBoard.fileRoot }
		<p/>
		${requestScope.freeBoard.content }
		<p/>
		댓글 &nbsp;${requestScope.commentTotal }&nbsp;&nbsp;조회&nbsp;${requestScope.freeBoard.click }&nbsp;&nbsp; 
		<a href="${initParam.rootPath }/free/good.do?no=${requestScope.freeBoard.no}">좋아요 </a>&nbsp;${requestScope.freeBoard.good }
		<hr>
			<p/>
			<input type="hidden" name="page" value="${requestScope.page }">
			<input type="submit" value="목록">
</form>
			<a href="${initParam.rootPath }/free/updateForm.do?page=${requestScope.page}&no=${requestScope.freeBoard.no}">수정</a> &nbsp;&nbsp;
			 <a href="${initParam.rootPath }/free/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">삭제</a>	<p/>
			
<form action="${initParam.rootPath }/free/comment.do" method="post">
	★&nbsp;&nbsp;<textarea rows="2" cols="10"></textarea>
	<input type="submit" value="등록">
</form>







</body>
</html>