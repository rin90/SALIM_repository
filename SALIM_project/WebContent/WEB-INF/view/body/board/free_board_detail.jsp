<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript" src="/SALIM_project/lib/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#good").css("color","red")
	$("#good").on("click",function(){		
					$.ajax({	
				"url":"${initParam.rootPath}/free/good.do",
				"type":"post",
				"data":"whether="+$("#good").val()+"&no="+${requestScope.freeBoard.no},
				"beforeSend":function(){
					if(!$("#good").val()){
						
						$("#good").text("�� 0");
						$("#good").prop("value","false");
					
					}else {	
			
						$("#good").text("�� 1");
						$("#good").prop("value","");
					}		
				}
			});//ajax
	});//event

	
	
	//document���� ���ΰ�ħ ���� �׷��� F12ȭ�� ���ΰ�ħ ������ �ȵ�  -> �׷��� ��Ű�� �մϴ� ... ���ΰ�ħ �����ϴ� ������ ���� �״�� �����Ǽ� ��ȸ���� �ö� .���ƿ䵵redirect�ؼ�
	//�ű�鼭 �ص� �ᱹ �����ž� �ֳ��ϸ� ������ �Ȱ��� ���� �ֱ� ������ insert,update,delete���� ���� insert,update,delete�� �ٽ� �ȵ��� ���ڳ�
	/* $(document).keydown(function (e) {
	     
        if (e.which === 116 || e.which === 123) { //116->f5Ű�� ���� 123 -> f12Ű�� ���� :::����
        	if (typeof event == "object") {
                event.keyCode = 0;
            }
            return false;
        } else if (e.which === 82 && e.ctrlKey) {
            return false;
        }

	});   �ٵ� �̷� ������ �����̶��ϴ�. �׷��� cooki�� �̿��սô�.*/ 
	



});

</script>
	
</head>
<body>
		${requestScope.freeBoard.title } &nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${requestScope.freeBoard.registerTime }"/>	
	<hr>
		${requestScope.freeBoard.memberId } &nbsp;&nbsp;&nbsp; 
		<p/>
		<img src="${initParam.rootPath }/fileroute/${requestScope.freeBoard.fileName }">
		<br>${requestScope.freeBoard.content }
		<p/>
		��� &nbsp;${requestScope.commentTotal }&nbsp;&nbsp;��ȸ&nbsp;${requestScope.freeBoard.click }&nbsp;&nbsp; 
		���ƿ� &nbsp;	${requestScope.freeBoard.good }		<button id="good" type="button" value="false">��&nbsp;0</button>
		<hr> 
			<p/>

			<input type="hidden" name="page" value="${requestScope.page }">
			<c:choose>
				<c:when test="${empty requestScope.category  }">
					<a href="${initParam.rootPath }/free/list.do?page=${requestScope.page }">���</a>
				</c:when>
				<c:otherwise>
					<a 
					href="${initParam.rootPath }/free/keyword.do?page=${requestScope.page }&&category=${requestScope.category}&search=${requestScope.search}">���</a>
				</c:otherwise>
			</c:choose>
			<p/>
			<a 
			href="${initParam.rootPath }/free/updateForm.do?category=${requestScope.category }&search=${requestScope.search}&page=${requestScope.page}&no=${requestScope.freeBoard.no}">����</a> &nbsp;&nbsp;
			<c:choose>
				<c:when test="${empty requestScope.category }">
					<a 
					href="${initParam.rootPath }/free/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">����</a>	<p/>
				</c:when>
				<c:otherwise>
					<a
					href="${initParam.rootPath }/free/delete.do?no=${requestScope.freeBoard.no}&page=1">����</a>	<p/>					
				</c:otherwise>
			</c:choose>

<form action="${initParam.rootPath }/comment/insert.do" method="post">
	<input type="hidden" name="memeberId" value="id-3">
	<input type="hidden" name="fontNo" value="${requestScope.freeBoard.no }">
	��&nbsp;&nbsp;<textarea name="content" rows="2" cols="10"></textarea>
	<input type="submit" value="���">
</form>
			







</body>
</html>