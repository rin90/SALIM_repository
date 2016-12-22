<%@ page contentType="text/html;charset=UTF-8"%>
<!-- tiles 설정을 호출할 tiles 제공 Tag 라이브러리 등록 -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>SALIM 가계부</title>
<style type="text/css">
header{
	background-color:#00001E;
	text-align:center;
	padding: 5px;
}
nav{
	line-height: 50px;
	min-height:1000px; 
	background-color:lightgray;
	padding: 15px;
	width:15%;
	float:left;
}
section{
	padding: 15px;
	margin-left: 3em;
	background-color:white;
	min-height:1000px; 
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
/* div.container {
    min-height: 100% !important;
} */
/* #temp_container{
	min-height: 1000px;
	max-height: 100%;
} */
</style>
</head>
<body>
	<!-- HTML5에서 지원하는 태그들. 이전 버전을 사용하는 경우 <div>를 이용해서 사용함. -->
	<header>	
		<!-- name=header : put-attribute name이 header로 설정된 jsp를 이 자리에 포함시켜라. -->
		<tiles:insertAttribute name="header"/>
	</header>
	
	<div id="temp_container">
		<nav>
			<tiles:insertAttribute name="nav"/>	<!-- 이 자리에 include 시켜라 느낌. -->
		</nav>
		
		<section>
			<tiles:insertAttribute name="body"/>
		</section>
	</div>
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>