<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2 align="left">SALIM</h2>

<!-- j쿼리 등록 : datepicker -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- 부트스트랩 등록 -->
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<!--여기, 로그인 여부에 따라서 header가 달라진다.-->


<!-- 로그인시 본인과 그룹 간을 이동할 수 있는 select박스 -->
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



<c:choose>
	<c:when test='${sessionScope.login_info!=null}'>
		<a href="${initParam.rootPath}/myPage.do">마이페이지</a>&nbsp;&nbsp;
		<a href="${initParam.rootPath}/member/logout.do">로그아웃</a>
	
	</c:when>
	<c:otherwise>
	
		<a href="${initParam.rootPath }/joinMember.do">회원가입</a>&nbsp;&nbsp;
		<a href="${initParam.rootPath}/loginMember.do">로그인</a>
	
	</c:otherwise>
</c:choose>
