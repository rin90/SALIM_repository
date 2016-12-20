<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<table class="table table-condensed">
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
			<c:choose>
				<c:when test="${empty requestScope.category }">
					<tr>
						<td>등록된 글이 없습니다.</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>검색결과가없습니다.</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>




<div>
	<form action="${initParam.rootPath }/free/login/keyword.do"
		method="post">
		<select name="category" class="btn btn-default dropdown-toggle">
			<c:forEach items="${requestScope.codes }" var="code">
				<option>${code.code }</option>
			</c:forEach>
		</select> <input type="hidden" name="page" value="1"> <input
			type="text" name="search" value="${requestScope.search}"> <input
			class="btn btn-info btn-sm" type="submit" value="검색"> <a
			class="btn btn-default"
			href="${initParam.rootpath }/free/login/form.do?page=1">글쓰기</a>
	</form>
</div>