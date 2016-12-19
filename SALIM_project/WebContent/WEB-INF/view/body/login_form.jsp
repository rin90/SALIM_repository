<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.errorMessage{
	font-size: 12px;
	color: red
}

</style>
</head>
<body>
<div class="col-md-8 col-md-offset-2">
  <h1>로그인</h1><br>
 <form action="${initParam.rootPath}/member/login.do " method="post">
    <div class="form-group">
    
      <label for="email">아이디 입력&nbsp;&nbsp;&nbsp;&nbsp;</label><a href="${initParam.rootPath}/findId.do">(아이디를 잊으셨나요?)</a><br>
      <span class="errorMessage">
			<form:errors path="loginCheck.memberId"/>
	</span>
      <input type="text" class="form-control" id="email" name="memberId" placeholder="아이디를 입력하세요.">
    </div>
    
    <div class="form-group">
      <label for="pwd">비밀번호 입력&nbsp;&nbsp;</label><a href="${initParam.rootPath}/findPassword.do">(비밀번호를 잊으셨나요?)</a>
      <div class="errorMessage">
		<form:errors path="loginCheck.password" />
	 </div>	
      <input type="password" class="form-control" id="pwd" name="password" placeholder="비밀번호를 입력하세요.">
    </div>
    
    <hr>
    
    <c:if test="${requestScope.error!=null}">
						<span class="errorMessage">
							${requestScope.error}
						</span>
		</c:if>
		<br>
    <button type="submit" class="btn btn-lg btn-success pull-right">로그인</button>
    
    <br><br><br><br><br><br><br><br><br><br>
    <hr><div class="footer_left pull-left">Salim</div><div class="pull-right"><small>&copy; 2016-12.23 Salim.KOSTA</small></div>
 
  </form>
  
</div>


<%-- <form action="${initParam.rootPath}/member/login.do " method="post">
<table>
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디 입력  &nbsp;&nbsp;
			<a href="${initParam.rootPath}/findId.do">(아이디를 잊으셨나요?)</a>
			
		</td>
	</tr>
	
	<tr>	
		<td>
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="memberId" size="40" autofocus="autofocus">
		</td>
		<td>
						<span class="errorMessage">
							<form:errors path="loginCheck.memberId"/>
						</span>
		</td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 입력 &nbsp;&nbsp;<a href="${initParam.rootPath}/findPassword.do">(비밀번호를 잊으셨나요?)</a>
				
		<td>
	</tr>
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" size="40">
		</td>
		<td>
			<div class="errorMessage">
							<form:errors path="loginCheck.password" />
						</div>	
		</td>
	</tr>
	
	<tr>
		<td>

		<c:if test="${requestScope.error!=null}">
						<span class="errorMessage">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.error}
						</span>
		</c:if>



				</td>
		<td colspan="5" align="right">
			<input type="submit" value="로그인"> 
		</td>
	</tr>
	
	
</table>
</form> --%>
</body>
</html>