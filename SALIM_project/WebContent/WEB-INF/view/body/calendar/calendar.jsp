<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="./calendar_header.jsp" %>


	<%-- <form action="" method="post">
		<input type="hidden" name="memberId" value="${sessionScope.memberId }"> --%>
		<div id="targetForMonth" style="background-color: yellow;">
			이번달 목표 :<br>
			<textarea name="monthGoals" cols="60" rows="5">${requestScope.monthGoals }</textarea>
			<!-- <input type="submit" value="등록">  -->
			<button id="btnRegisterGoal">등록</button>
		</div>
	<!-- </form> -->
	
	<div id='calendar' style='margin: 3em 0; font-size: 13px'></div>
	
