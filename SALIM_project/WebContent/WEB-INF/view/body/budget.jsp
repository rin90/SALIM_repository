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
		         
		            $.ajax({
		            	"type":"POST",
		            	"url":"/SALIM_project/household/login/findbudgetMonth.do",
		            	"data":{"budgetDate":$(".month-picker").val()},
		            	"dataType":"json",
		            	"success":function(obj){
		            		
		            			$("tbody tr td:eq(2)").text(obj.categoryExpense[7].SPEND_MONEY);
			            		$("tbody tr td:eq(6)").text(obj.categoryExpense[12].SPEND_MONEY);
			            		$("tbody tr td:eq(10)").text(obj.categoryExpense[5].SPEND_MONEY);
			            		$("tbody tr td:eq(14)").text(obj.categoryExpense[9].SPEND_MONEY);
			            		$("tbody tr td:eq(18)").text(obj.categoryExpense[0].SPEND_MONEY);
			            		$("tbody tr td:eq(22)").text(obj.categoryExpense[2].SPEND_MONEY);
			            		$("tbody tr td:eq(26)").text(obj.categoryExpense[3].SPEND_MONEY);
			            		$("tbody tr td:eq(30)").text(obj.categoryExpense[1].SPEND_MONEY);
			            		$("tbody tr td:eq(34)").text(obj.categoryExpense[6].SPEND_MONEY);
			            		$("tbody tr td:eq(38)").text(obj.categoryExpense[8].SPEND_MONEY);
			            		$("tbody tr td:eq(42)").text(obj.categoryExpense[11].SPEND_MONEY);
			            		$("tbody tr td:eq(46)").text(obj.categoryExpense[13].SPEND_MONEY);
			            		$("tbody tr td:eq(50)").text(obj.categoryExpense[4].SPEND_MONEY);
		            		
		            		if(obj.monthExpense[0] == null){
		            			$("tfoot tr td:eq(2)").text(0);
		            		}else{ 
		            			$("tfoot tr td:eq(2)").text(obj.monthExpense[0].TOTAL);
		            		} 
		            		
		            		//기간 비교해서 과거 월이면 td의 value로 붙인다
		            		if(obj.budget == null){
		            			obj.budget = "{}";
		            			$("input[name=num]").val(0);
		            			$("td input:eq(0)").val(0);
			            		$("td input:eq(1)").val(0);
			            		$("td input:eq(2)").val(0);
			            		$("td input:eq(3)").val(0);
			            		$("td input:eq(4)").val(0);
			            		$("td input:eq(5)").val(0);
			            		$("td input:eq(6)").val(0);
			            		$("td input:eq(7)").val(0);
			            		$("td input:eq(8)").val(0);
			            		$("td input:eq(9)").val(0);
			            		$("td input:eq(10)").val(0);
			            		$("td input:eq(11)").val(0);
			            		$("td input:eq(12)").val(0);
			            		$("td input:eq(13)").val(0);	
			            		$("tfoot tr td:eq(1)").text(0);
			            		
			            		
		            		}else{
		            			$("input[name=num]").val(obj.budget.num);
			            		$("td input:eq(0)").val(obj.budget.foodExpenses);        	
			            		$("td input:eq(1)").val(obj.budget.dwellingCommunication);
			            		$("td input:eq(2)").val(obj.budget.householdgoods);
			            		$("td input:eq(3)").val(obj.budget.clothBeauty);
			            		$("td input:eq(4)").val(obj.budget.healthCulture);
			            		$("td input:eq(5)").val(obj.budget.educationParenting);
			            		$("td input:eq(6)").val(obj.budget.trafficVehicle);
			            		$("td input:eq(7)").val(obj.budget.holidayDues);
			            		$("td input:eq(8)").val(obj.budget.taxInterest);
			            		$("td input:eq(9)").val(obj.budget.pinmoneyEtc);
			            		$("td input:eq(10)").val(obj.budget.savingInsurance);
			            		$("td input:eq(11)").val(obj.budget.creditCard);
			            		$("td input:eq(12)").val(obj.budget.unclassified);
			            		$("tfoot tr td:eq(1)").text(obj.budget.budget);
		            		}
		            	}
		            });     
		        }
		    });
	});
	
	
	var inputs = window.document.getElementsByClassName("element");
	var regExp = /^[0-9]+$/;
	function check(){
		for(var i=0; i<inputs.length; i++){
			if(!(regExp.test(inputs[i].value))){
					alert("숫자만 써주세요.");
					inputs[i].focus();
					return false;	
			}
		}
		return true;
	}; 
	 
	
	</script>
	
	<style>
 		.ui-datepicker-calendar {
 	  		display: none;
 	   }  

	</style>


