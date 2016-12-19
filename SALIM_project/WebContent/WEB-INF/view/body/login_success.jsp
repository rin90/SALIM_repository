<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>jQuery UI Selectable - Serialize</title>
<!-- 부트스트랩 -->  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <!-- 부트스트랩  끝/--> 
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
  #feedback { font-size: 1.4em; }

  #selectable .ui-selecting { background: #FECA40; }

  #selectable .ui-selected { background: #F39814; color: white; }

  #selectable { list-style-type: none; margin: 0; padding: 0; width: 100%; }

  #selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 30px; }
  </style>
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="/SALIM_project/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".mydiv").on("click","selectable",function(){
		alert("dk");
	});
	
	$("#okayClick").on("click",function(){
		$("#form").prop("action","${initParam.rootPath }/collection/okay.do");
		$("#form").submit();
	});
	$("#noClick").on("click",function(){
		$("#form").prop("action","${initParam.rootPath }/collection/refusal.do");
		$("#form").submit();
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
<th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th>
	<th></th>
	<th align='right'>
		<form action="${initParam.rootPath }/collection.do" method='get'>
			<!-- <input type='submit' value='그룹 가계부 추가'> -->
			<button type="submit" class="btn btn-default btn-lg">+그룹가계부 추가</button>
		</form>	
	</th>
</tr>
<tr>
		<td>
			<h3>나의 그룹 가계부</h3>
		</td>
	</tr>
</table>

<table>	

	<c:if test="${requestScope.collectionListInviteTrue!=null}">
	
	
		
		<c:forEach  items="${requestScope.collectionListInviteTrue}" var="collection">	
		<tr>	
				<%@include file="collectionIncludedFile.jsp" %>	
		</tr>
		</c:forEach>
		
	
	</c:if>
</table>
<br>

<c:if test="${requestScope.collectionListInvitefalse!=null}">
			
					<h3>초대 받은 그룹 가계부</h3>
			
			</c:if>
<table>
		<c:if test="${requestScope.collectionListInvitefalse!=null}">
	
	<tr>
		
		<c:forEach  items="${requestScope.collectionListInvitefalse}" var="collection">	
			
				<%@include file="collectionIncludedFile2.jsp" %>	
			
		</c:forEach>
		
	</tr>
	</c:if>
</table>	

</body>
</html>