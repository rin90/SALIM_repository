<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
<head>	
<meta charset="UTF-8">	
<title>예산 쓰기, 수정, 삭제</title>	

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">

	<script type="text/javascript">

	/* 년 월만 선택하게.. */

	$(function(){
		$.datepicker.regional['ko']={
				 prevText : '이전달',
		         nextText : '다음달',
		         monthNames : [  '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		         monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		         dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		         dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		         dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		         firstDay : 0,
		         yearSuffix : '',
		         showAnim : "slideDown"  	
		};
		$.datepicker.setDefaults( $.datepicker.regional[ "ko" ] );
		
		 $('.month-picker').datepicker({
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,
		        dateFormat: 'yy-mm',
		        onClose: function(dateText, inst) { 
		        	
		            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		            $(this).datepicker('setDate', new Date(year, month, 1));
		           // alert(dateText);
		            
		            $.ajax({
		            	"type":"POST",
		            	"url":"/SALIM_project/household/login/findbudgetMonth.do",
		            	"data":{"budgetDate":$(".month-picker").val()},
		            	"dataType":"json",
		            	"success":function(obj){
		            		var txt = $("tbody tr:eq(0) td:eq(1)").val($(obj.foodExpenses))
		            				 +$("tbody tr:eq(1) td:eq(1)").val($(obj.dwellingCommunication))
		            				 +$("tbody tr:eq(2) td:eq(1)").val($(obj.householdgoods))
		            				 +$("tbody tr:eq(3) td:eq(1)").val($(obj.clothBeauty))
		            				 +$("tbody tr:eq(4) td:eq(1)").val($(obj.healthCulture))
		            				 +$("tbody tr:eq(5) td:eq(1)").val($(obj.educationParenting))
		            				 +$("tbody tr:eq(6) td:eq(1)").val($(obj.trafficVehicle))
		            				 +$("tbody tr:eq(7) td:eq(1)").val($(obj.holidayDues))
		            				 +$("tbody tr:eq(8) td:eq(1)").val($(obj.taxInterest))
		            				 +$("tbody tr:eq(9) td:eq(1)").val($(obj.pinmoneyEtc))
		            				 +$("tbody tr:eq(10) td:eq(1)").val($(obj.savingInsurance))
		            				 +$("tbody tr:eq(11) td:eq(1)").val($(obj.creditCard))
		            				 +$("tbody tr:eq(12) td:eq(1)").val($(obj.unclassified))
		            	}
		            });    
		        }
		    });
	});
	
	
	</script>
	
	<style>
 		.ui-datepicker-calendar {
 	  		display: none;
 	   }  

	</style>


</head>
<body>
	
<form action="/SALIM_project/household/login/budget.do" method="post">
	
	<input type="text" class="month-picker" name="budgetDate" value="${requestScope.budgetDate }">
	<p>
    
  <!--   <label for="startDate">Date :</label>
    <input name="budgetDate" id="startDate" class="date-picker" /> 
	<p> -->
<%-- 	<%
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String budgetDate = sdf.format(date);
	%> 
	<%=budgetDate %> --%>
<%-- 	<input type="text" name="budgetDate" value="${requestScope.budgetDate }" id="startDate" class="date-picker">
 --%>
	
	<input type="hidden" name="num" value="0">
	<input type="hidden" name="memberId" value="${sessionScope.login_info.memberId}">	
	
	
	<table border="1">
		<thead>
			<tr>
				<td>날짜/수입</td>
				<td>날짜랑 저번달 수입나오게</td>
			</tr>
			<tr>
				<td>분류</td>
				<td>예산</td>
				<td>지출</td>
				<td>남은 돈</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>식비</td>
				<td>
					<input type="text" value="${requestScope.budget.foodExpenses }" name="foodExpenses" placeholder="${requestScope.budget.foodExpenses }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>주거/통신</td>
				<td>
					<input type="text" value="${requestScope.budget.dwellingCommunication }" name="dwellingCommunication" placeholder="${requestScope.budget.dwellingCommunication }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>생활용품</td>
				<td>
					<input type="text" value="${requestScope.budget.householdgoods }" name="householdgoods" placeholder="${requestScope.budget.householdgoods }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>의복/미용</td>
				<td>
					<input type="text" value="${requestScope.budget.clothBeauty }" name="clothBeauty" placeholder="${requestScope.budget.clothBeauty }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>건강/문화</td>
				<td>
					<input type="text" value="${requestScope.budget.healthCulture }" name="healthCulture" placeholder="${requestScope.budget.healthCulture }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>교육/육아</td>
				<td>
					<input type="text" value="${requestScope.budget.educationParenting }" name="educationParenting" placeholder="${requestScope.budget.educationParenting }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>교통/차량</td>
				<td>
					<input type="text" value="${requestScope.budget.trafficVehicle }" name="trafficVehicle" placeholder="${requestScope.budget.trafficVehicle }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>경조사/회비</td>
				<td>
					<input type="text" value="${requestScope.budget.holidayDues }" name="holidayDues" placeholder="${requestScope.budget.holidayDues }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>세금/이자</td>
				<td>
					<input type="text" value="${requestScope.budget.taxInterest }" name="taxInterest" placeholder="${requestScope.budget.taxInterest }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>용돈/기타</td>
				<td>
					<input type="text" value="${requestScope.budget.pinmoneyEtc }" name="pinmoneyEtc" placeholder="${requestScope.budget.pinmoneyEtc }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>저축/보험</td>
				<td>
					<input type="text" value="${requestScope.budget.savingInsurance }" name="savingInsurance" placeholder="${requestScope.budget.savingInsurance }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>카드대금</td>
				<td>
					<input type="text" value="${requestScope.budget.creditCard }" name="creditCard" placeholder="${requestScope.budget.creditCard }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>미분류</td>
				<td>
					<input type="text" value="${requestScope.budget.unclassified }" name="unclassified" placeholder="${requestScope.budget.unclassified }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			
			
		</tbody>
		<tfoot>
			<tr>
				<td>합계</td>
				<td>
					<input type="text" value="${requestScope.budget.budget }" name="budget" placeholder="${requestScope.budget.budget }">
				</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
		</tfoot>
	
	</table>
	
	
	<input type="submit" value="저장하기"/>
	
	
</form>		
	
</body>
</html>