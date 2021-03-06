<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 이 곳에 막대 그래프가 그려지면 됨.(지출의 대분류별, 예산과 비교해서 - 로그인한 id기준.특정 달에 소비 내역 기준.) -->
<h2 align="center">
	<input id="monthpicker" type="text" value="${requestScope.month}"/> 지출내역 보고서
</h2>
<br>
<div id="chart" style="width=1000px"></div>
<div align="right">* 총 지출 합계 : <label id="monthSpend"></label>&nbsp;&nbsp;</div>
<hr>
<br>
<div align="center">
<h3 style="margin-bottom: 20px;">지출 Top5<small>카테고리별 </small></h3>
<table id="spend_top5_table" class="table table-condensed"></table>
</div>

<%--=================================  MonthPicker 처리하는 부분 ================================= --%>
<!-- monthpicker설정을 위한 script부분 -->
<link href="${initParam.rootPath }/lib/monthpicker/css/jquery-ui.css" rel="stylesheet" type="text/css">

<style>
	#monthpicker {
		width: 60px;
	}
	select{
		color:#000 !important;
	}
	.mtz-monthpicker-widgetcontainer{
		width: 115px !important;
	}
	#spend_top5_table{
		width: 50%;
	}
	#spend_top5_table td{
		padding: 10px;
	}
</style>
<script type="text/javascript" src="${initParam.rootPath }/lib/monthpicker/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/lib/monthpicker/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/lib/monthpicker/js/jquery.mtz.monthpicker.js"></script>



<script>
	var date = new Date();
	var m = date.getMonth()+1;
	var y = date.getFullYear();

	/* MonthPicker 옵션 */
	options = {
		pattern: 'yyyy-mm', // Default is 'mm/yyyy' and separator char is not mandatory
		selectedYear: y,
		selectedMonth: m,
		startYear: 2000,
		finalYear: 2100,
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	};
	
	/* MonthPicker Set */
	$('#monthpicker').monthpicker(options);
	
	
	/* MonthPicker 선택 이벤트 */
	$('#monthpicker').monthpicker().bind('monthpicker-click-month', function (e, month) {
		var target = $('#monthpicker').monthpicker('getDate').getFullYear() + '-' + (month<10? '0'+month : month);
		//alert($('#monthpicker').monthpicker('getDate').getFullYear() + '-' + (month<10? '0'+month : month));
		  
		$.ajax({
			url:"${initParam.rootPath}/report/login/updateMonth.do",
			type:"post",
			data:{"month":target, "memberId":"tester2"},
			dataType:"json",
			success:function(result){
				graph(result.list);
				spendMonthMoney(result.list);
				spendMoneyTop5(result.top5);
			},
			error:function(request, status, error){
				alert("code:"+request.Status+"\nerror:"+error);
			}
		});
		
	});
	
</script>
<%--============================================================================== --%>


<%--=================================  BarGraph 처리하는 부분 ================================= --%>
<!-- 막대그래프로 뿌려주는 부분 - 사용 라이브러리 : c3-0.4.11과 d3이용 -->
<link href='${initParam.rootPath }/lib/c3-0.4.11/c3.css' rel='stylesheet'>
<script src="${initParam.rootPath }/lib/d3/d3.v3.min.js" charset="utf-8"></script>
<script src="${initParam.rootPath }/lib/c3-0.4.11/c3.min.js"></script>

<script type="text/javascript">
function graph(arr){
	c3.generate({
		bindto: '#chart',
		data: {
	        json: arr,
	        type: 'bar',
	        labels: true,
	        keys: {
	        	x: 'CATEGORY',
	        	value: ['SPEND_MONEY'],
	        },
	        names: {
	        	SPEND_MONEY: '지출'
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

$(document).ready(function(){
	graph(${requestScope.result});
	spendMonthMoney(${requestScope.result});
	spendMoneyTop5(${requestScope.top5});
});

// sum Money
function spendMonthMoney(list){
	var result = 0;
	for(var i=0; i<list.length; i++){
		result += list[i].SPEND_MONEY;
	}
	$("#monthSpend").text(result.toString().replace(/\B(?=(?:\d{3})+(?!\d))/g, ',')+' 원');
}

// request에 있는 내용을 바탕으로 Table구성
function spendMoneyTop5(list){
	//alert(list.length);
	if(list.length == 0){
		$('#spend_top5_table').html('<tr align="center"><td>아직 등록된 정보가 없습니다.</td></tr>');
		return false;
	}
	//alert(list.length);
	var turn = list.length<5 ? list.length:5;
	var row = '';
	for(var i=0; i<turn; i++){
		row += '<tr align="center"><th>'+(i+1)+'위</th><td>'+list[i].BIG_CONTENT+'</td><td>'+list[i].TOTAL.toString().replace(/\B(?=(?:\d{3})+(?!\d))/g, ',')+'원</td></tr>';
	}
	$('#spend_top5_table').html(row);
}
</script>
