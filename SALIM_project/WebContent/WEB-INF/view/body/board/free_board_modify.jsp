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
		<h4>자유게시판</h4>
		 제목:<input type="text" name="title" value="${requestScope.freeBoard.title }"><br> 

		파일첨부:<input type="file" value="사진" name="fileRoot">${requestScope.freeBoard.fileRoot }<br>

		<textarea rows="10" cols="50" name="content">${requestScope.freeBoard.content }</textarea>

		<br> 
		<input type="hidden" name="memberId" value="${requestScope.freeBoard.memberId }"> 
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="hidden" name="no" value="${requestScope.freeBoard.no }">
		<input type="submit" value="수정완료">
	
		 <a href="${initParam.rootPath }/free/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">삭제</a>
	</form>
		<p/>
	
	
	<form action="${initParam.rootPath }/free/list.do" method="post">
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="submit" value="취소">
	</form>
	
</body>
</html>