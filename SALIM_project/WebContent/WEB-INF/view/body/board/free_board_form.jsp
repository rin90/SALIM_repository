<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="/SALIM_project/lib/scripts/jquery.js"></script>
	
<script type="text/javascript">
	
</script>

<style type="text/css">
.errorMessage{
	font-size: 12px;
	color: red
}

</style>
<div class="col-md-8 col-md-offset-2">
	<h1>�����Խ��� �� �ۼ��ϱ�</h1>
	<hr>
	&nbsp;&nbsp;&nbsp;<p><font color="gray">���� ����ϴ� ���� �Ⱦ��! :( </font></p>
	<hr><br>
	<form id="registerForm" action="${initParam.rootPath}/free/login/register.do" method="post" enctype="multipart/form-data">

		
	 		<label for="sel1">�� ����</label><input type="text"class="form-control" name="title"><br><div class="errorMessage"><form:errors path="freeBoard.title" /></div>
		
		<br>	
		<label for="sel1">���� ÷��</label><input type="file" value="����" name="fileRoot"><br>

		<textarea class="form-control" rows="10"  name="content"></textarea><div class="errorMessage"><form:errors path="freeBoard.content" /></div>
		
			<input type="hidden" name="page" value="${requestScope.page }">
			<input type="hidden" name="memberId" value="${sessionScope.login_info.memberId }"> 
			<br><input type="submit" value="���" class="btn btn-success btn-md  pull-right">
			
	</form>

	<form action="${initParam.rootPath }/free/login/list.do" method="post">
		<input type="hidden" name="page" value="${requestScope.page }">
		<input type="submit" value="���" class="btn btn-danger btn-md  pull-left">
	</form>
</div>
