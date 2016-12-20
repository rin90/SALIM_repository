<%@page import="com.salim.vo.Member"%>
<%@page import="com.salim.vo.Collect"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>	
<head>	
<meta charset="UTF-8">	
<title>예산 쓰기, 수정, 삭제</title>	

	<script type="text/javascript">
	
	/* 년 월만 선택하게.. */
	$(function(){

		$(".urea").attr("readOnly", true);
		
		 $('.month-picker').datepicker({
			showMonthAfterYear:true,
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
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
		            	//$("thead tr td:eq(1)").text("￦"+obj.monthIncome);	/* 전월 수입 */
		            	//$("thead tr td:eq(1)").text(obj.monthIncomeFormat);
		            	$("thead tr td:eq(1)").text("￦"+obj.monthIncomeFormat);	
		            	
		            	//지출 달 별로 가져온 것
		            	$("td input:eq(1)").val(obj.categoryExpense[7].SPEND_MONEY);
			           	$("td input:eq(4)").val(obj.categoryExpense[12].SPEND_MONEY);
			        	$("td input:eq(7)").val(obj.categoryExpense[5].SPEND_MONEY);
			        	$("td input:eq(10)").val(obj.categoryExpense[9].SPEND_MONEY);
			        	$("td input:eq(13)").val(obj.categoryExpense[0].SPEND_MONEY);
			        	$("td input:eq(16)").val(obj.categoryExpense[2].SPEND_MONEY);
			       		$("td input:eq(19)").val(obj.categoryExpense[3].SPEND_MONEY);
			       		$("td input:eq(22)").val(obj.categoryExpense[1].SPEND_MONEY);
			       		$("td input:eq(25)").val(obj.categoryExpense[6].SPEND_MONEY);
			           	$("td input:eq(28)").val(obj.categoryExpense[8].SPEND_MONEY);
			           	$("td input:eq(31)").val(obj.categoryExpense[11].SPEND_MONEY);
			           	$("td input:eq(34)").val(obj.categoryExpense[13].SPEND_MONEY);
			           	$("td input:eq(37)").val(obj.categoryExpense[4].SPEND_MONEY);
		            	
			           	//지출의 총계를 가져옴
		            	if(obj.monthExpense[0] == null){
		            		$("tfoot tr td:eq(2)").text("￦"+0);	/* 계 지출 */
		            		
		            		if(obj.budget == null){
		            			$("tfoot tr td:eq(3)").text("￦"+0);	/* 예산 - 지출 */
		            			
		            			$("td input:eq(2)").val(0);
					           	$("td input:eq(5)").val(0);
					       		$("td input:eq(8)").val(0);
						        $("td input:eq(11)").val(0);
						        $("td input:eq(14)").val(0);
						        $("td input:eq(17)").val(0);
						        $("td input:eq(20)").val(0);
						        $("td input:eq(23)").val(0);
						        $("td input:eq(26)").val(0);
						        $("td input:eq(29)").val(0);
						        $("td input:eq(32)").val(0);
						        $("td input:eq(35)").val(0);
						        $("td input:eq(38)").val(0);
		            				
		            		}else{
		            			$("tfoot tr td:eq(3)").text("￦"+(obj.budget.budget - 0));	/* 예산 - 지출 */
		            			//$("tfoot tr td:eq(3)").text("￦"+obj.budgetFormat);	
		            			//budgetFormat
		            			
		            			$("td input:eq(2)").val(obj.budget.foodExpenses-0);
					           	$("td input:eq(5)").val(obj.budget.dwellingCommunication-0);
					           	$("td input:eq(8)").val(obj.budget.householdgoods-0);
					           	$("td input:eq(11)").val(obj.budget.clothBeauty-0);
					           	$("td input:eq(14)").val(obj.budget.healthCulture-0);
					           	$("td input:eq(17)").val(obj.budget.educationParenting-0);
					           	$("td input:eq(20)").val(obj.budget.trafficVehicle-0);
					           	$("td input:eq(23)").val(obj.budget.holidayDues-0);
					           	$("td input:eq(26)").val(obj.budget.taxInterest-0);
					           	$("td input:eq(29)").val(obj.budget.pinmoneyEtc-0);
					           	$("td input:eq(32)").val(obj.budget.savingInsurance-0);
					           	$("td input:eq(35)").val(obj.budget.creditCard-0);
					           	$("td input:eq(38)").val(obj.budget.unclassified-0);
		            		}
		            	}else{ 
		            		$("tfoot tr td:eq(2)").text("￦"+obj.monthExpense[0].TOTAL);	/* 계 지출 */
		            			
		            		if(obj.budget == null){
		            			$("tfoot tr td:eq(3)").text("￦"+(0 - obj.monthExpense[0].TOTAL));
		            				
		            			$("td input:eq(2)").val(0-obj.categoryExpense[7].SPEND_MONEY);
					           	$("td input:eq(5)").val(0-obj.categoryExpense[12].SPEND_MONEY);
					           	$("td input:eq(8)").val(0-obj.categoryExpense[5].SPEND_MONEY);
					          	$("td input:eq(11)").val(0-obj.categoryExpense[9].SPEND_MONEY);
					           	$("td input:eq(14)").val(0-obj.categoryExpense[0].SPEND_MONEY);
					           	$("td input:eq(17)").val(0-obj.categoryExpense[2].SPEND_MONEY);
					           	$("td input:eq(20)").val(0-obj.categoryExpense[3].SPEND_MONEY);
					           	$("td input:eq(23)").val(0-obj.categoryExpense[1].SPEND_MONEY);
					           	$("td input:eq(26)").val(0-obj.categoryExpense[6].SPEND_MONEY);
					           	$("td input:eq(29)").val(0-obj.categoryExpense[8].SPEND_MONEY);
					           	$("td input:eq(32)").val(0-obj.categoryExpense[11].SPEND_MONEY);
					           	$("td input:eq(35)").val(0-obj.categoryExpense[13].SPEND_MONEY);
					           	$("td input:eq(38)").val(0-obj.categoryExpense[4].SPEND_MONEY);
					           		
		            		}else{
		            			$("tfoot tr td:eq(3)").text("￦"+(obj.budget.budget - obj.monthExpense[0].TOTAL));
		            			
		            			$("td input:eq(2)").val(obj.budget.foodExpenses-obj.categoryExpense[7].SPEND_MONEY);
					            $("td input:eq(5)").val(obj.budget.dwellingCommunication-obj.categoryExpense[12].SPEND_MONEY);
					           	$("td input:eq(8)").val(obj.budget.householdgoods-obj.categoryExpense[5].SPEND_MONEY);
					           	$("td input:eq(11)").val(obj.budget.clothBeauty-obj.categoryExpense[9].SPEND_MONEY);
					           	$("td input:eq(14)").val(obj.budget.healthCulture-obj.categoryExpense[0].SPEND_MONEY);
					           	$("td input:eq(17)").val(obj.budget.educationParenting-obj.categoryExpense[2].SPEND_MONEY);
					           	$("td input:eq(20)").val(obj.budget.trafficVehicle-obj.categoryExpense[3].SPEND_MONEY);
					           	$("td input:eq(23)").val(obj.budget.holidayDues-obj.categoryExpense[1].SPEND_MONEY);
					           	$("td input:eq(26)").val(obj.budget.taxInterest-obj.categoryExpense[6].SPEND_MONEY);
					           	$("td input:eq(29)").val(obj.budget.pinmoneyEtc-obj.categoryExpense[8].SPEND_MONEY);
					           	$("td input:eq(32)").val(obj.budget.savingInsurance-obj.categoryExpense[11].SPEND_MONEY);
					           	$("td input:eq(35)").val(obj.budget.creditCard-obj.categoryExpense[13].SPEND_MONEY);
					           	$("td input:eq(38)").val(obj.budget.unclassified-obj.categoryExpense[4].SPEND_MONEY);
		            			
		            		}
		            	} 
		            		
		            	//예산 달 기준으로 가져옴
		            	if(obj.budget == null){
		            		obj.budget = "{}";
		            		$("input[name=num]").val(0);
		            		$("td input:eq(0)").val(0);
			            	$("td input:eq(3)").val(0);
			            	$("td input:eq(6)").val(0);
			            	$("td input:eq(9)").val(0);
			            	$("td input:eq(12)").val(0);
			            	$("td input:eq(15)").val(0);
			            	$("td input:eq(18)").val(0);
			            	$("td input:eq(21)").val(0);
			            	$("td input:eq(24)").val(0);
			            	$("td input:eq(27)").val(0);
			            	$("td input:eq(30)").val(0);
			            	$("td input:eq(33)").val(0);
			            	$("td input:eq(36)").val(0);
			            	//$("td input:eq(39").val(0);	
			            	$("tfoot tr td:eq(1)").text("￦"+0);
		            	}else{
		            		$("input[name=num]").val(obj.budget.num);
			            	$("td input:eq(0)").val(obj.budget.foodExpenses);        	
			            	$("td input:eq(3)").val(obj.budget.dwellingCommunication);
			            	$("td input:eq(6)").val(obj.budget.householdgoods);
			            	$("td input:eq(9)").val(obj.budget.clothBeauty);
			            	$("td input:eq(12)").val(obj.budget.healthCulture);
			            	$("td input:eq(15)").val(obj.budget.educationParenting);
			            	$("td input:eq(18)").val(obj.budget.trafficVehicle);
			            	$("td input:eq(21)").val(obj.budget.holidayDues);
			            	$("td input:eq(24)").val(obj.budget.taxInterest);
			            	$("td input:eq(27)").val(obj.budget.pinmoneyEtc);
			            	$("td input:eq(30)").val(obj.budget.savingInsurance);
			            	$("td input:eq(33)").val(obj.budget.creditCard);
			            	$("td input:eq(36)").val(obj.budget.unclassified);
			            	$("tfoot tr td:eq(1)").text("￦"+obj.budget.budget);
		            	}
		            }
		           });  
		        }
		    });
	});
	
	//권한있는 자만 작성 가능
	$(document).ready(function(){
		$("table").on("click", function(){
			var grantId = '<%=((Collect)session.getAttribute("group_info"))== null? "":((Collect)session.getAttribute("group_info")).getGrantId()%>';
			var memberId = '<%=((Member)session.getAttribute("login_info")).getMemberId()%>';
			if(grantId != "" && (grantId != memberId)){ //그룹권한자와 회원이 불일치	
			}else{
				$(".element").attr("readOnly", false);
			}
		});

	});
	
	//숫자 포맷 체크
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
	
