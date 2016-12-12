<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<link href='${initParam.rootPath }/lib/c3-0.4.11/c3.css' rel='stylesheet'>
<script src="${initParam.rootPath }/lib/d3/d3.v3.min.js" charset="utf-8"></script>
<script src="${initParam.rootPath }/lib/c3-0.4.11/c3.min.js"></script>

<script type="text/javascript" src="${initParam.rootPath }/scripts/jquery.js"></script>

<h1 align="center">${requestScope.year}년도</h1>
<h1 align="center">수입&지출 내역 보고서</h1>

<div id="chart" style="width=1000px"></div>

<script type="text/javascript">
//var arr = ${requestScope.totalSpend2};
var arr = ${requestScope.total2};

chart = c3.generate({
	bindto: '#chart',
	data: {
        json: arr,
        type: 'bar',
        labels: true, 
        keys: {
        	x: 'MONTH',
        	value: ['INCOME_MONTH_TOTAL', 'SPEND_MONTH_TOTAL'],	
        },
        names: {
        	INCOME_MONTH_TOTAL: '수입 금액',
        	SPEND_MONTH_TOTAL: '지출 금액'
        }
    },
    bar: {
        width: {
            ratio: 0.5 // this makes bar width 50% of length between ticks
        }
    },
 	axis: {
		x: {
			type: 'category',
		}
	}  
}); 


$(document).ready(function(){
	// 1년간의 총 수입*지출 금액
	var month = '<tr><td></td>';
	var income_month_total = '<tr style="background-color: lime;"><td>수입 총액</td>';
	var spend_month_total = '<tr style="background-color: lime;"><td>지출 총액</td>';
	var totalList = ${requestScope.total2};
	for(var i=0; i<12; i++){
		month += '<td>'+totalList[i].MONTH+'</td>';
		income_month_total += '<td>'+totalList[i].INCOME_MONTH_TOTAL +'</td>';
		spend_month_total += '<td>'+totalList[i].SPEND_MONTH_TOTAL+'</td>';
	}
	month += '</tr>';
	income_month_total += '</tr>';
	spend_month_total += '</tr>';
	$('#total').html(month+income_month_total+spend_month_total);
	
	// 수입&지출의 Detail부분 관련
/* 	var category = '<tr>';
	var income_total = '<tr>';
	var spend_money = '<tr>'; 
*/
	var iresult, sresult;
	var importList = ${requestScope.detailImport};
	var ilength = importList[0].length;
	var spendList = ${requestScope.detailSpend};
	var slength = spendList[0].length;
//	alert(importList[0][0].CATEGORY + '  ' + spendList[0][0].CATEGORY);
	
	// 수입 셋팅
	for(var j=0; j<ilength; j++){	
		iresult += '<tr>';
		for(var i=0; i<12; i++){	// 12월까지 이니까.
			if(i==0){
				iresult += '<td>'+importList[i][j].CATEGORY+'</td>';
			}
			iresult += '<td>'+importList[i][j].INCOME_TOTAL+'</td>';
		}
		iresult += '</tr>';
	}
	
	// 지출 셋팅
	for(var j=0; j<slength; j++){	
		sresult += '<tr>';
		for(var i=0; i<12; i++){	// 12월까지 이니까.
			if(i==0){
				sresult += '<td>'+spendList[i][j].CATEGORY+'</td>';
			}
			sresult += '<td>'+spendList[i][j].SPEND_MONEY+'</td>';
		}
		sresult += '</tr>';
	}
	
	$('#detail').html(month+income_month_total+iresult+spend_month_total+sresult);

});

</script>
<br>
<p><hr>
<h3>1년간의 총 수입 * 지출 금액</h3>
<table id="total" border="1" ></table>
<p><hr>
<h3>상세내역</h3>
<table id="detail" border="1" ></table>


<%-- 
<hr>
forEach문 돌렸을 때 - total <br>
<hr>
	<c:forEach begin="0" end="11" items="${requestScope.total}" var="temp">
		${temp }<br>
	</c:forEach>
<hr>
<br>

<hr>
forEach문 돌렸을 때  - 수입<br>
<hr>
	<c:forEach begin="0" end="11" items="${requestScope.detailImport}" var="temp">
		${temp }<p>
	</c:forEach>
<hr>
<br>
<hr>
forEach문 돌렸을 때  - 지출<br>
<hr>
	<c:forEach begin="0" end="11" items="${requestScope.detailSpend}" var="temp">
		${temp }<p>
	</c:forEach>
<hr>
 --%>