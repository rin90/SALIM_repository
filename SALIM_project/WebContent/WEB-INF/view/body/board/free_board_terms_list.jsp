<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript"
	src="/SALIM_project/lib/scripts/jquery.js"></script>
<script type="text/javascript">
	
</script>
<div class="container">
	<br>
 	 <h1>글 찾기</h1>
 	 <hr>
		<form action="${initParam.rootPath }/free/login/form.do">
		<input type="hidden" name="page" value="${requestScope.pageBean.page }"> &nbsp;&nbsp;&nbsp;
		<input type="submit" value="글쓰기" class="btn btn-md btn-default  pull-right">
		
	</form>
	<br>
	<table  class="table table-condensed">
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
			href="${initParam.rootPath }/free/login/seleteDetail.do?no=${freeBoard.no}&page=${requestScope.pageBean.page}&category=${requestScope.category}&search=${requestScope.search}">${freeBoard.title }</a></td>
					<td>${freeBoard.memberId }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${freeBoard.registerTime }" /></td>
					<td>${freeBoard.click }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>



	<!-- 이전페이지 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.previousGroup }">
			<a
				href="${initParam.rootPath }/free/login/keyword.do?page=${requestScope.pageBean.beginPage-1}&category=${requestScope.category}&Search=${requestScope.Search}">Previous&nbsp;</a>
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
				<a 
		href="${initParam.rootPath }/free/login/keyword.do?page=${page }&category=${requestScope.category}&search=${requestScope.search}">${page }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<!-- 다음페이지 -->
	<c:choose>
		<c:when test="${requestScope.pageBean.nextGroup }">
			<a
				href="${initParam.rootPath }/free/login/keyword.do?page=${requestScope.pageBean.endPage+1 }&category=${requestScope.category}&search=${requestScope.search}">&nbsp;Next</a>
		</c:when>
		<c:otherwise>
					&nbsp;Next			
				</c:otherwise>
	</c:choose>


	<p />
	<br>
	
	<form action="${initParam.rootPath }/free/login/keyword.do" method="post">
	<table>
		<tr><td>&nbsp;&nbsp;</td>
			<td><select name="category" class="btn btn-default dropdown-toggle">
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
		</select> </td><td>&nbsp;&nbsp;</td>
			<td><input type="text" class="form-control" name="search" value="${requestScope.search}"></td>
			<td>&nbsp;&nbsp;</td>
			<td>
			<button type="submit" class="btn btn-info">
     	 <span class="glyphicon glyphicon-search"></span> Search
		</button>
			</td>
		</tr>
	</table>
		<input type="hidden" name="page" value="1"> 
		 
	</form>
</div>		
