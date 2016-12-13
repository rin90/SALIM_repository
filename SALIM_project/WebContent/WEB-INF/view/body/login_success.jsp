<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>jQuery UI Selectable - Serialize</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
  #feedback { font-size: 1.4em; }

  #selectable .ui-selecting { background: #FECA40; }

  #selectable .ui-selected { background: #F39814; color: white; }

  #selectable { list-style-type: none; margin: 0; padding: 0; width: 60%; }

  #selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
  </style>
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="/SALIM_project/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready({
	
	$("#selectable").on("click",function(){
		alert("dk");
	});
	
});

</script>


<title>Insert title here</title>
</head>
<body>


<h3><font color='coral'>${sessionScope.login_info.memberId}님 환영합니다!</font></h3>

<table>
<tr>
	<td></td>
	<td>
		<h2><a href="${initParam.rootPath }/household/login/incomeSelect.do">개인 가계부</a></h2>
	</td>
</tr>
<tr>
	<td></td>
	<td>
	 	<h2>그룹 가계부</h2>
	</td>
	
</tr>
<tr>
	<th>
		<form action="${initParam.rootPath }/collection.do" method='get'>
			<input type='submit' value='그룹 가계부 추가'>
		</form>	
	</th>
</tr>
</table>
<table>	
	<c:if test="${requestScope.collectionList!=null}">
	<tr>
		<c:forEach  items="${requestScope.collectionList}" var="collectionList">	
			<%@include file="collectionIncludedFile.jsp" %>	
		</c:forEach>
	</tr>
	</c:if>
</table>	

</body>
</html>