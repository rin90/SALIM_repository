<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<div class="container" align="center" style="font-size: 120%">
	<br>
 	 <h1>�� ã��</h1>
 	 <hr>
 	 <a class="btn btn-md btn-default  pull-right" href="${initParam.rootPath }/free/login/form.do?page=1">�۾���</a><br><br>

	<table class="table table-condensed">
		<thead>
			 <tr class="info">
				<td>��ȣ</td>
				<td>����</td>
				<td>�ۼ���</td>
				<td>�ۼ���</td>
				<td>��ȸ</td>
			</tr>
		</thead>
		<tbody id="tbody">
			
			<c:choose>
				<c:when test="${empty requestScope.category }">
					<tr align="center">
						<td align="center" colspan="5">��ϵ� ���� �����ϴ�.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr align="center">
						<td align="center" colspan="5">�˻�����������ϴ�.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
		</tbody>
	</table>

</div>




<div align="center">
	<form action="${initParam.rootPath }/free/login/keyword.do" method="post">
	&nbsp;&nbsp;&nbsp;<table>
		<tr>
		   <th>&nbsp;&nbsp;</th>
		   <td>
			<select name="category" class="btn btn-default dropdown-toggle">
			<c:forEach items="${requestScope.codes }" var="code">
				<option>${code.code }</option>
			</c:forEach>
		    </select> <input type="hidden" name="page" value="1"> 
		</td>
		<td>&nbsp;&nbsp;&nbsp;</td>
			<td>
			<input type="text" name="search" class="form-control">
			</td>
			<td>&nbsp;&nbsp;</td>
			<td>
			<button type="submit" class="btn btn-info">
     	 <span class="glyphicon glyphicon-search"></span> Search
		</button>
			</td>
		</table>
		
	</form>
</div>