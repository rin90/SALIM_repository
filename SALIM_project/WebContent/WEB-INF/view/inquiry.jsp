<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="${initParam.rootPath }/lib/scripts/jquery.js"></script>
<script type="text/javascript">
/* function checkInput(form){
	if(!form.from.value){
		alert("������ ��� �̸��� �ּҸ� ��������");
		form.from.focus();
		return false;
	}else{
		if(!emailFormCheck(form.from.value)){
			alert("������ ��� �̸��� �ּ��� ������ Ȯ���ϼ���");
			form.from.focus();
			return false;
		}
	}
	if(!form.to.value){
		alert("�޴� ��� �̸��� �ּҸ� ��������");
		form.to.focus();
		return false;
	}else{
		if(!emailFormCheck(form.to.value)){
			alert("�޴� ��� �̸��� �ּ��� ������ Ȯ���ϼ���");
			form.to.focus();
			return false;
		}
	}
}
function emailFormCheck(email){
	// �̸��� �ּҸ� �Ǻ��ϱ� ���� ���Խ�
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
		<td><h2>�����ϱ�</h2></td>
		</tr>
		<tr>
			<td>����</td><td><input type="text" size="30" name="subject"></td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea rows="20" cols="70" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="��������">
			</td>
	</table>
</form>