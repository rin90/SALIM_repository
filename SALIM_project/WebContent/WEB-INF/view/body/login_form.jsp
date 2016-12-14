<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.errorMessage{
	font-size: 12px;
	color: red
}

</style>
</head>
<body>

<h2> 로그인 </h2>

<form action="${initParam.rootPath}/member/login.do " method="post">
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
</form>
</body>
</html>