<%@ page contentType="text/html;charset=UTF-8"%>


<ol id="selectable">
	 <li  class="ui-widget-content">
	 <form action="${initParam.rootPath}/collection/setSession.do">
		 그룹 가계부 : ${collection.collectionName }-${collection.collectionIntro }-${collection.grantId}
	
		<input type="hidden" name="collectionId" value="${collection.collectionId }">

			<!-- <input type='submit' value="이동"> -->
		    <button type="submit" class="btn btn-success">이동 <span class="badge">move</span></button>
	
	</form>
	</li>

</ol>
