<%@page import="com.salim.vo.Member"%>
<%@page import="com.salim.vo.Collect"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>	
<head>	
<meta charset="UTF-8">	
<title>SALIM - 지출 입력</title>	

</head>
  
  <script>
	$(document).ready(function(){
		//달력
		$("#datepicker").datepicker({
			showOtherMonths:true,//다른 달도 보여주기
			selectOtherMonths:true,//다른 달도 선택할수 있게 해주기
			yerSuffix:"년",//달력에 년을 표시
			showMonthAfterYear:true,//년 뒤에 월이 오게 하기
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],//월 이름 정해주기
			dayNamesMin:['일','월','화','수','목','금','토'],//요일이름 지정
			dateFormat:'yy-mm-dd',
			onSelect:function(dateText){//선택되면 할 일 지정
				$("#datepicker").text(dateText),//입력창에 표시하기
				location.replace("/SALIM_project/household/login/expenseSelect.do?expenseDate="+dateText);
			}
		});
		
		//대분류를 선택하면 해당 소분류들이 나오게 - 아작스
		$(".bigCategory").on("change", function(){
				var idx = this.selectedIndex;
				var bigSel = this;
				$.ajax({
					"url":"/SALIM_project/category/smallCode.do",
					"data":{"bigCode":$(this).val()},
					"type":"post",
					"dataType":"json",
					"success":function(obj){
						var txt="<option value='18'>미분류</option>";
						$.each(obj, function(){
							txt = txt + "<option value = '"+this.smallCode+"'>"+this.smallContent+"</option>";
						});	
						$(bigSel).next().html(txt);
					},
					"beforeSend":function(){
						if(idx==0){
							$(bigSel).next().empty().append("<option value='18'>미분류</option>");
							return false;
						}
					}
				});
			});
		
		//소분류 클릭하면 나오게 - 아작스
		$(".smallCategory").on("click", function(){
			var sma = this;
			$.ajax({
				"url":"/SALIM_project/category/smallCode.do",
				"data":{"bigCode":$(this).prev().val()},
				"dataType":"json",
				"type":"post",
				"success":function(obj){
					var txt = "<option value='18'>미분류</option>";
					$.each(obj, function(){
						var selected = $(sma).val()==this.smallCode?"selected='selected'":"";
						txt = txt + "<option "+selected+" value = '"+this.smallCode+"'>"+this.smallContent+"</option>";
					});
					$(sma).empty().html(txt);
				}
			});
		});
		
		//맨 위의 체크박스 누르면 다 선택되게 하기
		$("#checkAll").on("click", function(){
			if($("#checkAll").prop("checked")){
				$("input[name=expenseId]").prop("checked", true);
				$("input[name=expenseId]:checked").each(function(){
					var test = $(this).val();
					if(test == 0){
						$(this).prop("checked", false);
					}
				});
			}else{
				$("input[name=expenseId]").prop("checked", false);
			}
		});
		
		/* 권한자이면 클릭했을 때 수정가능하게 바꾸기 */
		$("table").contents().on("click", function(){
			var grantId = '<%=((Collect)session.getAttribute("group_info"))== null? "":((Collect)session.getAttribute("group_info")).getGrantId()%>';
			var memberId = '<%=((Member)session.getAttribute("login_info")).getMemberId()%>';
			if(grantId != "" && (grantId != memberId)){ //그룹권한자와 회원이 불일치	
			}else{
				$("input[readOnly=readOnly]").attr("readOnly", false);
				$("select[name=cardType]").attr("disabled", false);
				$(".bigCategory").attr("disabled", false);
				$(".smallCategory").attr("disabled", false);
			}
		});
		
		//지출내역 글자수 체크
		$(".explane").keyup(function(e){
			var content = $(this).val();
			if(content.length>20){
				alert("글자수는 20자를 초과할 수 없습니다.");
				$(this).focus();
			}
		});
		
		//메모 글자수 체크
		$("#notes").keyup(function(e){
			var content = $(this).val();
			if(content.length>1000){
				alert("글자수는 1000자를 초과할 수 없습니다.");
				$(this).focus();
			}
		});
		
	});
	
	var grantId = '<%=((Collect)session.getAttribute("group_info"))== null? "":((Collect)session.getAttribute("group_info")).getGrantId()%>';
	var memberId = '<%=((Member)session.getAttribute("login_info")).getMemberId()%>';

	/* 체크된 것만 컨트롤러로 넘기기 */
	function checkevent(){
		if(grantId != "" && grantId != memberId){
			alert("삭제 권한이 없습니다. 해당 그룹 관리자에게 문의해주세요.");
		}else{
			var checkedArr = "";
			$("input[name=expenseId]:checked").each(function(idx){
				if($(this).val() != 0){
					if($("input[name=expenseId]:checked").length-1 == idx){
						checkedArr+="expenseIdList ="+$(this).val();
					}else{
						checkedArr+="expenseIdList ="+$(this).val()+"&";
					}
				}
			});
			if($("input[name=expenseId]:checked").length == 0){
				alert("삭제할 것을 선택해주세요.");
			}else if($("input[name=expenseId]:checked").val()==0){
				alert("존재하지 않는 데이터입니다. 다시 선택해주세요.");
			}else{
				var expenseIdList = {"expenseIdList":checkedArr};
				location.href = "/SALIM_project/household/login/expenseDelete.do?"+checkedArr;
			}
		}
	}
	
	//숫자 포맷 체크
	var inputs = window.document.getElementsByClassName("element");
	var regExp = /^[0-9]+$/;
	function checkFormat(){
		for(var i=0; i<inputs.length; i++){
			if(!(inputs[i].value=="") && !(regExp.test(inputs[i].value))){
					alert("숫자만 써주세요.");
					inputs[i].focus();
					return false;			
			}
		}
		$("select[disabled=disabled]").attr("disabled", false);
		return true;
	}; 
	
  </script>



