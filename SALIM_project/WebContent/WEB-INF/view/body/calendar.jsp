<%@ page contentType="text/html;charset=UTF-8"%>

<!-- 
jQuery의   Fullcalendar
-->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="./lib/fullcalendar-3.0.1/fullcalendar.css" rel="stylesheet"/>
<link href="./lib/fullcalendar-3.0.1/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="./lib/fullcalendar-3.0.1/lib/moment.min.js"></script>
<script type="text/javascript" src="./lib/fullcalendar-3.0.1/lib/jquery.min.js"></script>
<script type="text/javascript" src="./lib/fullcalendar-3.0.1/fullcalendar.js" charset="euc-kr"></script>
<script type="text/javascript" src="./lib/fullcalendar-3.0.1/locale-all.js"></script>


<style type="text/css">
/* 월요일과 토요일 부분 색 변경 */
.fc-sun{
	color:red !important;
}
.fc-sat{
	color:blue !important;
}
</style>

<script type='text/javascript'>

	$(document).ready(function() {
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		$('#calendar').fullCalendar({
			weekends : true,	/* false인 경우 토/일 안나옴 */
			locale : "ko",
			header : {
				left : '', 
				center : 'prev, title, next',
				right : 'today, month,agendaWeek,agendaDay'  
			},
			editable : true,
			dayClick: function(date){
				alert('Day Click Event : \n' +  date);
				/* alert(date); */
			}
		
			,
			events : [ {
				title : 'All Day Event',
				start : new Date(y, m, 1)
			}, {
				title : 'Long Event',
				start : new Date(y, m, d - 5),
				end : new Date(y, m, d - 2)
			}, {
				id : 999,
				title : 'Repeating Event',
				start : new Date(y, m, d - 3, 16, 0),
				allDay : false
			}, {
				id : 999,
				title : 'Repeating Event',
				start : new Date(y, m, d + 4, 16, 0),
				allDay : false
			}, {
				title : 'Meeting',
				start : new Date(y, m, d, 10, 30),
				allDay : false
			}, {
				title : 'Lunch',
				start : new Date(y, m, d, 12, 0),
				end : new Date(y, m, d, 14, 0),
				allDay : false
			}, {
				title : 'Birthday Party',
				start : new Date(y, m, d + 1, 19, 0),
				end : new Date(y, m, d + 1, 22, 30),
				allDay : false
			}, {
				title : 'Click for Google',
				start : new Date(y, m, 28),
				end : new Date(y, m, 29),
				url : 'http://google.com/'
			} ]
			
	
		}); 

	});
</script>


	<div id="targetForMonth">
		이번달 목표 :
		<br><textarea name="monthGoals" cols="60" rows="5"> </textarea>
		 <!-- <input type="text" name="monthGoals">  -->
	</div>
	
	
	<div id='calendar' style='margin: 3em 0; font-size: 13px'></div>
	