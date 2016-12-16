<%@ page contentType="text/html;charset=UTF-8"%>
r그래프

<link href='${initParam.rootPath }/lib/c3-0.4.11/c3.css' rel='stylesheet'>
<script src="${initParam.rootPath }/lib/d3/d3.v3.min.js" charset="utf-8"></script>
<script src="${initParam.rootPath }/lib/c3-0.4.11/c3.min.js"></script>

<!-- <script type="text/javascript">
setTimeout(function () {
    chart = c3.generate({
    	data: {
            columns: [
                ['data1', 30, 20, 50, 40, 60, 50],
                ['data2', 200, 130, 90, 240, 130, 220],
                ['data3', 300, 200, 160, 400, 250, 250],
                ['data4', 200, 130, 90, 240, 130, 220],
                ['data5', 130, 120, 150, 140, 160, 150],
                ['data6', 90, 70, 20, 50, 60, 120],
            ],
            type: 'bar',
            types: {
                data3: 'spline',
                data4: 'line',
                data6: 'area',
            },
            groups: [
                ['data1','data2']
            ]
        }
    });
}); 
</script>

<div id="chart"></div> 
 -->
 
<div id="chart" style="width=1000px"></div>
<script type="text/javascript">
var chart = c3.generate({
    data: {
        columns: [
            ['data1', 30, 200, 100, 400, 150, 250],
            ['data2', 130, 100, 140, 200, 150, 50]
        ],
        type: 'bar'
    },
    bar: {
        width: {
            ratio: 0.5 // this makes bar width 50% of length between ticks
        }
        // or
        //width: 100 // this makes bar width 100px
    }
});

setTimeout(function () {
    chart.load({
        columns: [
            ['data3', 130, -150, 200, 300, -200, 100]
        ]
    });
}, 1000);

</script>

 