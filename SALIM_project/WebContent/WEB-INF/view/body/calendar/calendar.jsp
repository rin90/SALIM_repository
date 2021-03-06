<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="./calendar_header.jsp"%>
<%-- 	<jsp:include page="./calendar_header.jsp"/> --%>

<!-- 
		보내줘야 하는 값 : memberId, 년도월 (예-201611)-id:yM, textarea에 있는 값-id:goal
		ajax처리 요망
		button의 경우 내용에 변화가 있는 경우에 활성화.
-->
<script type="text/javascript">
	$(document).ready(function() {
		/* 목표 관련 등록하는 부분 */
		$("#btnRegisterGoal").on("click",function() {
			$.ajax({
				url : "${initParam.rootPath}/goal/login/applyDB.do",
				type : "post",
				data : {
					"memberId" : "tester2", //  {sessionScope.login_info.memberId}, 
					"yM" : $("#calendar").fullCalendar('getDate').format('YYYY-MM'), // 캘린더에서 현재 보고있는 년도와 달을 받아와야함.
					"goal" : $("#goal").val()
				},
				dataType : "text",
				success : function(obj) {
					// 버튼을 비활성화 시킬 수 있게. textarea를 변경 불가능하게.
					$("#goal").attr("disabled","disabled");
					$("#btnRegisterGoal").attr("hidden","hidden");
				},
				// ajax처리하는데 어떤 문제가 발생해서 제대로 수행 안된건지 확인하는 부분
				error : function(request, status, error) {
					alert("code:" + request.status + "\nerror:" + error);
				},
				beforeSend : function() {
					//alert($("#goal").val());
					if($("#goal").val().length > 333){
						alert("목표는 333자 이하로 입력해주세요.");
						$("#goal").focus();
						return false;
					}
				}
			});
		});
	
		$("#textArea").on("click", function() {
			$("#goal").removeAttr("disabled");
			$("#goal").focus();
			$("#btnRegisterGoal").removeAttr("hidden");
		});
	
	});
</script>


<div id="targetForMonth" class="form-group">
	<label for="inputdefault"> >> 이번달 목표 :</label>

	<!--   disabled="disabled"  onmouseover="" ondblclick="" -->
	<div id="textArea">
		<textarea class="form-control" name="goal" id="goal" rows="3"
			disabled="disabled" placeholder="아직 설정된 목표가 없습니다.">${requestScope.goal.goal }</textarea>
		<div align="right">
			<button class="btn-sm"
				style="border-radius: 5px !important; background-color: #fff; border: 2px solid #ddd; height: 26px; line-height: 1px;"
				id="btnRegisterGoal" hidden="true">등록</button>
		</div>
	</div>
</div>

<div id='calendar' style='margin-top: 30px; font-size: 13px'></div>

