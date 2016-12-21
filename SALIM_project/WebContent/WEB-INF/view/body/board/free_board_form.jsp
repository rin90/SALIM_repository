<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript" src="/SALIM_project/lib/scripts/jquery.js"></script>
	
<script type="text/javascript">
	
</script>

<style type="text/css">
.errorMessage{
	font-size: 12px;
	color: red
}

</style>

	<h4>자유게시판</h4>
	<form id="registerForm" action="${initParam.rootPath}/free/login/register.do"
		method="post" enctype="multipart/form-data">

		
	 	제목:<input type="text" name="title"><br> <div class="errorMessage"><form:errors path="freeBoard.title" /></div>

		파일첨부:<input type="file" value="사진" name="fileRoot"><br>

		<textarea rows="10" cols="50" name="content"></textarea><div class="errorMessage"><form:errors path="freeBoard.content" /></div>
		
		<br>
			<input type="hidden" name="page" value="${requestScope.page }">
			<input type="hidden" name="memberId" value="${sessionScope.login_info.memberId }"> 
			<input type="submit" value="확인">
			
	</form>
	
	<form action="${initParam.rootPath }/free/login/list.do" method="post">
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="submit" value="취소">
	</form>

