<%@ page contentType="text/html;charset=UTF-8"%>
<style>
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; min-height:200px;  }
</style>
  
  
<div id="dialog" title="Basic dialog" hidden="hidden">
	<p id="selectDate" align="right"></p>

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
					<th hidden="hidden">일정번호</th>	
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
		
		
	<hr>
	<nav style="width:20%; min-height:200px;line-height: 20px;">
		<p>오늘의 내역</p>
		<table id="dia_totalMoney"></table>
	</nav>
	<section style="width:65%;min-height:100px;">
		<b>메모</b>
		&nbsp;<textarea rows="10" cols="50" id="dia_memo" name="dia_memo" placeholder="메모 등록하려면 이곳에 써주세여."></textarea>
	</section>
	<div id="layer"></div>
<%-- 	
	<input type="text" id="datepicker" name="incomeDate" value="${requestScope.incomeDate }" placeholder="${requestScope.incomeDate }">
 --%>
</div>

<!-- 다이어로그 관련 script 부분 셋팅 -->
<script>
function updateSchedule(){
	// 값을 전달해줘야하지.(DB에 저장하고 calendar에 적용시키는 일을 수행해야해.)
//	alert($('#dia_start').val());	// hidden속성에 값을 지정해두고 사용할 수 있게 쓰는거짐.
	
	// 정보들을 가지고 오는 것이 필요함.
//	alert($('#dia_tbody input[name=title]').length);	// 수정이 필요한 row의 수
//	alert($('#dia_tbody input[name=title]').val());		// 첫번째꺼 

 	// 선택한 곳의 no를 얻어오는...=ㅅ= 한개...-ㅅ-
//	var test = $('#dia_tbody').children().find('input[name=title]').first().parent('td').parent('tr').find('input[name=no]').val();
//	alert(test);
 
 	
//	alert($('#dia_tbody tr.target input').val());	// tr의 class속성이 target인 tr이 정보 등록하거나 수정하는 대상!
	
	
	
	
	//[유의] 메모에 관한 부분은 추가적으로 확인해야함.
	var queryString = "";
	if($('#dia_tbody tr.target input').length > 0){
		$('#dia_tbody tr.target input').each(function(idx){
			queryString += $(this).prop("name")+"="+$(this).prop("value")+"&";
		});
		$("#layer").text(queryString);
	}else{		// tbody에 input태그가 존재하지 않으면 등록할 내용이 없다고 알림.
		alert("등록하거나 수정할 부분이 없습니다.");		
		return false;
	}


 	// ajax를 통해 controller에 값을 전달해서 받아옴
	$.ajax({
		url:"${initParam.rootPath}/calendar/updateSchedule.do",
		type:"post",
		data:queryString+"memberId=tester2&start="+$('#dia_start').val(),	// 시작일, {번호, 마감일, 주제, 상세내용}
		dataType:"json",
		success:function(result){
			//alert(result[0].no);
			
			//var addList='';
			//var updateList='';
			
			// no값이 0인 애들은 no값 재셋팅
			$('#dia_tbody tr.target input[name=no]').each(function(i){
				// 받아온 걸 하나씩 방문해서 해당 객체에 해당하는 no를 알아와서 값을 넣어주면되.
				$(this).val(result[i].no);
				
				/* 
				if($(this).val()==0){	// 새로 추가된 애들
					$(this).val(result[i].no);
					addList += result[i];
				}else{			// 기존에 있던 애들
					updateList += result[i];
				}
				*/
				//alert($(this).val());
			});
			
			//alert($('#dia_tbody').find('td input').length);
			// 성공적으로 완료하는 경우 input태그들을 text로 변경해주는 작업을 수행해야함
			var index = 0;
			$('#dia_tbody tr.target').each(function(){
				//var end = 
				//alert($(this).children().val());
				$(this).children('td').first().text(result[index].end);
				$(this).children('td').first().next().text(result[index].title);
				$(this).children('td').last().text(result[index].detail);
				index++;
			});
			$('#dia_tbody tr').removeClass('target');
			
			
			
			//============= fullcalendar에도 적용시켜야함 ===============
			// update되는 부분은 수정할 수 있께 적용해야해.
			//.fullCalendar( 'updateEvent', events ) ??? .fullCalendar( 'getEventSourceById', id ) ??? .fullCalendar( 'refetchEventSources', sources ) ???
//			$('#calendar').( 'updateEvent', updateList );
					
			
			// 내용이 추가되는 부분에 적용할 것
		 	$('#calendar').fullCalendar('addEventSource', result);
			$('#calendar').fullCalendar('rerenderEvents');

		}, 
		error:function(request, status, error){		
			alert("code:"+request.status+"\nerror:"+error);
		}
	});
	
	//alert("변경사항 저장 완료!");
};

