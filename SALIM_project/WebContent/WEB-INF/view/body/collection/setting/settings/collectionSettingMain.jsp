<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.rootPath }/scripts/jquery.js"></script>
<script type="text/javascript">
function giveUrl(url)
{
	$("#formTag").prop("action",url);
	$("#formTag").submit();
}
$(document).ready(function(){
	
	
	
$("#modifyBtn").on("click",function(){
	
	var message='${requestScope.grantMessage}';
		if(message!="")
		{
			alert(message);
		}
		
	
			
	});
$("#removeBtn").on("click",function(){
	
	var message='${requestScope.grantMessage}';
	

	if(message=="")
	{
		var selection=confirm("정말로 삭제하시겠습니까?");
		if(selection==true)
		{
			alert("진짜 ?");
			$.ajax({
				 "url":"${initParam.rootPath}/collection/removeCollection.do",
				 "data":"collectionId="+'${sessionScope.group_info.collectionId}',
				 "dataType":"text",
				 "success":function(obj){
					 var txt=obj;
					 $("#formTag").prop("action","txt");
					 $("#formTag").submit();
				 }
			});
			
		}
	}else
	{
		alert(message);
	}
	
	});	
});
</script>
</head>
<body>
<h2>가계부 환경설정 </h2><br>
<h3>- 권한자만 가계부 변경이 가능합니다 !</h3>
<form action="" id='formTag' method="POST">
<table>
	<tr>
		<td>
			그룹 가계부명 
		</td>
		<td>
			<input type="text" id="collectionName" name="collectionName" placeholder='${sessionScope.group_info.collectionName }' value="${sessionScope.group_info.collectionName}">
		</td>
	</tr>
	<tr>
		<td>
		 	그룹 가계부 설명 
		</td>
		<td>
			<input type="text" id='collectionIntro' name="collectionIntro" placeholder='${sessionScope.group_info.collectionIntro }' value="${sessionScope.group_info.collectionIntro}">
		</td>
	</tr>
	
	<tr>
		<td> 
			그룹 가계부 권한자 &nbsp;
		</td>
		<td>
			<input type="text" id='grantId' name='grantId' placeholder='${sessionScope.group_info.grantId}' value="${sessionScope.group_info.grantId}" >
		</td>
	</tr>
	<tr>	
		<td>
			<br>
		</td>
	</tr>
	
	<tr>
		<td align='left'> 
			<!-- <input type='submit' value='삭제하기' id="removeBtn"> -->
			<input type="button" id="removeBtn" onclick="giveUrl('${initParam.rootPath}/collection/removeCollection.do');" value="삭제하기"/>
		</td>
		<td align='right'> 
			<input type="button" id="modifyBtn" onclick="giveUrl('${initParam.rootPath}/collection/collectionModify.do');" value="수정하기"/>
		</td>

			
	<tr>
</table>
<input type="hidden" id='collectionId' name="collectionId" value='${sessionScope.group_info.collectionId}'>
<input type='hidden' name='memberIdforGrant' value='${sessionScope.login_info.memberId}'>
</form>
</body>
</html>