<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<link href='${initParam.rootPath }/lib/c3-0.4.11/c3.css' rel='stylesheet'>
<script src="${initParam.rootPath }/lib/d3/d3.v3.min.js" charset="utf-8"></script>
<script src="${initParam.rootPath }/lib/c3-0.4.11/c3.min.js"></script>


<h1 align="center">${requestScope.year}년도 수입&지출 내역 보고서</h1>
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


</script>
<br>

<table id="total"></table>

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
