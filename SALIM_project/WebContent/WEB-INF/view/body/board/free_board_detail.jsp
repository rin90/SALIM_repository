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
						
						$("#good").text("♡ 0");
						$("#good").prop("value","false");
					
					}else {	
			
						$("#good").text("♥ 1");
						$("#good").prop("value","");
					}		
				}
			});//ajax
	});//event

	
	
	//document에서 새로고침 방지 그러나 F12화면 새로고침 방지가 안됨  -> 그래서 쿠키로 합니다 ... 새로고침 방지하는 이유는 값이 그대로 보존되서 조회수가 올라감 .좋아요도redirect해서
	//옮기면서 해도 결국 같을거야 왜냐하면 어차피 똑같이 값을 주기 때문에 insert,update,delete같은 경우는 insert,update,delete로 다시 안돌아 가자나
	/* $(document).keydown(function (e) {
	     
        if (e.which === 116 || e.which === 123) { //116->f5키를 뜻함 123 -> f12키를 뜻함 :::막음
        	if (typeof event == "object") {
                event.keyCode = 0;
            }
            return false;
        } else if (e.which === 82 && e.ctrlKey) {
            return false;
        }

	});   근데 이런 보안은 오용이랍니다. 그래서 cooki를 이용합시다.*/ 
	



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
		댓글 &nbsp;${requestScope.commentTotal }&nbsp;&nbsp;조회&nbsp;${requestScope.freeBoard.click }&nbsp;&nbsp; 
		좋아요 &nbsp;	${requestScope.freeBoard.good }		<button id="good" type="button" value="false">♡&nbsp;0</button>
		<hr> 
			<p/>

			<input type="hidden" name="page" value="${requestScope.page }">
			<c:choose>
				<c:when test="${empty requestScope.category  }">
					<a href="${initParam.rootPath }/free/list.do?page=${requestScope.page }">목록</a>
				</c:when>
				<c:otherwise>
					<a 
					href="${initParam.rootPath }/free/keyword.do?page=${requestScope.page }&&category=${requestScope.category}&search=${requestScope.search}">목록</a>
				</c:otherwise>
			</c:choose>
			<p/>
			<a 
			href="${initParam.rootPath }/free/updateForm.do?category=${requestScope.category }&search=${requestScope.search}&page=${requestScope.page}&no=${requestScope.freeBoard.no}">수정</a> &nbsp;&nbsp;
			<c:choose>
				<c:when test="${empty requestScope.category }">
					<a 
					href="${initParam.rootPath }/free/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">삭제</a>	<p/>
				</c:when>
				<c:otherwise>
					<a
					href="${initParam.rootPath }/free/delete.do?no=${requestScope.freeBoard.no}&page=1">삭제</a>	<p/>					
				</c:otherwise>
			</c:choose>

<form action="${initParam.rootPath }/comment/insert.do" method="post">
	<input type="hidden" name="memeberId" value="id-3">
	<input type="hidden" name="fontNo" value="${requestScope.freeBoard.no }">
	★&nbsp;&nbsp;<textarea name="content" rows="2" cols="10"></textarea>
	<input type="submit" value="등록">
</form>
			







</body>
</html>