function loadDayCalendar(){
	var day = $('#selectDate').text().split(' ')[0];
	//alert("open");	
	$.ajax({
		url:'${initParam.rootPath}/calendar/loadSchedule.do',
		type:"post",
		data:{"memberId":"tester2","startDate":day},
		dataType:"json",
		success:function(result){
//			alert(result.daySchedule.length);		// 0이면 등록된 일정이 없는 것
//			alert(result.daySchedule[0].title);	// list로 오니까 하나씩 접근해서 사용해.
//			alert(result.dayNote);					// null이면 등록된 Note내용이 없는 것.
//			alert(result.dayIncome);
//			alert(result.dayExpense);

			$('#dia_totalMoney').html('<tr><td>수입</td><td>'+result.dayIncome+'</td></tr>'
									 +'<tr><td>지출</td><td>'+result.dayExpense+'</td></tr>'
									 +'<tr><td>총액</td><td>'+(result.dayIncome-result.dayExpense)+'</td></tr>');
				
			// 조회해온 값이 있는지를 확인하고 있으면 화면에 뿌리기
			if(result.daySchedule.length != 0){	// 뿌려야 하는 위치 : dia_tbody
				var turn = result.daySchedule.length;
				var str = '';
				for(var i=0; i<turn; i++){
					str += '<tr><th hidden="hidden"><input type="hidden" name="no" value='+result.daySchedule[i].no+'></th><td width="25%">'
								+result.daySchedule[i].end+'</td><td width="30%">'
								+result.daySchedule[i].title+'</td><td width="45%">'
								+result.daySchedule[i].detail+'</td></tr>';
			/* 		str += '<tr><td width="25%">+result.daySchedule[i].end+'</td><td width="30%">'
							+result.daySchedule[i].title+'</td><td width="45%">'
							+result.daySchedule[i].detail+'</td></tr>'; 			*/
				}
				$('#dia_tbody').html(str);
			}
			if(result.dayNote != null){			// 뿌릴 위치 : dia_memo
				$('#dia_memo').text(result.dayNote);
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
    	$('#dia_tbody').html('<tr><td colspan="3" align="center">등록된 내용이 없습니다.</td></tr>');
    	$('#dia_memo').val('');
		$('#dia_totalMoney').html('<tr><td>수입</td><td>0</td></tr>'
								 +'<tr><td>지출</td><td>0</td></tr>'
								 +'<tr><td>총액</td><td>0</td></tr>');
    }
});

/*================================================================
	tbody에 관해 수행해줘야 하는 일 List
	1. 클릭시 수정 가능한 상태로 변화		=> clear
		- 한 번에 삭제하는 부분도 셋팅
	2. + 입력시 일정추가하는 부분이 생성		=> clear
================================================================*/

$(document).ready(function(){
	$('#dia_btnDiv').on('click', '#plusBtn', function(){
//		var defaultEndDate = $("#dia_end").val();	// 종료일로 선택 된 값 의미
//		alert($('#dia_tbody tr td:first').text());
		
		var txt = '<tr class="target"><th hidden="hidden"><input type="hidden" name="no" value="0"></th>'
					+'<td><input type="text" class="datepicker" name="end" value='+$("#dia_end").val()+'></td>'
					+'<td><input type="text" name="title"></td>'
					+'<td><input type="text" name="detail"></td></tr>';
		if($('#dia_tbody tr td:first').text()=='등록된 내용이 없습니다.'){
			$('#dia_tbody').html(txt);
		}else{
			$('#dia_tbody').append(txt);
		}
		
	});

	$('#dia_tbody').on('click', 'tr', function(){
		// 하위에 있는 td의 text값을 input타입으로 변경 -> end, title, detail이란 name부여
		//alert($(this).children('td').last().children('input').is('input'));	// 해당 행의 마지막 td에 input태그가 있는지 여부 확인
		//alert($(this).children('td').last().text());	// 해당 행의 마지막 행의 text()
		//alert($(this).children('td').text());	// 해당 행의  text()
		//alert($(this).children('td').last().children('input').val());	// 해당 행의 마지막 input의 value값 의미
		//$(this).children('td').not('input').html('<input name="detail"/>');	// 선택한 행의 td의 값을 통으로 변경
		
		if(!$(this).children('td').last().children('input').is('input')){
			// 속성값을 하나 줘서 한번에 select할 수 있게 하는건 어떨까?
			$(this).prop("class", "target");
			
			var end = $(this).children('td').first().text();
			var title = $(this).children('td').first().next().text();
			var detail = $(this).children('td').last().text();
			// 각 td들에 input type의 tag생성
			$(this).children('td').not('input')
							.first().html('<input name="end" class="datepicker" value="'+end+'">')
							.next().html('<input name="title" value="'+title+'">')
							.next().html('<input name="detail" value="'+detail+'">');
		}
	});
	
	$('#dia_tbody').on('focus', '.datepicker', function(){
		$(this).datepicker({
		     showOtherMonths: true, 
		     selectOtherMonths: true,	
	    	 yearSuffix:'년',	
		     monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],	
		     dayNamesMin:['일','월','화','수','목','금','토'],	
		     dateFormat:'yy-mm-dd',
		     showMonthAfterYear:true,
		  	 onSelect: function(dateText , inst){
	  			 $(this).text(dateText); 
	  			
	  			 // 바로 다음에 있는 input에 focus를 이동시키는 로직.
	  			 // [참고] http://blog.naver.com/salmenia/220563490230
 	  			 var textboxes = $("#dia_tbody input");
	  			 var next = textboxes[textboxes.index(this)+1];
	  			 next.focus();
	  			 next.select();
	  			 event.preventDefault();	// 현재 이벤트의 기본동작을 중단한다.
	  		 }      	
		 })
		
	});
	
});

</script>


<!-- test -->
