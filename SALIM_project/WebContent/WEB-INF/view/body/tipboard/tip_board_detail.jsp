<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
${requestScope.tipBoard.classification} ${requestScope.freeBoard.title } &nbsp;&nbsp;&nbsp;
<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${requestScope.tipBoard.registerTime }"/>
<br>
${requestScope.tipBoard.memberId} &nbsp;&nbsp;&nbsp;<br>
<img src="${initParam.rootPath }/tipFileRoute/${requestScope.tipBoard.fileName }">
${requestScope.tipBoard.content}

<br>
aa${requestSocpe.tipBoard.fileName }
��ȸ��&nbsp;${requestScope.tipBoard.click}&nbsp;&nbsp; 
���&nbsp;&nbsp;&nbsp;
���ƿ�&nbsp;${requestScope.tipBoard.good}&nbsp;&nbsp;

<p/>
 <a href="${initParam.rootPath }/list.do?page=${requestScope.page}">���</a><br>
 <a href="${initParam.rootPath }/delete.do?no=${requestScope.tipBoard.no }&page=${requestScope.page}">����</a>&nbsp;&nbsp;
 <a href="${initParam.rootPath }/move.do?no=${requestScope.tipBoard.no }&page=${requestScope.page}">����</a>
 
  


</body>
</html>