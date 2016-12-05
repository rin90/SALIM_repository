<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<script type="text/javascript" src="/SALIM_project/lib/scripts/jquery.js"></script>
<script type="text/javascript">


</script>

</head>
<body>

	<table border="1">
		<thead>
			<tr>
				<td>��ȣ</td>
				<td>����</td>
				<td>�ۼ���</td>
				<td>�ۼ���</td>
				<td>��ȸ</td>
				<td>���ƿ�</td>
			</tr>
		</thead>
		
		<tbody id="tbody">
			<!--  ��� �Ѹ��� -->
			<c:forEach items="${requestScope.list }" var="freeBoard">
				<tr>
					<td>${freeBoard.no }</td>
					<td><a href="${initParam.rootPath }/free/seleteDetail.do?no=${freeBoard.no}&page=${requestScope.pageBean.page}">${freeBoard.title }</a></td>
					<td>${freeBoard.memberId }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${freeBoard.registerTime }"/></td>
					<td>${freeBoard.click }</td>
					<td>${freeBoard.good }</td>
				</tr>
			</c:forEach>
			
		</tbody>	
	</table>
			
			
			
			<!-- ���������� -->
			<c:choose>
				<c:when test="${requestScope.pageBean.previousGroup }">
					<a href="${initParam.rootPath }/free/list.do?page=${requestScope.pageBean.beginPage-1}">��&nbsp;</a>
				</c:when>
				<c:otherwise>
					��&nbsp;
				</c:otherwise>
			</c:choose>
			
			<!-- ������ �Ѹ��� -->
			<c:forEach begin="${requestScope.pageBean.beginPage }" end="${requestScope.pageBean.endPage }" var="page">
				<c:choose>
					<c:when test="${requestScope.pageBean.page == page }">
						[${page }]
					</c:when>
					<c:otherwise>
						<a href="${initParam.rootPath }/free/list.do?page=${page }">${page }</a>				
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- ���������� -->
			<c:choose>
				<c:when test="${requestScope.pageBean.nextGroup }">
					<a href="${initParam.rootPath }/free/list.do?page=${requestScope.pageBean.endPage+1 }">&nbsp;��</a>
				</c:when>
				<c:otherwise>
					&nbsp;��				
				</c:otherwise>
			</c:choose>
			
			<form action="${initParam.rootPath }/free/form.do">
			<input type="hidden" name="page" value="${requestScope.pageBean.page }">
			&nbsp;&nbsp;&nbsp;<input type="submit" value="�۾���">
			</form>
			
			<p/>
			
			<form action="${initParam.rootPath }/free/keyword.do" method="post">
			<select name="category">				
				<c:forEach items="${requestScope.codes }" var="code">
					<option>${code.code }</option> 					
				</c:forEach>
			</select>   
			<input type="hidden" name="page" value="1">
			<input type="text" name="content"> <input type="submit" value="�˻�"> 
			</form>


		

</body>
</html>