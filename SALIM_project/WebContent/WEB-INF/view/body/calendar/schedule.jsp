<%@ page contentType="text/html;charset=UTF-8"%>
<style>
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
</style>
  
  
<div id="dialog" title="Basic dialog" hidden="hidden">
	<p id="selectDate" align="right"></p>
	
	<form onsubmit="return addCalendar()">
		<input type="hidden" id="dia_start" >
		<input type="hidden" id="dia_end">
		<fieldset>
<!-- 			
			<label for="name">Name</label>
			<input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
 -->			
 			<table id="scheduleTable" style="width:100%" border="1">
				<thead>
					<tr>	
						<th width="25%">종료일</th>
						<th width="30%">&nbsp;일정&nbsp;&nbsp;</th>
						<th width="45%">상세내용</th>
					</tr>
				</thead>
				<tbody id="dia_tbody">
					<tr>
						<td colspan="3" align="center">등록된 내용이 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<div align="right" id="dia_btnDiv"><button id="plusBtn" type="button">+</button></div>
			
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
		</fieldset>
	</form>
	
	<hr>
	<p>오늘의 내역</p>
	<div id="dia_totalMoney">여기에 수입 지출 총합이 나옴 되!</div>
	
	<hr>
	<p>메모</p>&nbsp;&nbsp;
	&nbsp;&nbsp;<textarea rows="10" cols="60" id="dia_memo" placeholder="메모 등록하려면 이곳에 써주세여."></textarea>
<%-- 	
	<input type="text" id="datepicker" name="incomeDate" value="${requestScope.incomeDate }" placeholder="${requestScope.incomeDate }">
 --%>
</div>

			
	<!-- 화면에서 layout잡는 부분은 다음에 하자... 데이터 가지고 오는게 더 먼저이니까. -->
	<!-- 
	<div style="width: 100%">
		<div align="left" style="width: 50%">
			왼쪽!
		</div>
		<div align="right" style="width: 50%">
			오른쪽!
		</div>
	</div>
	 -->

<!-- 다이어로그 관련 script 부분 셋팅 -->
<script>
function updateSchedule(){
	// 값을 전달해줘야하지.(DB에 저장하고 calendar에 적용시키는 일을 수행해야해.)
	alert($('#dia_start').val());	// hidden속성에 값을 지정해두고 사용할 수 있게 쓰는거짐.
	return false;
};

function loadDayCalendar(){
	var day = $('#selectDate').text().split(' ')[0];
	//alert("open");	
	//alert($('#selectDate').text().split(' ')[0]);	
	$.ajax({
		url:'${initParam.rootPath}/calendar/loadSchedule.do',
		type:"post",
		data:{"memberId":"tester2","startDate":day},
		dataType:"json",
		success:function(result){
//			alert(result.daySchedule.length);		// 0이면 등록된 일정이 없는 것
			//alert(result.daySchedule[0].title);	// list로 오니까 하나씩 접근해서 사용해.
//			alert(result.dayNote);					// null이면 등록된 Note내용이 없는 것.
			alert(result.dayIncome);
			alert(result.dayExpense);
				
			// 조회해온 값이 있는지를 확인하고 있으면 화면에 뿌리기
			if(result.daySchedule.length != 0){	// 뿌려야 하는 위치 : dia_tbody
				var turn = result.daySchedule.length;
				var str = '';
				for(var i=0; i<turn; i++){
					str += '<tr><td width="25%">'+result.daySchedule[i].end+'</td><td width="30%">'
								+result.daySchedule[i].title+'</td><td width="45%">'
								+result.daySchedule[i].detail+'</td></tr>';
				}
				$('#dia_tbody').html(str);
			}
			if(result.dayNote != null){			// 뿌릴 위치 : dia_memo
				
			}
			
		},
		error:function(request, status, error){		
			alert("code:"+request.status+"\nerror:"+error);
		}
	});	
	
};


dialog = $("#dialog").dialog({
    autoOpen: false,
    height: 700,
    width: 600,
    modal: true,
    title: "일정 등록 및 가계 내역 확인",
    resizable: false,
    closeOnEscape: true,
    closeText: '닫기',
    //hide: 'slide',
    
    open: function (event, ui) {
		// DB에서 해당하는 일에 관한 일정을 받아와야함.
		loadDayCalendar();
    },
    buttons: {
        "일정 등록": updateSchedule,
        "확인": function() {
          dialog.dialog("close");
        }
    },
    close: function() {
    	$('#dia_tbody').html('<td colspan="3" align="center">등록된 내용이 없습니다.</td>');
    }
});


$(document).ready(function(){
	$('#dia_btnDiv').on('click', '#plusBtn', function(){
		alert("plus");
	});
	
    $("#datepicker").datepicker({
	     showOtherMonths: true, 
	     selectOtherMonths: true,	
    	 yearSuffix:'년',	
	     monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],	
	     dayNamesMin:['일','월','화','수','목','금','토'],	
	     dateFormat:'yy-mm-dd',
	     showMonthAfterYear:true,
	  	 onSelect: function(dateText , inst){
  			 $("#datepicker").text(dateText),
  			location.replace("/SALIM_project/household/login/incomeSelect.do?incomeDate="+dateText);
  		 }      	
	 });
});

</script>