<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="${initParam.rootPath }/lib/scripts/jquery.js"></script>
<script type="text/javascript">
/* function checkInput(form){
	if(!form.from.value){
		alert("보내는 사람 이메일 주소를 넣으세요");
		form.from.focus();
		return false;
	}else{
		if(!emailFormCheck(form.from.value)){
			alert("보내는 사람 이메일 주소의 형식을 확인하세요");
			form.from.focus();
			return false;
		}
	}
	if(!form.to.value){
		alert("받는 사람 이메일 주소를 넣으세요");
		form.to.focus();
		return false;
	}else{
		if(!emailFormCheck(form.to.value)){
			alert("받는 사람 이메일 주소의 형식을 확인하세요");
			form.to.focus();
			return false;
		}
	}
}
function emailFormCheck(email){
	// 이메일 주소를 판별하기 위한 정규식
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; 
	if(regex.test(email)===false) { 
		return false;
	}else{ 
		return true;
	}
} */
</script>
</head>
<body>
<form action="${initParam.rootPath }/sendMail.do" method="post" onsubmit="return checkInput(this);">
		<input type="hidden" name="from" value="${sessionScope.login_info.email }">
		<input type="hidden" name="to" value="dlwocks1234@naver.com">
	<table>
		<tr>
		<td><h2>문의하기</h2></td>
		</tr>
		<tr>
			<td>제목</td><td><input type="text" size="30" name="subject"></td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea rows="20" cols="70" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="메일전송">
			</td>
	</table>
</form>