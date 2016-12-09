<%@ page contentType="text/html;charset=UTF-8"%>


<!-- 
jQuery의   Fullcalendar

경로 지정시 유의 사항 : 상대 경로의 경우 호출된 곳을 기준으로 탐색하기 때문에 단순이동,
				 컨트롤러를 통한 이동등 다양한 형식으로 사용하는 경우 직접경로로 명시해야 한다.
-->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${initParam.rootPath }/lib/fullcalendar-3.0.1/fullcalendar.css" rel="stylesheet"/>
<link href="${initParam.rootPath }/lib/fullcalendar-3.0.1/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="${initParam.rootPath }/lib/fullcalendar-3.0.1/lib/moment.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/lib/fullcalendar-3.0.1/lib/jquery.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/lib/fullcalendar-3.0.1/fullcalendar.js" charset="euc-kr"></script>
<script type="text/javascript" src="${initParam.rootPath }/lib/fullcalendar-3.0.1/locale-all.js"></script>


<style type="text/css">
/* 월요일과 토요일 부분 색 변경 */
.fc-sun{
	color:red !important;
}
.fc-sat{
	color:blue !important;
}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div id="dialog" title="Basic dialog">
  <p>짠!</p>
</div>

<script type='text/javascript'>

	$(document).ready(function() {

		var today = new Date();
		var current = today.getFullYear()+'-'+(today.getMonth()+1);
		
		$('#calendar').fullCalendar({
			weekends : true,	
			locale : "ko",
			header : {
				left : 'today', 
				center : 'prev, title, next',
				right : 'month,listMonth'
			},
			editable : true,
			selectable : true,		// 달력에서 선택할 수 있게
			selectHelper : true,	// 달력의 어느 부분이 선택되었는지 색으로 표시
 			select : function(start, end){	// 날짜 선택시 수행할 일
 				$( "#dialog" ).dialog();
 				/* var title = prompt('Event Title : ');
				var eventDate;
				if(title) {
					eventDate = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventDate, true);
				}
				$('#calendar').fullCalendar('unselect'); */
			}, 
			eventLimit: true	// Event가 많이 등록되면 +n 형식으로 표시 
		}); 
		
		// 처음 달 기준으로 받아올 때 사용.
		$.ajax({
			"url":'${initParam.rootPath}/calendar/reload.do',
			"dataType":"json",
			"data":{"memberId":"tester2", "date":current},
			"success":function(list){
				$("#calendar").fullCalendar("addEventSource", list);
			}
		});
		
		
 		$('.fc-center').on("click", '.fc-prev-button, .fc-next-button', function(){			// 동적으로 변했을 때도 적용할 수 있게!
	 			$.ajax({
					url:"${initParam.rootPath}/calendar/reload.do",
					type:"post",
					data:{"memberId":"tester2", "date":$('#calendar').fullCalendar('getDate').format('YYYY-MM')},
					dataType:"json",
					success:function(list){
						$('#calendar').fullCalendar('removeEvents');
						$('#calendar').fullCalendar('addEventSource', list);
					},
					error:function(request, status, error){
						alert("앞/뒤 달 관련 일정 받아오는 부분. \ncode : " + request.status + "\nerror : " + error);
					}
				});
		});
	});
</script>





