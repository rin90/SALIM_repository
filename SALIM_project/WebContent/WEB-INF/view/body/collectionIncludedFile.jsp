<%@ page contentType="text/html;charset=UTF-8"%>

<form action="${initParam.rootPath}/collection/setSession.do">
<input type="hidden" name="collectionId" value="${collection.collectionId }">

<tr>
		<td><font color="gray" style="margin-left: 1px">${collection.collectionName }</font></td>
		<td><font color="gray" style="margin-left: 1px">${collection.grantId}</font></td>
		<td><font color="gray" style="margin-left: 1px">${collection.collectionIntro }</font></td>
		<td align="right"><div class="col-md-3"></div></td>	
		<td>
			<!-- <input type='submit' value="이동"> -->
		    <button type="submit" class="btn btn-success pull-right">이동 </button>
		</td>
</tr>
</form>