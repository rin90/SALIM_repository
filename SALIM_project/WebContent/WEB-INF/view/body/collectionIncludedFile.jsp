<%@ page contentType="text/html;charset=UTF-8"%>


<ol id="selectable">
	 <li  class="ui-widget-content">
	 <form action="${initParam.rootPath}/collection/setSession.do">
		 그룹 가계부 : ${collectionList.collectionName }-${collectionList.collectionIntro }
	
		<input type="hidden" name="collectionId" value="${collectionList.collectionId }">

			<input type='submit' value="이동">
		    
	
	</form>
	</li>

</ol>
