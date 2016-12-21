<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="${initParam.rootPath }/lib/scripts/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#b").on("click",function(){
		var txt = "<input class='f' type='file'  value='사진' name='fileRoot'><input  id='fc' class='f'  type='button' value='파일 수정 취소'>"
			$("#b").hide();
			$("#t").html(txt);
			$
	});							
	$("#t").on("click", "#fc", function() {
		$(".f").hide();
		$("#b").show();
	});																				
});
											

										

						

					
</script>

<form action="${initParam.rootPath }/free/login/update.do" method="post"
	enctype="multipart/form-data">
	<h4>자유게시판</h4>
	제목:<input type="text" name="title"
		value="${requestScope.freeBoard.title }"><br>

	<c:if test="${requestScope.freeBoard.fileName != null }">
		<img
			src="${initParam.rootPath }/fileroute/${requestScope.freeBoard.fileName }">
	</c:if>
	<br> <input id="b" type="button" value="파일첨부 수정">
	<div id="t"></div>
	<br>

	<textarea rows="10" cols="50" name="content">${requestScope.freeBoard.content }</textarea>

	<br> <input type="hidden" name="memberId"
		value="${requestScope.freeBoard.memberId }"> <input
		type="hidden" name="page" value="${requestScope.page }"> <input
		type="hidden" name="no" value="${requestScope.freeBoard.no }">
	<input type="hidden" name="category" value="${requestScope.category }">
	<input type="hidden" name="search" value="${requestScope.search }">


	<input type="submit" value="수정완료"> <a
		href="${initParam.rootPath }/free/login/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">삭제</a>
</form>
<p />


<form action="${initParam.rootPath }/free/login/seleteDetail.do"
	method="post">
	<input type="hidden" name="page" value="${requestScope.page }">
	<input type="hidden" name="no" value="${requestScope.freeBoard.no }">
	<input type="hidden" name="category" value="${requestScope.category }">
	<input type="hidden" name="search" value="${requestScope.search }">
	<input type="submit" value="뒤로">
</form>

