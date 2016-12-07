<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
<head>	
<meta charset="UTF-8">	
<title>Insert title here</title>	
</head>
<body>
	
<select>
		<option>${requestScope.smallCategory.smallContent }</option>
		<option>${requestScope.smallCategory.bigCategory.bigContent }</option>
</select>
	
	
	
	
</body>
</html>