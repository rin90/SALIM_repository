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
		$("#budgetDate").datepicker({
			changeMonth:true,
			changeYear:true,
			//monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			//showMonthAfterYear:true,
			showButtonPanel:true,
			dateFormat: 'MM yy',
			onClose:function(dateText, inst){
				alert(dateText);
				$("#budgetDate").text(dateText);
			}
		});
	});
    	/* $('.date-picker').datepicker( {
  	    	changeMonth: true,
    	    changeYear: true,
        	showButtonPanel: true,
        	dateFormat: 'yy-MM',
        	onClose: function(dateText, inst) { 
            	var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            	var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            	$(this).datepicker('budgetDate', new Date(year, month, 1));
        	}
    	});
	}); */
	
	
	
	/* $(document).ready(function () {
	    $.datepicker.regional['ko'] = {
	        closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	        '7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        weekHeader: 'Wk',
	        dateFormat: 'yy-mm-dd',
	        firstDay: 0,
	        isRTL: false,
	        showMonthAfterYear: true,
	        yearSuffix: '',
	        showOn: 'both',
	        buttonText: "달력",
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        yearRange: 'c-99:c+99'
	    };
	    $.datepicker.setDefaults($.datepicker.regional['ko']);
	 
	    var datepicker_default = {
	        showOn: 'both',
	        buttonText: "달력",
	        currentText: "이번달",
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        yearRange: 'c-99:c+99',
	        showOtherMonths: true,
	        selectOtherMonths: true
	    }
	 
	    datepicker_default.closeText = "선택";
	    datepicker_default.dateFormat = "yy-mm";
	    datepicker_default.onClose = function (dateText, inst) {
	        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	        $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
	        $(this).datepicker('setDate', new Date(year, month, 1));
	    }
	 
	    datepicker_default.beforeShow = function () {
	        var selectDate = $("#sdate").val().split("-");
	        var year = Number(selectDate[0]);
	        var month = Number(selectDate[1]) - 1;
	        $(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
	    }
	 
	    $("#sdate").datepicker(datepicker_default);
	}); */
	
	
	
	</script>
	
	<style>
	.ui-datepicker-calendar {
   		display: none;
    } 
    
    
  /*   table.ui-datepicker-calendar { display:none; } */
    
	</style>


</head>
<body>

	<label for="startDate">Date :</label>
    <input type="text" name="budgetDate" id="budgetDate" />


	<!-- <input type="text" name="sdate" id="sdate" size="7" maxlength="7" class="hasDatepicker">
	<button type="button" class="ui-datepicker-trigger">달력</button>
	<br> -->
	
	
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
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>주거/통신</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>생활용품</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>의복/미용</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>건강/문화</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>교육/육아</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>교통/차량</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>경조사/회비</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>세금/이자</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>용돈/기타</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>저축/보험</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>카드대금</td>
				<td>예산액</td>
				<td>지출액</td>
				<td>남은 잔액</td>
			</tr>
			<tr>
				<td>미분류</td>
				<td>예산액</td>
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