</head>
<body>
	
<form action="/SALIM_project/household/login/budget.do" method="post">
	
	<input type="text" class="month-picker" name="budgetDate" value="${requestScope.budgetDate}" placeholder="${requestScope.budgetDate }">
	<p>
    
	<input type="hidden" name="num" value="${requestScope.budgetNum }">
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
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.foodExpenses }" name="foodExpenses" placeholder="${requestScope.budget.foodExpenses }">
				</td>
				<td>${requestScope.categoryExpense[7].SPEND_MONEY }</td>
				<td>잔액</td>
			</tr>
			<tr>
				<td>주거/통신</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.dwellingCommunication }" name="dwellingCommunication" placeholder="${requestScope.budget.dwellingCommunication }">
				</td>
				<td>${requestScope.categoryExpense[12].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>생활용품</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.householdgoods }" name="householdgoods" placeholder="${requestScope.budget.householdgoods }">
				</td>
				<td>${requestScope.categoryExpense[5].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>의복/미용</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.clothBeauty }" name="clothBeauty" placeholder="${requestScope.budget.clothBeauty }">
				</td>
				<td>${requestScope.categoryExpense[9].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>건강/문화</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.healthCulture }" name="healthCulture" placeholder="${requestScope.budget.healthCulture }">
				</td>
				<td>${requestScope.categoryExpense[0].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>교육/육아</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.educationParenting }" name="educationParenting" placeholder="${requestScope.budget.educationParenting }">
				</td>
				<td>${requestScope.categoryExpense[2].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>교통/차량</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.trafficVehicle }" name="trafficVehicle" placeholder="${requestScope.budget.trafficVehicle }">
				</td>
				<td>${requestScope.categoryExpense[3].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>경조사/회비</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.holidayDues }" name="holidayDues" placeholder="${requestScope.budget.holidayDues }">
				</td>
				<td>${requestScope.categoryExpense[1].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>세금/이자</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.taxInterest }" name="taxInterest" placeholder="${requestScope.budget.taxInterest }">
				</td>
				<td>${requestScope.categoryExpense[6].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>용돈/기타</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.pinmoneyEtc }" name="pinmoneyEtc" placeholder="${requestScope.budget.pinmoneyEtc }">
				</td>
				<td>${requestScope.categoryExpense[8].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>저축/보험</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.savingInsurance }" name="savingInsurance" placeholder="${requestScope.budget.savingInsurance }">
				</td>
				<td>${requestScope.categoryExpense[11].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>카드대금</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.creditCard }" name="creditCard" placeholder="${requestScope.budget.creditCard }">
				</td>
				<td>${requestScope.categoryExpense[13].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>미분류</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.unclassified }" name="unclassified" placeholder="${requestScope.budget.unclassified }">
				</td>
				<td>${requestScope.categoryExpense[4].SPEND_MONEY }</td>
				<td>남은 잔액</td>
			</tr>
			
			
		</tbody>
		<tfoot>
			<tr>
				<td>합계</td>
				<td>
					<%-- <input id="tt" type="text" value="${empty requestScope.budget? 0:requestScope.budget.budget }" name="budget" placeholder="${requestScope.budget.budget }"> --%>
					${empty requestScope.budget? 0:requestScope.budget.budget }
				
				</td>
				<td>${requestScope.monthExpense[0].TOTAL }</td>
				<td>남은 잔액</td>
			</tr>
		</tfoot>
	
	</table>
	
	
	<input type="submit" value="저장하기" onclick="return check();" />
	
</form>		
	
</body>
</html>
