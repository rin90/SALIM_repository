<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript"
	src="/SALIM_project/lib/scripts/jquery.js"></script>
<script type="text/javascript">
	
</script>

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
			<c:forEach items="${requestScope.list }" var="freeBoard">
				<tr>
					<td>${freeBoard.no }</td>
					<td><a
			href="${initParam.rootPath }/free/login/seleteDetail.do?no=${freeBoard.no}&page=${requestScope.pageBean.page}&category=${requestScope.category}&search=${requestScope.search}">${freeBoard.title }</a></td>
					<td>${freeBoard.memberId }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${freeBoard.registerTime }" /></td>
					<td>${freeBoard.click }</td>
					<td>${freeBoard.good }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>



	<!-- 이전페이지 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.previousGroup }">
			<a
				href="${initParam.rootPath }/free/login/keyword.do?page=${requestScope.pageBean.beginPage-1}&category=${requestScope.category}&Search=${requestScope.Search}">◀&nbsp;</a>
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
		href="${initParam.rootPath }/free/login/keyword.do?page=${page }&category=${requestScope.category}&search=${requestScope.search}">${page }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<!-- 다음페이지 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.nextGroup }">
			<a
				href="${initParam.rootPath }/free/login/keyword.do?page=${requestScope.pageBean.endPage+1 }&category=${requestScope.category}&search=${requestScope.search}">&nbsp;▶</a>
		</c:when>
		<c:otherwise>
					&nbsp;▶				
				</c:otherwise>
	</c:choose>

	<form action="${initParam.rootPath }/free/login/form.do">
		<input type="hidden" name="page"
			value="${requestScope.pageBean.page }"> &nbsp;&nbsp;&nbsp;<input
			type="submit" value="글쓰기">
	</form>

	<p />

	<form action="${initParam.rootPath }/free/login/keyword.do" method="post">
		<select name="category">
			<c:forEach items="${requestScope.codes }" var="code">
				<c:choose>
					<c:when test="${requestScope.category == code.code }">
						<option selected="selected">${code.code }</option>					
					</c:when>	
					<c:otherwise>					
						<option>${code.code }</option>
					</c:otherwise>
				</c:choose>	
			</c:forEach>
		</select> <input type="hidden" name="page" value="1"> 
		<input type="text" name="search" value="${requestScope.search}"> <input type="submit" value="검색">
	</form>
		
