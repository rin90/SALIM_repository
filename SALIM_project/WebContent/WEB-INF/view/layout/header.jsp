<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2 align="left">SALIM</h2>
<!--여기, 로그인 여부에 따라서 header가 달라진다.-->

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
