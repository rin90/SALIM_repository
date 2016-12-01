<%@page import="com.salim.vo.Code"%>
<%@page import="java.util.List"%>
<%@page import="com.salim.service.impl.CodeServiceImpl"%>
<%@page import="com.salim.service.CodeService"%>
<%@page import="com.salim.service.impl.IncomeServiceImpl"%>
<%@page import="com.salim.service.IncomeService"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>	
<head>	
<meta charset="UTF-8">	
<title>수입 입력 화면</title>	
</head>

<!-- 여기서부터 코드  -->
	<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 기기에 맞춰서 크기를 잡으라는 말. 이것을 쓸거면 기본 meta태그를 삭제 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	
	/* 달력 */
	$(document).ready(function(){
		$("#datepicker").datepicker({
			showOtherMonths: true,
			selectOtherMonths: true,
			dateFormat:'yy년 mm월 dd일',
			yearSuffix:'년',
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin:['일','월','화','수','목','금','토']
		});
	});
	
	
		
	</script>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			//첫번쨰 분류 선택시 소분류 조회.
			$("#firstCode").on("change", function(){
				var idx = this.selectedIndex;
				$.ajax({
					"url":"/SALIM_project/code/small/codeList.do",
					"data":{"secondCode":$("#firstCode").val()},
					"type":"post",
					"dataType":"json",
					"success":function(obj){
						alert(obj);
						var txt="<option>미분류</option>";
						$.each(obj, function(){
							txt = txt + "<option value = '"+this.id+"'>"+this.code+"</option>";
						});
						$("#secondCode").html(txt);
					},
					"beforeSend":function(){
						if(idx==0){
							$("#secondCode").empty().append("<option>미분류</option>");
							return false;
						}
					}
				});
			});
		});
		
	</script>

	
</head>
<body>
<form action="/SALIM_project/household/login/income.do" method="">
	
	<!-- 달력 - 날짜 선택 -->
	<p><input type="text" id="datepicker"></p>
	
	<!-- 오늘 수입, 지출 불러오기 -->
	<table border="1">
		<thead>
			<tr>
				<td>이번달 오늘까지 누계</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>수입</td>
				<td>얼마 들어왔는지 누계</td>
			</tr>
			<tr>
				<td>지출</td>
				<td>얼마 나갔는지 누계</td>
			</tr>
			<tr>
				<td>누계</td>
				<td>수입-지출</td>
			</tr>
		</tbody>
	</table>
	
	
	<!-- 수입입력란 -->
	<table border="1">
		<thead>
			<tr>
				<td>
					<a href="${initParam.rootPath }/code/expense/codeList.do"><input type="button" value="지출"/></a>
				</td>
				<td>
					<a href="${initParam.rootPath }/code/income/codeList.do"><input type="button" value="수입"/></a>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<input type="checkbox" value="체크박스가 다 체크되었는지 확인하는 것"/>
				</td>
				<td>날짜</td>
				<td>수입내역</td>
				<td>수입금액</td>
				<td>분류</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>
					<input type="checkbox" value="하나의 행 선택여부"/>
				</td>
				<td>달력에서 클릭한 날짜</td>
				<td><input type="text" name="explanation"/></td>
				<td><input type="text" name="incomeMoney"/></td>
				<td>
					<select name="firstCode" id="firstCode">
						<c:forEach items="${requestScope.codeList }" var="codeVO">
							<option value="${codeVO.code }">${codeVO.code }</option>
						</c:forEach>
					</select>
					<select name="secondCode" id="secondCode">
						<option>미분류</option>
					</select>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<!-- 메모장 -->
	<textarea rows="25" cols="60" name="notes"></textarea>
	
	<!-- 저장버튼 -->
	<input type="button" value="저장"/>
	<input type="button" value="선택삭제"/>
	
</form>
</body>
</html>