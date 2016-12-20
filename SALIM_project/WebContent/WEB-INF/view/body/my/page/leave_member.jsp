<%@ page contentType="text/html;charset=UTF-8"%>

<link href="/SALIM_project/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript"
	src="${initParam.rootPath }/scripts/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#leaveBtn").on("click", function() {

		});

	});
</script>
<div class=" container">
	<div class="row">
		<div class="col-md-offset-3 col-md-8 ">
			<div class="colspan"
				style="margin-top: 50px; margin-bottom: 50px;">
				<h1>회원 탈퇴</h1>
			</div>
			<h5>계정을 탈퇴하게 되면 그동안 작업한 모든 프로젝트와 데이터들도 삭제되며 복구가 불가능하게 됩니다.</h5>
			<form action="${initParam.rootPath}/member/leave.do"
				onsubmit="return confirm('정말로 탈퇴하시겠습니까?')" method="post">

				<!-- 회원아이디로 요청파라미터로 hidden으로 보내고. -->
				<!-- id : <input type="text" name="memberId">
	password :<input type="text" name="password"> -->
				<input type="hidden" name="memberId"
					value='${sessionScope.login_info.memberId}'>
				<div class="col-md-offset-3" style="    margin-top: 60px;">
					<button type="submit" id='leaveBtn'
						class="btn btn-lg btn-danger pull-center">회원 탈퇴</button>
				</div>

			</form>
		</div>


	</div>



</div>

