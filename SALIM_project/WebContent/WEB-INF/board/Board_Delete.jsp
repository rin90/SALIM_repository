<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 삭제하기</title>


<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardDeleteCheck() {
		var form = document.BoardDeleteForm;
		return true;
	}
</script>
</head>

<body>
	<center>
	<br><br>
	
	
	<table width=70% cellspacing=0 cellpadding=2>
		<form name="BoardDeleteForm" method="post" action="Board_Delete_action.jsp" 
														onsubmit="return boardDeleteCheck();" >
 	<tr>
		<td align=center>
		<table align=center border=0 width=91%>
   
    <tr>
		<td><hr size=1 color=#eeeeee></td>
	</tr>
    <tr>
		<td align=center>
		<input type="submit" value="삭제완료" >
		<input type=button value="뒤로" onClick="history.go(-1)">
		</td>
	</tr> 
	</table>
	</td>
	</tr>
	</form> 
	</table>
	</center>
</body>
</html>