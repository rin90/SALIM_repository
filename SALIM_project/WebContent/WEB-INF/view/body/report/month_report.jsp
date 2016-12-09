<%@ page contentType="text/html;charset=UTF-8"%>

<link href='${initParam.rootPath }/lib/c3-0.4.11/c3.css' rel='stylesheet'>
<script src="${initParam.rootPath }/lib/d3/d3.v3.min.js" charset="utf-8"></script>
<script src="${initParam.rootPath }/lib/c3-0.4.11/c3.min.js"></script>

<!-- 이 곳에 막대 그래프가 그려지면 됨.(지출의 대분류별, 예산과 비교해서 - 로그인한 id기준.특정 달에 소비 내역 기준.) -->
<h1 align="center">${requestScope.month} 지출내역 보고서</h1>
<div id="chart" style="width=1000px"></div>


<script type="text/javascript">
var arr = ${requestScope.result};

chart = c3.generate({
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
</script>