</head>
<body>

<form action="/SALIM_project/household/login/expense.do" method="post">
	
	<!-- 날짜 선택창 -->
	<p>
	<input type="text" id="datepicker" name="expenseDate" value="${requestScope.expenseDate }"  placeholder="${requestScope.expenseDate }">
	</p>
	
	<!-- 오늘 수입, 지출 불러오기 -->
	<table border="1">
		<thead>
			<tr>
				<td>이번달 오늘까지 누계</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>수입</td>
				<td>
					<fmt:formatNumber type="currency" currencySymbol="￦" value="${requestScope.incomeSum }"/>
				</td>
			</tr>
			<tr>
				<td>지출</td>
				<td>
					<fmt:formatNumber type="currency" currencySymbol="￦" value="${requestScope.expenseSum }"/>
				</td>
			</tr>
			<tr>
				<td>누계</td>
				<td>
					<fmt:formatNumber type="currency" currencySymbol="￦" value="${requestScope.incomeSum - requestScope.expenseSum }"/>
				</td>
			</tr>
		</tbody>
	</table>
	
	<!-- 지출입력란 -->
	<table border="1">
		<thead>
			<tr>
				<td>
					<a href="${initParam.rootPath }/household/login/expenseSelect.do"><input type="button" value="지출"/></a>
				</td>
				<td>
					<a href="${initParam.rootPath }/household/login/incomeSelect.do"><input type="button" value="수입"/></a>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<input type="checkbox" id="checkAll"/>선택삭제 <!--체크박스 체크하면 전체 선택  -->
				</td>
				<td>지출내역</td>
				<td>현금 지출금액</td>
				<td>카드 지출금액</td>
				<td>통장/카드선택</td>	<!-- select로 뿌려주기 -->
				<td>지출분류</td>
			</tr>
		</tbody>
		<tfoot>
			<c:if test="${requestScope.expenseList != null }">
				<c:forEach items="${requestScope.expenseList }" var="expense" varStatus="no">
					<tr>
						<td>
							<input type="checkbox" name="expenseId" value="${expense.expenseId }"/>	<!-- 체크박스 하나하나 -->
							<input type="hidden" name="expenseId" value="${expense.expenseId }"/>
						</td>
						<td>
							<input type="text" class="explane" name="expenseExplain" value="${expense.expenseExplain}" readonly="readonly" placeholder="${expense.expenseExplain}">
						</td>
						<td>
							<input type="text" class="element" name="cashExpense" value="${expense.cashExpense}" readonly="readonly" placeholder="${expense.cashExpense}">
						</td>
						<td>
							<input type="text" class="element" name="cardExpense" value="${expense.cardExpense}" placeholder="${expense.cardExpense}">
						</td>
						<td>	<!-- 통장/카드 선택하는거 나오게 하기 -->
							<select name="cardType"  disabled="disabled">
								<option value="미등록">미등록</option>
								<c:forEach items="${requestScope.cardTypeList }" var="cnb">
									<c:choose>
										<c:when test="${cnb != expense.cardType}">
											<option value="${cnb}">${cnb}</option>
										</c:when>
										<c:otherwise>
											<option value="${expense.cardType}" selected="selected">${expense.cardType}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
						<td>
							<select class="bigCategory" id="selectBig"  disabled="disabled">
								<c:forEach items="${requestScope.bigCategoryList}" var="big">
									<c:choose>
										<c:when test="${big.bigCode == requestScope.selectSmallCategoryList[no.index].bigCategory.bigCode}">
											<option selected="selected" value="${big.bigCode}">${big.bigContent}</option>
										</c:when>
										<c:otherwise>
											<option value="${big.bigCode}">${big.bigContent}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<select name="codeId" class="smallCategory"  disabled="disabled">
								<option selected="selected" value="${requestScope.selectSmallCategoryList[no.index].smallCode}">${requestScope.selectSmallCategoryList[no.index].smallContent}</option>
							</select>
						</td>
					</tr>	
				</c:forEach>
			</c:if> 

		
		
		
		
		<!-- 아무 것도 안 뿌려준 입력창 -->
			<c:forEach begin="1" end="5">
				<tr>
					<td>
						<input type="checkbox" name="expenseId" value="0"/> <!-- 체크박스 하나하나 -->
						<input type="hidden" name="expenseId" value="0"/>
					</td>
					<td><input type="text" name="expenseExplain" class="explane"  readonly="readonly"/></td>
					<td><input type="text" name="cashExpense" class="element"  readonly="readonly"/></td>
					<td><input type="text" name="cardExpense" class="element"  readonly="readonly"/></td>
					<td><!-- 통장/카드 선택 -->
						<select name="cardType"  disabled="disabled">
							<option value="미등록">미등록</option>
							<c:forEach items="${requestScope.cardTypeList }" var="cnb">
								<option value="${cnb}">${cnb}</option>
							</c:forEach>
						</select>
					</td>
				
					<!-- 여기서 부터 코드 선택 테이블 -->
					<td>
						<select class="bigCategory"  disabled="disabled">
							<c:forEach items="${requestScope.bigCategoryList}" var="bigCategory">
								<option value="${bigCategory.bigCode }">${bigCategory.bigContent}</option>
							</c:forEach>
						</select>
					
						<select name="codeId" class="smallCategory"  disabled="disabled">
							<option value="18">미분류</option>
						</select>
					</td>
				</tr>
			</c:forEach>
			
		</tfoot>
	</table>
	
	<!-- 메모장 -->
	<textarea rows="25" cols="60" name="notes" id="notes">${requestScope.notes.content }</textarea>
	<input type="hidden" name="notesNum" value="${empty requestScope.notes.no? 0:requestScope.notes.no }">
	
	<!-- 저장버튼 -->
	<input type="submit" value="저장" id="submitExpense" onclick="return checkFormat();"/>
	<input type="button" value="선택삭제" id="deleteExpense" onclick="checkevent();"/>
	
</form>	
	
</body>
</html>