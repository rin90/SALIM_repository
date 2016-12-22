<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--여기, 로그인 여부에 따라서 header가 달라진다.-->

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
header {
    background-color: #00001E;
    text-align: center;
    padding: 5px;
} 
</style>

</head>

<!--   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
  
  <!-- j쿼리 등록 : datepicker -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/SALIM_project/scripts/jquery.number.min.js"></script>

<!-- 부트스트랩 등록 -->
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>
  
</head>

<!--여기, 로그인 여부에 따라서 header가 달라진다.-->
 
<c:choose><%--SALIM 로고 -로그인 여부에 따라 다른 처리(링크의 유무) --%>
	<c:when test="${not empty sessionScope.login_info.memberId}">
		<h2 align="left"  style="margin-left: 50px; margin-top: 40px">
			<a id="logo" href="${initParam.rootPath }/collection/findAllCollectionList.do"><font color="#ffffff">SALIM</font></a>
		</h2>
	</c:when>
	<c:otherwise>
		<h2 align="left" style="margin-left: 50px; margin-top: 40px">
			<a href="${initParam.rootPath }/main.do"><font color="#ffffff">SALIM</font></a>
		</h2>
	</c:otherwise>
</c:choose>


<div align="right" style="margin-right:30px;">

	<c:if test="${sessionScope.login_info != null }">
		<c:choose>
			<c:when test="${sessionScope.group_info != null }">
				<font color="white" size="5px">${group_info.collectionName} 가계부</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
				<font color="white" size="5px">나의 가계부</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</c:otherwise>
		</c:choose>
	</c:if>

	<c:choose>
	<c:when test='${sessionScope.login_info!=null}'>
	<%-- 	<a href="${initParam.rootPath}/myPage.do" class="btn btn-success" role="button">마이페이지</a>&nbsp;&nbsp; --%>
		<a href="${initParam.rootPath}/member/logout.do" class="btn btn-warning" role="button">로그아웃</a>
		<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
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

