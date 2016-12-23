<%@ page contentType="text/html;charset=UTF-8"%>
<%-- <%@ include file="./calendar.jsp" %> --%>

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


<jsp:include page="./schedule.jsp"></jsp:include> 

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
			selectable : true,				// 달력에서 선택할 수 있게
			selectHelper : true,			// 달력의 어느 부분이 선택되었는지 색으로 표시
			select : function(start, end){	// 날짜 선택시 수행할 일

				end.subtract(1, 'days').calendar();		// 해당하는 시점에서 1일 전을 의미.
				
				// 다이얼로그에서 사용할 수 있게 셋팅해준거지요~
 				$('#selectDate').text(start.format('YYYY-MM-DD')+' 기준');
 				
 				$('#dia_start').val(start.format('YYYY-MM-DD'));
	 			$('#dia_end').val(end.format('YYYY-MM-DD'));
	 			$( "#dialog" ).dialog("open");	
			}, 
			eventLimit: true	// Event가 많이 등록되면 +n 형식으로 표시 
		}); 
		
		
		
		// 처음 달 기준으로 받아올 때 사용
		 $.ajax({
			"url":'${initParam.rootPath}/calendar/login/reload.do',
			"dataType":"json",
			"data":{"memberId":"tester2", "date":current},
			"success":function(list){
				$("#calendar").fullCalendar("removeEvents");
				displayCalendar(list);
			}
		}); 
		
		 
		$('.fc-center').on("click", '.fc-prev-button, .fc-next-button', function(){			// 동적으로 변했을 때도 적용할 수 있게!
 			 $.ajax({
				url:"${initParam.rootPath}/calendar/login/reload.do",
				type:"post",
				data:{"memberId":"tester2", "date":$('#calendar').fullCalendar('getDate').format('YYYY-MM')},
				dataType:"json",
				success:function(list){
					$('#calendar').fullCalendar('removeEvents');
					displayCalendar(list);
				},
				error:function(request, status, error){
					alert("앞/뒤 달 관련 일정 받아오는 부분. \ncode : " + request.status + "\nerror : " + error);
				}
			}); 
		});
	});
	
	// '오늘' 버튼 눌렀을 때 처리
//	$('button')
	
	// event추가하는 부분.
	function displayCalendar(list){
		$('#calendar').fullCalendar('addEventSource', function(start, end, timezone, callback){
			 var events=[];
			 $.each(list, function(index, item){
				 if(item.start == item.end){
					 events.push({
						 id:item.no,
						 title:item.title,
						 start:item.start,
						 end:item.end,
						 allDay : true
					 }); 
				 }else{
					 var endTime = $.fullCalendar.moment(item.end).add(1, 'days');
					 events.push({
						 id:item.no,
						 title:item.title,
						 start:item.start,
						 end:endTime,
						 allDay : true
					 });
				 }
			 });
			callback(events);
		 });
	
	}
</script>





