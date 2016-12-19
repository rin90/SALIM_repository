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
		<table id="scheduleTable" style="width:100%" border="1">
			<thead>
				<tr>
					<th hidden="hidden">일정번호</th>	
					<th width="5%"><input type="checkbox" id="allClick" ></th>
					<th width="20%">종료일</th>
					<th width="30%">&nbsp;일정&nbsp;&nbsp;</th>
					<th width="45%">상세내용</th>
				</tr>
			</thead>
			
			<tbody id="dia_tbody">
				<tr>
					<td colspan="4" align="center">등록된 내용이 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<div align="right" id="dia_btnDiv"><button id="minusBtn" type="button">-</button>&nbsp;<button id="plusBtn" type="button">+</button></div>
		
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
	
	<div id="layer"></div>	<!-- data값 확인하는 용도로 쓰인 것 -->
</div>


<!-- 다이어로그 관련 script 부분 셋팅 -->
<script>
var note='';
function test(){
	alert("test");
}

/*=================== 일정 등록 및 수정에 관한 처리하는 부분 ===========================*/
function updateSchedule(){
	var queryString = "";
	var go = false;
	
	// 메모에 관한 부분은 추가적으로 확인
	if($('#dia_memo').val().length>0 && $('#dia_memo').val()!=note){
		note = $('#dia_memo').val();
		go = true;
	}
	
	// 변경된 내용이 있는지 여부 확인
	if($('#dia_tbody tr.target input').length > 0){
		$('#dia_tbody tr.target input').each(function(idx){
			queryString += $(this).prop("name")+"="+$(this).prop("value")+"&";
		});
		go = true;
	//	$("#layer").text(queryString);
	}
	
	if(!go){	// tbody에 input태그가 존재하지 않으면 등록할 내용이 없다고 알림.
		alert("변경된 정보가 없습니다.");
		return false;
	}


 	// ajax를 통해 controller에 값을 전달해서 받아옴
	$.ajax({
		url:"${initParam.rootPath}/calendar/login/updateSchedule.do",
		type:"post",
		data:queryString+"memo="+note+"&memberId=tester2&start="+$('#dia_start').val(),	// 시작일, {번호, 마감일, 주제, 상세내용}
		dataType:"json",
		success:function(map){
			/*--------------------메모와 관련된 저장 처리----------------------*/
			if(map.memo == null){			// 뿌릴 위치 : dia_memo
				$('#dia_memo').val();
			}else{
				note = map.memo.content;
			}			

			/*--------------------캘린더와 관련된 저장 처리----------------------*/
			var result = map.list;
			
			// no값 재셋팅
			$('#dia_tbody tr.target input[name=no]').each(function(i){
				// 받아온 걸 하나씩 방문해서 해당 객체에 해당하는 no를 알아와서 값을 넣어주면되.
				if($(this).val()!=0)	// 단, 이미 존재하던 event의 경우 기존 event를 삭제 (fullcalender적용)
					$('#calendar').fullCalendar('removeEvents', result[i].no);
					
				$(this).val(result[i].no);
			});
			
			// 성공적으로 완료하는 경우 input태그들을 text로 변경해주는 작업을 수행해야함
			var index = 0;
			$('#dia_tbody tr.target').each(function(){
				$(this).children('td').first().text(result[index].end);
				$(this).children('td').first().next().text(result[index].title);
				$(this).children('td').last().text(result[index].detail);
				index++;
			});
			$('#dia_tbody tr').removeClass('target');

			
			//============= fullcalendar에도 적용시켜야함 ===============
			// 내용이 추가되는 부분에 적용할 것
			displayCalendar(result);
			$('#calendar').fullCalendar('rerenderEvents');

		}, 
		error:function(request, status, error){		
			alert("code:"+request.status+"\nerror:"+error);
		}
	});
	
	alert("변경사항 저장 완료!");
};

/*=================== 특정한 날짜(1일단위)에 해당하는 일정 불러오는 부분 ===========================*/
function loadDayCalendar(){
	var day = $('#selectDate').text().split(' ')[0];
	$.ajax({
		url:'${initParam.rootPath}/calendar/login/loadSchedule.do',
		type:"post",
		data:{"memberId":"tester2","startDate":day},
		dataType:"json",
		success:function(result){

			$('#dia_totalMoney').html('<tr><td>수입</td><td>'+result.dayIncome+'</td></tr>'
									 +'<tr><td>지출</td><td>'+result.dayExpense+'</td></tr>'
									 +'<tr><td>총액</td><td>'+(result.dayIncome-result.dayExpense)+'</td></tr>');
				
			// 조회해온 값이 있는지를 확인하고 있으면 화면에 뿌리기
			if(result.daySchedule.length != 0){	// 뿌려야 하는 위치 : dia_tbody
				var turn = result.daySchedule.length;
				var str = '';
				for(var i=0; i<turn; i++){
					str += '<tr><th hidden="hidden"><input type="hidden" name="no" value='+result.daySchedule[i].no+'></th><th width="5%"><input type="checkbox" name="minus"></th><td width="20%">'
								+result.daySchedule[i].end+'</td><td width="30%">'
								+result.daySchedule[i].title+'</td><td width="45%">'
								+result.daySchedule[i].detail+'</td></tr>';
				}
				$('#dia_tbody').html(str);
			}
			if(result.dayNote != null){			// 뿌릴 위치 : dia_memo
				$('#dia_memo').val(result.dayNote.content);
				note = result.dayNote.content;
			}
			
		},
		error:function(request, status, error){		
			alert("code:"+request.status+"\nerror:"+error);
		}
	});	
	
};

