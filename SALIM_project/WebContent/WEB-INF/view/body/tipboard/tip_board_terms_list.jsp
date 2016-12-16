<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/SALIM_project/lib/scripts/jquery.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	${requestScope.category }
	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회</td>
				<td>좋아요</td>
			</tr>
		</thead>

		<tbody id="tbody">
			<!--  목록 뿌리기 -->
			<c:forEach items="${requestScope.list }" var="tipBoard">
				<tr>
					<td>${tipBoard.no }</td>
					<td><a
			href="${initParam.rootPath }/tip/seleteDetail.do?no=${tipBoard.no}&page=${requestScope.pageBean.page}&category=${requestScope.category}&search=${requestScope.search}">${tipBoard.title }</a></td>
					<td>${tipBoard.memberId }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${tipBoard.registerTime }" /></td>
					<td>${tipBoard.click }</td>
					<td>${tipBoard.good }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>



	<!-- 이전페이지 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.previousGroup }">
			<a
				href="${initParam.rootPath }/tip/keyword.do?page=${requestScope.pageBean.beginPage-1}&category=${requestScope.category}&Search=${requestScope.Search}">◀&nbsp;</a>
		</c:when>
		<c:otherwise>
					◀&nbsp;
				</c:otherwise>
	</c:choose>

	<!-- 페이지 뿌리기 -->
	<c:forEach begin="${requestScope.pageBean.beginPage }"
		end="${requestScope.pageBean.endPage }" var="page">
		<c:choose>
			<c:when test="${requestScope.pageBean.page == page }">
						[${page }]
			</c:when>
			<c:otherwise>
				<a 
		href="${initParam.rootPath }/tip/keyword.do?page=${page }&category=${requestScope.category}&search=${requestScope.search}">${page }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<!-- 다음페이지 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.nextGroup }">
			<a
				href="${initParam.rootPath }/tip/keyword.do?page=${requestScope.pageBean.endPage+1 }&category=${requestScope.category}&search=${requestScope.search}">&nbsp;▶</a>
		</c:when>
		<c:otherwise>
					&nbsp;▶				
				</c:otherwise>
	</c:choose>

	<form action="${initParam.rootPath }/form.do">
		<input type="hidden" name="page"
			value="${requestScope.pageBean.page }"> &nbsp;&nbsp;&nbsp;<input
			type="submit" value="글쓰기">
	</form>

	<p />

	<form action="${initParam.rootPath }/tip/keyword.do" method="post">
		<select name="category">
			
			<c:forEach items="${requestScope.codes }" var="code">
				<option>${code.code }</option>
			</c:forEach>
		</select> <input type="hidden" name="page" value="1"> <input
			type="text" name="search" value="${requestScope.search}"> <input type="submit" value="검색">
	</form>
		
</body>
</html>