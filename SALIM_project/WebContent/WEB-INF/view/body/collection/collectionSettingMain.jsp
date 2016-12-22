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
/* $("#removeBtn").on("click",function(){
	
	//var message=${requestScope.grantMessage};
	

	//if(message=="")
	//{
		var selection=confirm("정말로 삭제하시겠습니까?");
		if(selection==true)
		{
			
			$.ajax({
				 "url":"${initParam.rootPath}/collection/removeCollection.do",
				 "data":"collectionId="+'${sessionScope.group_info.collectionId}',
				 "dataType":"text",
				 "success":function(obj){
					 var txt=obj.value;
					 alert(txt);
					 $("#collectionSetting").prop("action",txt);
					 $("#collectionSetting").submit();
				 },
				 "error":function(){
					 alert("실패");
				 }
			});
			
		}else
		{
			$("#collectionSetting").submit();
		}
	//}else
	//{
	//	alert(message);
	//}
	
	});	 */
});
</script>
</head>
<body>
<div class="col-md-8 col-md-offset-2"><br><br>
<h2>가계부 환경설정 </h2><br>
<form action="" id='formTag' method="POST">
<div class="form-group">
<label for="email"> &nbsp;&nbsp;*권한자만 가계부 변경이 가능합니다 .&nbsp;&nbsp;&nbsp;&nbsp;</label><br><br>
<br><label for="email"> &nbsp;&nbsp;그룹명&nbsp;&nbsp;&nbsp;&nbsp;</label>
	&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="collectionName" name="collectionName" placeholder='${sessionScope.group_info.collectionName }' value="${sessionScope.group_info.collectionName}">
</div>
  <div class="form-group">
  <br><br>
  <label for="email"> &nbsp;&nbsp;그룹 가계부 설명 &nbsp;&nbsp;&nbsp;&nbsp;</label>
 	&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id='collectionIntro' name="collectionIntro" placeholder='${sessionScope.group_info.collectionIntro }' value="${sessionScope.group_info.collectionIntro}">
  </div>
	
	<div class="form-group">
  <br><br>
  <label for="email"> &nbsp;&nbsp;그룹 가계부 권한자 &nbsp;&nbsp;&nbsp;&nbsp;</label>
  &nbsp;&nbsp;&nbsp;<input type="text" id='grantId' name='grantId' class="form-control" placeholder='${sessionScope.group_info.grantId}' value="${sessionScope.group_info.grantId}" >
  </div>
  <br>
    <input type="button" id="removeBtn" class="btn btn-md btn-danger pull-left" onclick="giveUrl('${initParam.rootPath}/collection/removeCollection.do');" value="삭제하기"/>
    <input type="button" id="modifyBtn" class="btn btn-md btn-success pull-right" onclick="giveUrl('${initParam.rootPath}/collection/collectionModify.do');" value="수정하기"/>
</form>
<form id="collectionSetting" action="" method="get"></form>
</div>
<%-- 
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

<form id="collectionSetting" action="" method="get"></form>
</body> --%>
</html>