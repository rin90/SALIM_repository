<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="/SALIM_project/lib/scripts/jquery.js"></script>

<script type="text/javascript">
	
</script>

	<form id="registerForm" action="${initParam.rootPath}/tip/login/register.do"
		method="post" enctype="multipart/form-data">
		<h4>Tip게시판</h4>
		제목:<input type="text" name=title>
		<select name="classification">
			<c:forEach items="${requestScope.codes }" var="code">
					<option>${code.code }</option>
			</c:forEach>
		</select>
		<br> 
		파일첨부:<input type="file" value="사진" name="fileRoot"><br>

		<textarea rows="10" cols="50" name="content"></textarea>

		<br>
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="hidden" name="memberId" value="${sessionScope.login_info.memberId }">
	
		<input type="submit" value="확인">
		
	</form>
	
	<form action="${initParam.rootPath }/tip/login/list.do" method="post">
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="submit" value="취소">
	</form>