/*=================== 다이얼로그 만들 때 디테일한 설정처리 ===========================*/
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
        	// 메모가 변경됐는지, 수정된 내용이 있는지 확인
        	if($('#dia_memo').val()!=note || $('#dia_tbody tr.target input').length > 0){
        		// 확인 취소를 통해 계속 진행여부를 선택할 수 있게.
        		if(!confirm("변경사항이 저장되지 않았습니다. 계속 진행하시겠습니까?")){
        			return false;
        		}
        	}
          dialog.dialog("close");
        }
    },
    close: function() {
    	$('#dia_tbody').html('<tr><td colspan="4" align="center">등록된 내용이 없습니다.</td></tr>');
    	$('#dia_memo').val('');
		$('#dia_totalMoney').html('<tr><td>수입</td><td>0</td></tr>'
								 +'<tr><td>지출</td><td>0</td></tr>'
								 +'<tr><td>총액</td><td>0</td></tr>');
		$('#allClick').prop('checked', false);
    }
});

/*=================== 문서의 Dialog와 관련있는 창에 존재하는 Dom객체들의  event 연결 ===========================*/
$(document).ready(function(){
	
	$('#dia_btnDiv').on('click', '#plusBtn', function(){
		var txt = '<tr class="target"><th hidden="hidden"><input type="hidden" name="no" value="0"></th><th width="5%"><input type="checkbox" name="minus"></th>'
					+'<td width="20%"><input type="text" size="13" class="datepicker" name="end" value='+$("#dia_end").val()+'></td>'
					+'<td width="30%"><input type="text" size="21" name="title"></td>'
					+'<td width="45%"><input type="text" size="35" name="detail"></td></tr>';
		if($('#dia_tbody tr td:first').text()=='등록된 내용이 없습니다.'){
			$('#dia_tbody').html(txt);
		}else{
			$('#dia_tbody').append(txt);
		}
		
	});

	$('#allClick').on('click', function(){
		if($(this).is(":checked")){ 
			alert("check");
			$("#dia_tbody input[name=minus]").prop("checked", true);
		}else{ 
			alert("uncheck")
			$("#dia_tbody input[name=minus]").prop("checked", false);
		}
	});
	
	$('#dia_btnDiv').on('click', '#minusBtn', function(){
		alert('삭제할 정보들 가져오는 작업 필요');
		
		// 삭제 대상 확인 및 대상들의 정보 가져오기
		var queryString = "";
		if($('#dia_tbody input[name=minus]:checked').length == 0){
			alert("삭제할 대상이 없습니다.");
			 return false;
		}else{
			$('#dia_tbody input[name=minus]:checked').each(function(idx){
				//alert($(this).parent("th").prev().children('input').val());
				queryString += "no"+"="+$(this).parent("th").prev().children('input').val()+"&";
			});
			$("#layer").text(queryString);
		}
		
		// ajax를 통해 controller에 값을 전달해서 받아옴
		$.ajax({
			url:"${initParam.rootPath}/calendar/login/deleteSchedule.do",
			type:"post",
			data:queryString,
			dataType:"json",
			success:function(no){
				alert(no);
				
				/*--------------------dialog에 적용----------------------*/
				
				// 해당하는 곳의 dom객체들 삭제
				$('#dia_tbody input[name=minus]:checked').each(function(idx){
					$(this).parent("th").parent("tr").remove();
				});
				if($('#dia_tbody tr').length == 0){
					$('#dia_tbody').html('<tr><td colspan="4" align="center">등록된 내용이 없습니다.</td></tr>');
				}
				$('#allClick').prop('checked', false);
				
				
				//============= fullcalendar에도 적용시켜야함 ===============
				for(var i=0; i<no.length; i++){
					$('#calendar').fullCalendar('removeEvents', no[i]);
				}

			}, 
			error:function(request, status, error){		
				alert("code:"+request.status+"\nerror:"+error);
			}
		});
		

		alert("삭제 완료!");
	});
	
	$('#dia_tbody').on('click', 'tr', function(){
		// 하위에 있는 td의 text값을 input타입으로 변경 -> end, title, detail이란 name부여
		if($(this).find('td').text()=='등록된 내용이 없습니다.'){
			return false;
		}
		
		if(!$(this).children('td').last().children('input').is('input')){
			// 속성값을 하나 줘서 한번에 select할 수 있게 하는건 어떨까?
			$(this).prop("class", "target");
			
			var end = $(this).children('td').first().text();
			var title = $(this).children('td').first().next().text();
			var detail = $(this).children('td').last().text();
			// 각 td들에 input type의 tag생성
			$(this).children('td').not('input')
							.first().html('<input name="end" size="13" class="datepicker" value="'+end+'">')
							.next().html('<input name="title"  size="21" value="'+title+'">')
							.next().html('<input name="detail" size="35"  value="'+detail+'">');
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
