<%@ page contentType="text/html;charset=UTF-8"%>


<ol id="selectable">
	 <li  class="ui-widget-content">
	
		 <%-- 그룹 가계부 : ${collection.collectionName }-${collection.collectionIntro }-${collection.grantId} --%>
		 *${collection.collectionName }* 그룹 가계부 초대! from.${collection.grantId}
		<input type="hidden" name="collectionId" value="${collection.collectionId }">
		<button  id="okayClick" type="submit" class="btn btn-primary">수락  <span class="badge">accept</span></button>
		<button id="noClick"  type="submit" class="btn btn-danger">거절  <span class="badge">no thanks</span></button>
		<!-- <a id="okayClick"><font color="blue">수락</font></a>
		<a id="noClick"><font color="red">거절</font></a> -->
		<form action="" method="POST" id="form">
			<input type="hidden" name="collectionId" value='${collection.collectionId}'>
			<input type="hidden" name="memberId" value='${sessionScope.login_info.memberId}'>
		</form>
	
	</li>

</ol>
