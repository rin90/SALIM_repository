<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="/SALIM_project/lib/scripts/jquery.js"></script>

<script type="text/javascript">
	
</script>


	<form id="registerForm" action="${initParam.rootPath}/tip/login/update.do"
		method="post" enctype="multipart/form-data">
		<h4>Tip게시판</h4>
		
		제목:<input type="text" name="title" value="${requestScope.tipBoard.title}">
		
		<select name="classification">
			<c:forEach items="${requestScope.codes }" var="code">
					<option>${code.code }</option>
			</c:forEach>
		</select>
		
		<br> 
		파일첨부:<input type="file" value="사진" name="fileRoot">${requestScope.tipBoard.fileRoot }<br>
		
		<textarea rows="10" cols="50" name="content">${requestScope.tipBoard.content }</textarea>
		
		내용 :${requestScope.search }  카테고리 ${requestScope.category }
		
		<br>
		<input type="hidden" name="no" value="${requestScope.tipBoard.no }">
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="hidden" name="search" value="${requestScope.search }">
		<input type="hidden" name="category" value="${requestScope.category }">
		
		<input type="submit" value="수정완료">
	</form>
	
	<form action="${initParam.rootPath }/tip/login/seleteDetail.do" method="post">
		 <a href="${initParam.rootPath }/tip/login/delete.do?no=${requestScope.tipBoard.no }&page=${requestScope.page}">삭제</a>
		<input type="hidden" name="search" value="${requestScope.search }">
		<input type="hidden" name="category" value="${requestScope.category }">
		<input type="hidden" name="no" value="${requestScope.tipBoard.no }">
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="submit" value="뒤로">
	</form>
	
