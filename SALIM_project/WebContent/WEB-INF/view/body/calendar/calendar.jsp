<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="./calendar_header.jsp" %>


	<!-- 
		보내줘야 하는 값 : memberId, 년도월 (예-201611)-id:yM, textarea에 있는 값-id:goal
		ajax처리 요망
		button의 경우 내용에 변화가 있는 경우에 활성화.
	-->
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#btnRegisterGoal").on("click", function(){
			// 
			//alert($("#calendar").fullCalendar('getDate').format('YYYY-MM'));
			
			
			var date = new Date();
			var m = date.getMonth();
			var y = date.getFullYear();
			$.ajax({
				url:"${initParam.rootPath}/goal/applyDB.do",
				type:"post",
				data:{"memberId":"tester2", //  {sessionScope.login_info.memberId}, 
					"yM":$("#calendar").fullCalendar('getDate').format('YYYY-MM'),	// 캘린더에서 현재 보고있는 년도와 달을 받아와야함.
					/* "yM":"2016-12", */
					"goal":$("#goal").val()}, 
				dataType:"text",
				success:function(obj){
					// 버튼을 비활성화 시킬 수 있게. textarea를 변경 불가능하게.
					alert(obj);
					$("#goal").attr("disabled", "disabled");
					$("#btnRegisterGoal").attr("hidden", "hidden");
				},
				// ajax처리하는데 어떤 문제가 발생해서 제대로 수행 안된건지 확인하는 부분
				error:function(request, status, error){		
					alert("code:"+request.status+"\nerror:"+error);
				},
				beforeSend:function(){
					alert($("#goal").val());
				}
					
			});
			 
		
		});
		
		$("#textArea").on("click", function(){
			$("#goal").removeAttr("disabled");
			$("#goal").focus();
			$("#btnRegisterGoal").removeAttr("hidden");
		});
	});
	</script>
	
	
	<div id="targetForMonth" style="background-color: yellow;">
		이번달 목표 :<br>
		
		<!--   disabled="disabled"  onmouseover="" ondblclick="" -->
		<div id="textArea" style="background-color: blue;">
			<textarea name="goal" id="goal" cols="60" rows="5" disabled="disabled">${requestScope.goal.goal }</textarea>
			<!-- <input type="submit" value="등록">  -->
			<button id="btnRegisterGoal" hidden="true">등록</button>
		</div>
	</div>
	
	<div id='calendar' style='margin: 3em 0; font-size: 13px'></div>
	
