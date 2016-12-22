<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>SALIM에 오신 것을 환영합니다.</title>
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->


<style type="text/css">


 header {
    background-color: #00001E;
    text-align: center;
    padding: 5px;
} 

footer {
    background-color: #00001E;
    padding-top: 30px;
    text-align: center;
    height: 50px;
    clear: both;
    padding-bottom: 50px;
}

</style>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 -->

</head>


<header>
	
	<!--여기, 로그인 여부에 따라서 header가 달라진다.-->
 
		  <c:choose><%--SALIM 로고 -로그인 여부에 따라 다른 처리(링크의 유무) --%>
			<c:when test="${not empty sessionScope.login_info.memberId}">
				<h2 align="left" style="margin-left: 50px; margin-top: 40px">
					<a id="logo" href="${initParam.rootPath }/collection/findAllCollectionList.do"><font color="#ffffff">SALIM</font></a>
				</h2>
			</c:when>
			<c:otherwise>
				<h2 align="left" style="margin-left: 50px; margin-top: 40px">
					<a href="${initParam.rootPath }/main.do"><font color="#ffffff">SALIM</font></a>
				</h2>
			</c:otherwise>
		</c:choose>
		
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
			</c:otherwise>
		</c:choose>
		
		</div>
	
	
	
</header>






<body>
<div style="padding-left:34%; padding-top: 6%; padding-bottom:6.8%">
<h1>자수성가의 표본!</h1>
<h3>&nbsp;&nbsp;살림꾼이 되신 것을 축하합니다.</h3>
<table style="width:500px" class="table"> 
	<tr>
		<th width="100px" align="left">ID</th>
		<td>${requestScope.member.memberId }</td>
	</tr>
	<tr>
		<th  align="left">패스워드</th>
		<td>${requestScope.member.password}</td>
	</tr>
	<tr>
		<th align="left">이름</th>
		<td>${requestScope.member.name}</td>
	</tr>
	<tr>
		<th align="left">생일</th>
		<td><fmt:formatDate value="${requestScope.member.birthday}" pattern="yyyy년 MM월 dd일"/></td>
	</tr>
	<tr>
		<th align="left">나이</th>
		<td>${requestScope.member.age}</td>
	</tr>
	<tr>
		<th align="left">이메일</th>
		<td>${requestScope.member.email}</td>
	</tr>
	
</table>
</div>

</body>






<footer>

  <!--   <br><br><br><br><br><br><br><br><br><br>
    <hr><div class="footer_left pull-left">Salim</div><div class="pull-right"><small>&copy; 2016-12.23 Salim.KOSTA</small></div> -->

<font style="color: white">
	살림프로젝트&nbsp;&nbsp;&nbsp;&nbsp;담당자: SALIM 팀&nbsp;&nbsp;&nbsp;&nbsp;
</font>

<a href="${initParam.rootPath }/inquiry.do">문의하기</a>

</footer>



