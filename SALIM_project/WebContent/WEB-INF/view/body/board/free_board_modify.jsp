<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<form action="${initParam.rootPath }/free/update.do" method="post" enctype="multipart/form-data">
		<h4>자유게시판</h4>
		 제목:<input type="text" name="title" value="${requestScope.freeBoard.title }"><br> 

		파일첨부:<input type="file" value="사진" name="fileRoot" src="${requestScope.freeBoard.fileName }"><br>
		<img src="${initParam.rootPath }/fileroute/${requestScope.freeBoard.fileName }"><br>
		<textarea rows="10" cols="50" name="content">${requestScope.freeBoard.content }</textarea>

		<br> 
		<input type="hidden" name="memberId" value="${requestScope.freeBoard.memberId }"> 
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="hidden" name="no" value="${requestScope.freeBoard.no }">
		<input type="hidden" name="category" value="${requestScope.category }">
		<input type="hidden" name="search" value="${requestScope.search }">
		

		<input type="submit" value="수정완료">

	
		 <a href="${initParam.rootPath }/free/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">삭제</a>
	</form>
		<p/>
	
	
	<form action="${initParam.rootPath }/free/seleteDetail.do" method="post">
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="hidden" name="no" value="${requestScope.freeBoard.no }">
		<input type="hidden" name="category" value="${requestScope.category }">
		<input type="hidden" name="search" value="${requestScope.search }">
		<input type="submit" value="뒤로">
	</form>
	
