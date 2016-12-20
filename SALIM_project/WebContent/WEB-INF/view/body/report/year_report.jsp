<%@ page contentType="text/html;charset=UTF-8"%>

<link href='${initParam.rootPath }/lib/c3-0.4.11/c3.css' rel='stylesheet'>
<script src="${initParam.rootPath }/lib/d3/d3.v3.min.js" charset="utf-8"></script>
<script src="${initParam.rootPath }/lib/c3-0.4.11/c3.min.js"></script>

<script type="text/javascript" src="${initParam.rootPath }/lib/scripts/jquery.js"></script>

<h2 align="center">
 	 <button class="btn btn-success btn-sm" onclick="updateYear($('#year').text()-1)">◀ </button> 
	  &nbsp;<label id="year">${requestScope.year}</label>년도&nbsp;
 	 <button class="btn btn-success btn-sm" onclick="updateYear(+$('#year').text()+1)"> ▶</button> 	<!-- jQuery의 경우 +연산자의 피연산자들 중 하나가 문자열이면 문자열 잇기 수행. -->
</h2>
<h2 align="center">수입 & 지출 내역 보고서</h2>

<div id="chart" style="width=1000px"></div>

<script type="text/javascript">
function barGraph(arr){
	c3.generate({
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
}
function updateYear(year){
//	alert($("#year").text());	// 년도 표시하는 곳의 text값
	$.ajax({
		url:"${initParam.rootPath}/report/login/updateYear.do",
		type:"post",
		data:{"year":year, "memberId":"tester2"},
		dataType:"json",		// 오카지...? 항상 text로 받을 수밖에 없...ㅠㅜ
		success:function(result){
			$("#year").html(year);
			barGraph(result.total);
			display(result.total, result.detailImport, result.detailSpend);
		},
		error:function(request, status, error){
			alert("code:"+request.Status+"\nerror:"+error);
		}
	});
}

function display(totalList, importList, spendList){
	// 1년간의 총 수입*지출 금액
	var month = '<tr><td></td>';
	var income_month_total = '<tr style="background-color: lime;"><td>수입 총액</td>';
	var spend_month_total = '<tr style="background-color: lime;"><td>지출 총액</td>';

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
	var iresult, sresult;
	var ilength = importList[0].length;
	var slength = spendList[0].length;
	
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
	
	// table에 조회 내역 출력
	$('#detail').html(month+income_month_total+iresult+spend_month_total+sresult);
	
}
 
// 처음 Controller를 통해 넘어온 경우 초기 세팅.(현재 달 기준)
$(document).ready(function(){
	barGraph(${requestScope.total});
	display(${requestScope.total}, ${requestScope.detailImport}, ${requestScope.detailSpend});
});

</script>

<br>
<p><hr>
<h3>1년간의 총 수입 * 지출 금액</h3>
<table id="total" border="1"  class="table table-striped"></table>
<p><hr>
<h3>상세내역</h3>
<table id="detail" border="1"  class="table table-striped"></table>
