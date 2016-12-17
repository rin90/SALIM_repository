<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



  검색 결과가 없습니다.
  
  <form action="${initParam.rootPath }/free/login/form.do">
		<input type="hidden" name="page"value="1">
			 &nbsp;&nbsp;&nbsp;
			<input type="submit" value="글쓰기">
	</form>
	
		<form action="${initParam.rootPath }/free/login/keyword.do" method="post">
		<select name="category">
			
			<c:forEach items="${requestScope.codes }" var="code">
				<option>${code.code }</option>
			</c:forEach>
		</select> 
		
		<input type="hidden" name="page" value="1"> 
		<input type="text" name="search" value="${requestScope.search}"> <input type="submit" value="검색">
	</form>
