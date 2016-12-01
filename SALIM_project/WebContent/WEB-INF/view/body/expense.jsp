<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>	
<head>	
<meta charset="UTF-8">	
<title>Insert title here</title>	
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
</head>
<body>
	
	<!-- 달력 - 날짜 선택 -->
	<p><input type="text" id="datepicker"></p>
	
	<!-- 오늘 수입, 지출 불러오기 -->
	<table>
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
	
	
	<!-- 지출 입력란 -->
	<table>
		<thead>
			<tr>
				<td>
					<input type="button" value="지출"/>
				</td>
				<td>
					<input type="button" value="수입"/>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<input type="checkbox" value="체크박스가 다 체크되었는지 확인하는 것"/>
				</td>
				<td>날짜</td>
				<td>지출내역</td>
				<td>현금-지출액</td>
				<td>카드/통장-지출액</td>
				<td>카드/통장 분류</td>
				<td>분류</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>
					<input type="checkbox" value="하나의 행 선택여부"/>
				</td>
				<td>달력에서 클릭한 날짜</td>
				<td>지출내역-사용자가 입력</td>
				<td>현금-지출액-사용자가 입력</td>
				<td>카드/통장-지출액-사용자가 입력</td>
				<td>카드/통장 분류-조회해서 select박스로 뿌려주기</td>
				<td>분류-테이블에서 조회해서 뿌려주기</td>
			</tr>
		</tfoot>
	</table>
	
	<!-- 메모장 -->
	<textarea rows="25" cols="60"></textarea>
	
</body>
</html>