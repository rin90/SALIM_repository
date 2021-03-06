<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<div>
	<table class="table table-condensed">
		<thead>
			<tr>
				<td>분류</td>
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

	<form action="${initParam.rootPath }/tip/login/form.do">
		   <a class="btn btn-md btn-default  pull-right" href="${initParam.rootPath }/tip/login/form.do?page=${requestScope.pageBean.page}">글쓰기</a>
	</form>
	
	<form action="${initParam.rootPath}/tip/login/keyword.do" method="post">
		<select name="category"class="btn btn-primary dropdown-toggle">
			<c:forEach items="${requestScope.codes }" var="code">
				<option>${code.code }</option>
			</c:forEach>
		</select><input type="hidden" name="page" value="1">
			<input type="text" name="search"> <input type="submit" value="검색"class= "btn btn-primary btn-sm Small"> 
			
	</form>
