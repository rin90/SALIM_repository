<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${initParam.rootPath}/scripts/jquery.js"></script>
<script type="text/javascript">
var check=false;
$(document).ready(function(){	
		$("#emailMessageBtn").on("click",function(){
			
			$.ajax({
				"url":"${initParam.rootPath}/collection/emailCheck.do",
				"data":{"emailMessage":$('#emailMessage').val(),"memberId":'${sessionScope.login_info.memberId}',"collectionId":'${sessionScope.group_info.collectionId}'},
				"dataType":"json",
				"beforeSend":function(){
					
					if(!$("#emailMessage").val())
					{
						alert("초대할 멤버의 이메일을 입력하세요!");
						return false;
					}
					
				},
				 "success":function(obj){
					
					 var message=obj.emailCheckMessage;
					 if(message=="이메일을 찾을 수 없습니다."||message=="멤버 초대 권한이 없습니다."||message=="이미 초대한 회원입니다.")
					 {
						alert(message); 
						//$("#noInvited").submit(); //화면 전환
					 }
					 else
					 {
						 check=confirm(message);
						 alert(check);
						 if(check==true)
						 {
							 $("#emailMessageBtn").submit();
							 
						 }else
						 {
							 //$("#noInvited").submit();
							 //false인 경우... 사용자가 안 보낸다고 한 경우....어떠카지? 'ㅅ'ㅅ'ㅅ'ㅅ'ㅅ'??
							//화면 전환이 필요한 것 같은..느낌적인 느낌!! 
						 }
					 }
				},
				
				"error":function(){
					alert("실패");
				}
			});
		});


<script type="text/javascript" >

function messageKeep()
{
	 alert($("#emailMessage").val());
}


function emailClick()
{

	var keepMessage=$("#emailMessage").val();
	alert(keepMessage+"초대장을 보냈습니다.");

	var keepMessage=window.document.getElementsByIdName("emailMessage");
	var m=$("#emailMessage").val(); 
	alert(m+"초대장을 보냈습니다.");

}
function a()
{
	alert('${requestScope.inviteMessage}');
}


}); 
</script>
</head>
<body>
<div class="col-md-8 col-md-offset-2"><br><br>

<h2>그룹 멤버 관리</h2><br><br>
<!-- 여기서 회원 조회를 해서 뿌려주는 부분! -->
 <table class="table table-bordered">
<tr class="warning">
		<th>멤버 이름</th><th>멤버 이메일</th><th>멤버 생일</th><th>멤버 초대 상태</th>
</tr>
<c:if test="${sessionScope.login_info.memberId==sessionScope.group_info.grantId }">
<tr>
	<th>${sessionScope.login_info.name}</th><th>${sessionScope.login_info.email}</th><th><fmt:formatDate value="${sessionScope.login_info.birthday}" pattern="yyyy년 MM월 dd일 "/></th><th>리더</th>
</tr>
</c:if>
<c:if test="${fn:length(requestScope.true_invitedMember)!=0}">

<c:forEach items="${requestScope.true_invitedMember}" var="member">
<c:choose>
	<c:when test="${member.memberId!=sessionScope.group_info.grantId}">
		<tr>
			<th>${member.name}</th><th>${member.email}</th><th><fmt:formatDate value="${member.birthday}" pattern="yyyy년 MM월 dd일 "/></th><th><font color='blue'>초대완료</font></th>
		</tr>
	</c:when>
	<c:otherwise>
		
	</c:otherwise>
</c:choose>
	
</c:forEach>
</c:if>
<c:if test="${fn:length(requestScope.false_invitedMember)!=0}">

<c:forEach items="${requestScope.false_invitedMember}" var="member">
	<tr>
		<th>-</th><th>${member.email}</th><th>-</th><th><font color='green'>초대중</font></th>
	</tr>
</c:forEach>
</c:if>

<c:if test="${fn:length(requestScope.refusal_invitedMember)!=0}">

<c:forEach items="${requestScope.refusal_invitedMember}" var="member">
	<tr>
		<th>-</th><th>${member.email}</th><th>-</th><th><font color='red'>거절&nbsp;&nbsp;
		</font><font color="black"><a id="hrefRemoveClick" href="${initParam.rootPath}/collection/removeRefusalMember.do?email=${member.email }">삭제하기</a></font>
		</th>
	</tr>
</c:forEach>
</c:if>
</table>

<br>
<h2>멤버 초대하기</h2><br>
 <c:if test="${not empty requestScope.deletefailMessage}">

	alert(${requestScope.deletefailMessage});
</c:if> 
<form action="${initParam.rootPath }/collection/inviteMember.do" method="post">
<input type="hidden" name="collectionId" value='${sessionScope.group_info.collectionId}'>
<table>
<tr>
	<td>
	  <h5><label >초대할 멤버의 이메일을 입력해주세요.</label></h5>
	</td>
</tr>
</table>

		<input type="text" name="email" class="form-control" id='emailMessage' onblur="messageKeep();" placeholder="myMember@google.com"><br><br>
		<input type="submit" value="초대하기" id='emailMessageBtn'class="btn btn-success btn-md  pull-right"> 





</form>

<form id='noInvited' action ="${initParam.rootPath }/invite.do" method="get"></form> 
</div>
</body>
</html>