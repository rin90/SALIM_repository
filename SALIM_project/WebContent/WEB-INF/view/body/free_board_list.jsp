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
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회</td>
				<td>좋아요</td>
			</tr>
		</thead>
		
		<tbody>
			<!--  목록 뿌리기 -->
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
			
			
			
			<!-- 이전페이지 -->
			<c:choose>
				<c:when test="${requestScope.pageBean.previousGroup }">
					<a href="${initParam.rootPath }/free/list.do?page=${requestScope.pageBean.beginPage-1}">◀&nbsp;</a>
				</c:when>
				<c:otherwise>
					◀&nbsp;
				</c:otherwise>
			</c:choose>
			
			<!-- 페이지 뿌리기 -->
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
			<!-- 다음페이지 -->
			<c:choose>
				<c:when test="${requestScope.pageBean.nextGroup }">
					<a href="${initParam.rootPath }/free/list.do?page=${requestScope.pageBean.endPage+1 }">&nbsp;▶</a>
				</c:when>
				<c:otherwise>
					&nbsp;▶				
				</c:otherwise>
			</c:choose>
			
		

</body>
</html>