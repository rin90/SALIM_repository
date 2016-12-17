<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<h2>그룹 회원 관리</h2>
<!-- 여기서 회원 조회를 해서 뿌려주는 부분! -->
<table border='1'>
<c:if test="${fn:length(requestScope.true_invitedMember)!=0}">
<tr>
		<th>멤버 이름</th><th>멤버 이메일</th><th>멤버 생일</th><th>멤버 초대 상태</th>
</tr>
<c:forEach items="${requestScope.true_invitedMember}" var="member">
	<tr>
		<th>${member.name}</th><th>${member.email}</th><th>${member.birthday}</th><th><font color='blue'>초대완료</font></th>
	</tr>
</c:forEach>
</c:if>
<c:if test="${fn:length(requestScope.false_invitedMember)!=0}">

<c:forEach items="${requestScope.false_invitedMember}" var="member">
	<tr>
		<th>-</th><th>${member.email}</th><th>-</th><th><font color='red'>초대중</font></th>
	</tr>
</c:forEach>
</c:if>
</table>

<br>
<h2>멤버 초대하기</h2>
 <c:if test="${not empty requestScope.deletefailMessage}">

	alert(${requestScope.deletefailMessage});
</c:if> 
<form action="${initParam.rootPath }/collection/inviteMember.do" method="post">
<input type="hidden" name="collectionId" value='${sessionScope.group_info.collectionId}'>
<table>
<tr>
	<td>
	<h3>멤버 이메일 입력</h3>
	</td>
</tr>
<tr>
	<td>


		<input type="text" name="email" id='emailMessage' onblur="messageKeep();">&nbsp;&nbsp;

	</td>
	
	<td>
		<input type="submit" value="초대하기" id='emailMessageBtn'> 
	</td>
</tr>


</table>

</form>

<form id='noInvited' action ="${initParam.rootPath }/invite.do" method="get"></form>
</body>
</html>