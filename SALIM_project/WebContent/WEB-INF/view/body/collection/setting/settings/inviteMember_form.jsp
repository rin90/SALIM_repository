<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath}/scripts/jquery.js"></script>
<script type="text/javascript">
var check=false;
$(document).ready(function(){	
		$("#emailMessage").on("blur",function(){
			
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
					 if(message=="이메일을 찾을 수 없습니다."||message=="멤버 초대 권한이 없습니다.")
					 {
						alert(message); 
					 }
					 else
					 {
						 check=confirm(message);
						 if(check==true)
						 {
							 $("#emailMessageBtn").submit();
						 }
					 }
				},
				
				"error":function(){
					alert("실패");
				}
			});
		});


function emailClick()
{
	var keepMessage=$("#emailMessage").val();
	alert(keepMessage+"초대장을 보냈습니다.");
}

}); 
</script>
</head>
<body>
<h2>멤버 초대하기</h2>

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
		<input type="text" name="email" id='emailMessage'> &nbsp;&nbsp;
	</td>
	
	<td>
		<input type="submit" value="초대하기" id='emailMessageBtn'> 
	</td>
</tr>


</table>

</form>
</body>
</html>