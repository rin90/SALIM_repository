<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<script type="text/javascript" src="/SALIM_project/lib/scripts/jquery.js"></script>
<script type="text/javascript">

</script>


	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
		</thead>
		
		<tbody id="tbody">
			<!--  목록 뿌리기 -->
		
			<c:forEach items="${requestScope.list }" var="freeBoard">
				<tr>
					<td>${freeBoard.no }</td>
					<td><a 
					href="${initParam.rootPath }/free/login/seleteDetail.do?no=${freeBoard.no}&page=${requestScope.pageBean.page}&category=${requestScope.category}">${freeBoard.title }</a></td>
					<td>${freeBoard.memberId }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${freeBoard.registerTime }"/></td>
					<td>${freeBoard.click }</td>
				</tr>
			</c:forEach>
			
		</tbody>	
	</table>
			
			
			
			<!-- 이전페이지 -->
			<c:choose>
				<c:when test="${requestScope.pageBean.previousGroup }">
					<a href="${initParam.rootPath }/free/login/list.do?page=${requestScope.pageBean.beginPage-1}">◀&nbsp;</a>
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
						<a href="${initParam.rootPath }/free/login/list.do?page=${page }">${page }</a>				
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음페이지 -->
			<c:choose>
				<c:when test="${requestScope.pageBean.nextGroup }">
					<a href="${initParam.rootPath }/free/login/list.do?page=${requestScope.pageBean.endPage+1 }">&nbsp;▶</a>
				</c:when>
				<c:otherwise>
					&nbsp;▶				
				</c:otherwise>
			</c:choose>
			
			<form action="${initParam.rootPath }/free/login/form.do">
			<input type="hidden" name="page" value="${requestScope.pageBean.page }">
			&nbsp;&nbsp;&nbsp;<input type="submit" value="글쓰기">
			</form>
			
			<p/>
		
			<form  action="${initParam.rootPath }/free/login/keyword.do" method="post">
			<select name="category">				
				<c:forEach items="${requestScope.codes }" var="code">
					<option>${code.code }</option> 					
				</c:forEach>
			</select>   
			<input type="hidden" name="page" value="1">
			<input type="text" name="search"> <input class="btn btn-info btn-sm" type="submit" value="검색"> 
			</form>


		
