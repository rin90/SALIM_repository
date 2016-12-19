<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

</head>

<!--여기, 로그인 여부에 따라서 header가 달라진다.-->
 
  	<c:choose><%--SALIM 로고 -로그인 여부에 따라 다른 처리(링크의 유무) --%>
	<c:when test="${not empty sessionScope.login_info.memberId}">
		<h2 align="left">
			<a id="logo"
				href="${initParam.rootPath }/collection/findAllCollectionList.do">SALIM</a>
		</h2>
	</c:when>
	<c:otherwise>
		<h2 align="left">
			<a>SALIM</a>
		</h2>
	</c:otherwise>
</c:choose>


<form method="post" action="${initParam.rootPath }/collection/moving.do">
	<c:if test="${sessionScope.login_info != null }">
		<select id="selectInfo" onchange="form.submit()" name="selectId">
			<option value="${sessionScope.login_info}">개인</option>
			<c:forEach items="${sessionScope.groupList }" var="collection">
				<c:choose>
					<c:when test="${sessionScope.group_info.collectionId == collection.collectionId}">
						<option value=${collection.collectionId } selected="selected">${collection.collectionName }</option>
					</c:when>
					<c:otherwise>
						<option value="${collection.collectionId }">${collection.collectionName }</option>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
		</select>
	</c:if>
</form>


<div align="right">
	<c:choose>
	<c:when test='${sessionScope.login_info!=null}'>
		<a href="${initParam.rootPath}/myPage.do">마이페이지</a>&nbsp;&nbsp;
		<a href="${initParam.rootPath}/member/logout.do">로그아웃</a>
	
	</c:when>
	<c:otherwise>
		<a href="${initParam.rootPath}/loginMember.do" class="btn btn-success" role="button">로그인</a>&nbsp;&nbsp;
		<a href="${initParam.rootPath }/joinMember.do" class="btn btn-warning" role="button">회원가입</a>
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<%-- <a href="${initParam.rootPath }/joinMember.do">회원가입</a>&nbsp;&nbsp;
		<a href="${initParam.rootPath}/loginMember.do">로그인</a>
	 --%>
	</c:otherwise>
</c:choose>

</div>

