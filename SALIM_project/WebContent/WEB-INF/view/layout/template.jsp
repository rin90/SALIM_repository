<%@ page contentType="text/html;charset=UTF-8"%>
<!-- tiles 설정을 호출할 tiles 제공 Tag 라이브러리 등록 -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<meta charset="UTF-8">
<title>SALIM 가계부</title>
<style type="text/css">
header{
	background-color:skyblue;
	text-align:center;
	padding: 5px;
}
nav{
	line-height: 50px;
	background-color:lightgray;
	padding: 15px;
	min-height:700px;
	width:15%;
	float:left;
}
section{
	padding: 15px;
	background-color:white;
	min-height:400px;
	width:70%;
	float:left;
}
footer{
	background-color:skyblue;
	padding-top:20px;
	text-align:center;
	height:50px;
	clear:both;
}
</style>
</head>
<body>
	<!-- HTML5에서 지원하는 태그들. 이전 버전을 사용하는 경우 <div>를 이용해서 사용함. -->
	<header>	
		<!-- name=header : put-attribute name이 header로 설정된 jsp를 이 자리에 포함시켜라. -->
		<tiles:insertAttribute name="header"/>
	</header>
	
	<nav>
		<tiles:insertAttribute name="nav"/>	<!-- 이 자리에 include 시켜라 느낌. -->
	</nav>
	
	<section>
		<tiles:insertAttribute name="body"/>
	</section>
	
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>