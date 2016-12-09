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

	$(document).ready(function(){
		$('.date-picker').datepicker( {
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        dateFormat: 'yy-mm',
	        onClose: function(dateText, inst) { 
	        	alert(dateText);
	            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	            $(this).datepicker('setDate', new Date(year, month, 01));
	        }
	    });
	});
	
	
/* 	$(function() {
	    $('.date-picker').datepicker( {
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        dateFormat: 'MM yy',
	        onClose: function(dateText, inst) { 
	            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	            $(this).datepicker('setDate', new Date(year, month, 1));
	        }
	    });
	}); */

	
	</script>
	
	<style>
	.ui-datepicker-calendar {
   		display: none;
    } 
    
    
	</style>


</head>
<body>

    
  <!--   <label for="startDate">Date :</label>
    <input name="budgetDate" id="startDate" class="date-picker" /> 
	<p> -->
<%-- 	<%
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%> --%>
	<input type="text" name="budgetDate" value=>

	
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
				<td>${requestScope.findBudget.foodExpenses }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>주거/통신</td>
				<td>${requestScope.findBudget.dwellingCommunication }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>생활용품</td>
				<td>${requestScope.findBudget.householdgoods }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>의복/미용</td>
				<td>${requestScope.findBudget.clothBeauty }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>건강/문화</td>
				<td>${requestScope.findBudget.healthCulture }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>교육/육아</td>
				<td>${requestScope.findBudget.educationParenting }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>교통/차량</td>
				<td>${requestScope.findBudget.trafficVehicle }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>경조사/회비</td>
				<td>${requestScope.findBudget.holidayDues }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>세금/이자</td>
				<td>${requestScope.findBudget.taxInterest }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>용돈/기타</td>
				<td>${requestScope.findBudget.pinmoneyEtc }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>저축/보험</td>
				<td>${requestScope.findBudget.savingInsurance }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>카드대금</td>
				<td>${requestScope.findBudget.creditCard }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>미분류</td>
				<td>${requestScope.findBudget.unclassified }</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			
			
		</tbody>
		<tfoot>
			<tr>
				<td>합계</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
		</tfoot>
	
	</table>
	
	
	<input type="submit" value="저장하기"/>
	
	
</body>
</html>