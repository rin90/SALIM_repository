<%@ page contentType="text/html;charset=UTF-8"%>

<tr>
		 <%-- 그룹 가계부 : ${collection.collectionName }-${collection.collectionIntro }-${collection.grantId} --%>
		 <td><font color="gray" style="margin-left: 1px">${collection.collectionName }</font></td>
		 <td><font color="gray" style="margin-left: 1px">${collection.grantId}</font></td>
		 <td><font color="gray" style="margin-left: 1px">${collection.collectionIntro }</font></td>
		 <td align="right">	<button  id="okayClick" type="submit" class="btn btn-primary" >수락  </button></td>
		 <td align="right"	 >
		 
	<!-- 	  -->
			<button  id="noClick"  type="submit" class="btn btn-danger">거절  </button>
		</td>
		
		<input type="hidden" name="collectionId" value="${collection.collectionId }">
		
		<!-- <a id="okayClick"><font color="blue">수락</font></a>
		<a id="noClick"><font color="red">거절</font></a> -->
		<form action="" method="POST" id="form">
			<input type="hidden" name="collectionId" value='${collection.collectionId}'>
			<input type="hidden" name="memberId" value='${sessionScope.login_info.memberId}'>
		</form>
	
</tr>