<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="/SALIM_project/lib/scripts/jquery.js"></script>

<script type="text/javascript">
	
</script>
<div class="container">
<br>
  <h1>자유게시판</h1>
  &nbsp;&nbsp;&nbsp;<p><font color="gray">자유롭게 발자취를 남겨보아요! :D </font></p>
  <a class="btn btn-md btn-default  pull-right" href="${initParam.rootPath }/free/login/form.do?page=${requestScope.pageBean.page}">글쓰기</a>
<br>
<div>
<br>
	<table class="table table-condensed">
		<thead>
			<tr class="info">
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
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${freeBoard.registerTime }" /></td>
					<td>${freeBoard.click }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>

<div>
	<!-- 이전페이지 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.previousGroup }">
			<a
				href="${initParam.rootPath }/free/login/list.do?page=${requestScope.pageBean.beginPage-1}">Previous&nbsp;</a>
		</c:when>
		<c:otherwise>
					Previous&nbsp;
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
					<li><a href="${initParam.rootPath }/free/login/list.do?page=${page }">${page }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
	
	<!-- 다음페이지 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.nextGroup }">
			<a
				href="${initParam.rootPath }/free/login/list.do?page=${requestScope.pageBean.endPage+1 }">&nbsp;Next</a>
		</c:when>
		<c:otherwise>
					&nbsp;Next			
				</c:otherwise>
	</c:choose>
</div>

<div>
<form action="${initParam.rootPath }/free/login/keyword.do" method="post">
		
<table>
	
	
		<tr>
		<td></td>
			<td>
			<select name="category" class="btn btn-default dropdown-toggle">
				<c:forEach items="${requestScope.codes }" var="code">
					<option>${code.code }</option>
			</c:forEach>
			</select> 
			</td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td>
			 	<input type="text" name="search"  class="form-control" > 
			 	<input type="hidden" name="page" value="1">
			</td>
	<td>&nbsp;&nbsp;</td>
		<td>
		<input class="btn btn-info btn-sm" type="submit" value="검색">
		</td>
		<tr>
		
	</table>
</form>
</div>
</div>


