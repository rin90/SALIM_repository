<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<form action="${initParam.rootPath }/free/update.do" method="post" enctype="multipart/form-data">
		<h4>�����Խ���</h4>
		 ����:<input type="text" name="title" value="${requestScope.freeBoard.title }"><br> 

		����÷��:<input type="file" value="����" name="fileRoot" src="${requestScope.freeBoard.fileName }"><br>
		<img src="${initParam.rootPath }/fileroute/${requestScope.freeBoard.fileName }"><br>
		<textarea rows="10" cols="50" name="content">${requestScope.freeBoard.content }</textarea>

		<br> 
		<input type="hidden" name="memberId" value="${requestScope.freeBoard.memberId }"> 
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="hidden" name="no" value="${requestScope.freeBoard.no }">
		<input type="hidden" name="category" value="${requestScope.category }">
		<input type="hidden" name="search" value="${requestScope.search }">
		

		<input type="submit" value="�����Ϸ�">

	
		 <a href="${initParam.rootPath }/free/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">����</a>
	</form>
		<p/>
	
	
	<form action="${initParam.rootPath }/free/seleteDetail.do" method="post">
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="hidden" name="no" value="${requestScope.freeBoard.no }">
		<input type="hidden" name="category" value="${requestScope.category }">
		<input type="hidden" name="search" value="${requestScope.search }">
		<input type="submit" value="�ڷ�">
	</form>
	
