<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SALIM에 오신 것을 환영합니다.</title>

<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>
  
 
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

 
.errorMessage{
	font-size: 12px;
	color: red
}


</style>
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
	
	<div align="right" style="margin-right:30px">
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
<div class="col-md-8 col-md-offset-2" style="padding-bottom: 124px; padding-left: 300px;"><br><br>
  <h1>로그인</h1><br><br><br>
 <form action="${initParam.rootPath}/member/login.do " method="post">
    <div class="form-group">
    
      <label for="email">아이디 입력&nbsp;&nbsp;&nbsp;&nbsp;</label><a href="${initParam.rootPath}/findId.do">(아이디를 잊으셨나요?)</a><br>
      <span class="errorMessage">
			<form:errors path="loginCheck.memberId"/>
	</span>
      <input type="text" class="form-control" id="email" name="memberId" placeholder="salim" style="width:60%;">
    </div>
    <br>
    <div class="form-group">
      <label for="pwd">비밀번호 입력&nbsp;&nbsp;</label><a href="${initParam.rootPath}/findPassword.do">(비밀번호를 잊으셨나요?)</a>
      <div class="errorMessage">
		<form:errors path="loginCheck.password" />
	 </div>	
      <input type="password" class="form-control" id="pwd" name="password" placeholder="********" style="width:60%;">
    </div>
    
    <hr>
    
    <c:if test="${requestScope.error!=null}">
						<span class="errorMessage">
							${requestScope.error}
						</span>
		</c:if>
		<br>
    <button type="submit" class="btn btn-lg btn-success" style="margin-left: 330px">로그인</button>
 
  </form>
  
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




</html>