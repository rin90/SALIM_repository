<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table>
		<thead>
			<tr>
				<td>����</td>
				<td>�ۼ���</td>
				<td>�ۼ���</td>
				<td>��ȸ</td>
				<td>���ƿ�</td>
			</tr>
		</thead>
		
		<tbody>
			<!--  ��� �Ѹ��� -->
			<c:forEach items="${requestScope.list }" var="freeBoard">
				<tr>
					<td>${freeBoard.no }${freeBoard.title }</td>
					<td>${freeBoard.memberId }</td>
					<td>${freeBoard.registerTime }</td>
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
			
		

</body>
</html>