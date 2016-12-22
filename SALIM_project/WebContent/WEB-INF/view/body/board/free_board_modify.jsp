<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="${initParam.rootPath }/lib/scripts/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#b").on("click",function(){
		var txt = "<input class='f' type='file'  value='����' name='fileRoot'><input  id='fc' class='f'  type='button' value='���� ���� ���'>"
			$("#b").hide();
			$("#t").html(txt);
	});							
	$("#t").on("click", "#fc", function() {
		$(".f").remove();
		$("#b").show();
	});																				
});
											

										

						

					
</script>

<form action="${initParam.rootPath }/free/login/update.do" method="post"
	enctype="multipart/form-data">
	
	<div class="col-md-8 col-md-offset-2">
	<h1>�����Խ��� �� �����ϱ�</h1>
	<hr>
	<label for="sel1">����</label>
	<input type="text" name="title" class="form-control"
		value="${requestScope.freeBoard.title }"><br>

	<c:if test="${requestScope.freeBoard.fileName != null }">
		<img
			src="${initParam.rootPath }/fileroute/${requestScope.freeBoard.fileName }">
	</c:if>
	<br> <input id="b" type="button" class="btn btn-default btn-md  pull-right" value="����÷�� ����">
	<div id="t"></div>
	<br>

	<textarea class="form-control" rows="10" name="content">${requestScope.freeBoard.content }</textarea>

	<br> <input type="hidden" name="memberId"
		value="${requestScope.freeBoard.memberId }"> <input
		type="hidden" name="page" value="${requestScope.page }"> <input
		type="hidden" name="no" value="${requestScope.freeBoard.no }">
	<input type="hidden" name="category" value="${requestScope.category }">
	<input type="hidden" name="search" value="${requestScope.search }">

	<br>
	<input type="submit" class="btn btn-success btn-md  pull-right" value="�����Ϸ�"> <a class="btn btn-danger btn-md  pull-left"
		href="${initParam.rootPath }/free/login/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">����</a>
</div>
</form>

<form action="${initParam.rootPath }/free/login/seleteDetail.do"
	method="post">
	<input type="hidden" name="page" value="${requestScope.page }">
	<input type="hidden" name="no" value="${requestScope.freeBoard.no }">
	<input type="hidden" name="category" value="${requestScope.category }">
	<input type="hidden" name="search" value="${requestScope.search }">
	<input type="submit"  class="btn btn-default btn-md  pull-right" value="�ڷ�">
</form>

<p />

<br><br>