<form action="/SALIM_project/household/login/budget.do?" method="post">
	
	<input type="text" class="month-picker" name="budgetDate" value="${requestScope.budgetDate}" placeholder="${requestScope.budgetDate }">
	<p>
    
	<input type="hidden" name="num" value="${requestScope.budgetNum }">
	<input type="hidden" name="memberId" value="${empty sessionScope.group_info.collectionId? sessionScope.login_info.memberId:sessionScope.group_info.collectionId}">


	<table border="1">
		<thead>
			<tr>
				<td>전월 수입</td>
				<td>
					<fmt:formatNumber type="currency" currencySymbol="￦" value="${requestScope.monthIncome }"/>
				</td>
			</tr>
			<tr>
				<td>분류</td>
				<td>예산</td>
				<td>지출</td>
				<td>차이(예산 - 지출)</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>식비</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.foodExpenses }" name="foodExpenses" readonly="readonly" placeholder="${requestScope.budget.foodExpenses }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[7].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.foodExpenses - requestScope.categoryExpense[7].SPEND_MONEY }">	
				</td>
			</tr>
			<tr>
				<td>주거/통신</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.dwellingCommunication }" name="dwellingCommunication" readonly="readonly" placeholder="${requestScope.budget.dwellingCommunication }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[12].SPEND_MONEY }">	
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.dwellingCommunication - requestScope.categoryExpense[12].SPEND_MONEY }">	
				</td>
			</tr>
			<tr>
				<td>생활용품</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.householdgoods }" name="householdgoods" readonly="readonly" placeholder="${requestScope.budget.householdgoods }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[5].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.householdgoods - requestScope.categoryExpense[5].SPEND_MONEY }">
				</td>
			</tr>
			<tr>
				<td>의복/미용</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.clothBeauty }" name="clothBeauty" readonly="readonly" placeholder="${requestScope.budget.clothBeauty }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[9].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.clothBeauty - requestScope.categoryExpense[9].SPEND_MONEY }">	
				</td>
			</tr>
			<tr>
				<td>건강/문화</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.healthCulture }" name="healthCulture" readonly="readonly" placeholder="${requestScope.budget.healthCulture }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[0].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.healthCulture - requestScope.categoryExpense[0].SPEND_MONEY }">
				</td>
			</tr>
			<tr>
				<td>교육/육아</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.educationParenting }" name="educationParenting" readonly="readonly" placeholder="${requestScope.budget.educationParenting }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[2].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.educationParenting - requestScope.categoryExpense[2].SPEND_MONEY }">
				</td>
			</tr>
			<tr>
				<td>교통/차량</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.trafficVehicle }" name="trafficVehicle" readonly="readonly" placeholder="${requestScope.budget.trafficVehicle }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[3].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.trafficVehicle - requestScope.categoryExpense[3].SPEND_MONEY }">
				</td>
			</tr>
			<tr>
				<td>경조사/회비</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.holidayDues }" name="holidayDues" readonly="readonly" placeholder="${requestScope.budget.holidayDues }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[1].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.holidayDues - requestScope.categoryExpense[1].SPEND_MONEY }">
				</td>
			</tr>
			<tr>
				<td>세금/이자</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.taxInterest }" name="taxInterest" readonly="readonly" placeholder="${requestScope.budget.taxInterest }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[6].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.taxInterest - requestScope.categoryExpense[6].SPEND_MONEY }">
				</td>
			</tr>
			<tr>
				<td>용돈/기타</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.pinmoneyEtc }" name="pinmoneyEtc" readonly="readonly" placeholder="${requestScope.budget.pinmoneyEtc }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[8].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.pinmoneyEtc - requestScope.categoryExpense[8].SPEND_MONEY }">
				</td>
			</tr>
			<tr>
				<td>저축/보험</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.savingInsurance }" name="savingInsurance" readonly="readonly" placeholder="${requestScope.budget.savingInsurance }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[11].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.savingInsurance - requestScope.categoryExpense[11].SPEND_MONEY }">
				</td>
			</tr>
			<tr>
				<td>카드대금</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.creditCard }" name="creditCard" readonly="readonly" placeholder="${requestScope.budget.creditCard }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[13].SPEND_MONEY }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.creditCard - requestScope.categoryExpense[13].SPEND_MONEY }">
				</td>
			</tr>
			<tr>
				<td>미분류</td>
				<td>
					<input class="element" type="text" value="${empty requestScope.budget? 0:requestScope.budget.unclassified }" name="unclassified" readonly="readonly" placeholder="${requestScope.budget.unclassified }">
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.categoryExpense[4].SPEND_MONEY }">	
				</td>
				<td>
					<input type="text" class="urea" value="${requestScope.budget.unclassified - requestScope.categoryExpense[4].SPEND_MONEY }">	
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>합계</td>
				<td>
					<fmt:formatNumber type="currency" currencySymbol="￦" value="${empty requestScope.budget? 0:requestScope.budget.budget }"/>
				</td>
				<td>
					<fmt:formatNumber type="currency" currencySymbol="￦" value="${requestScope.monthExpense[0].TOTAL }"/>
				</td>
				<td>
					<fmt:formatNumber type="currency" currencySymbol="￦" value="${requestScope.budget.budget - requestScope.monthExpense[0].TOTAL }"/>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<input type="submit" value="저장하기" onclick="return check();" />
	
</form>		
	<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">
  Loading state
</button>
</body>
</html>
