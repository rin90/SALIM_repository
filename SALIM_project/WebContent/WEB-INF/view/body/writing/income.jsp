<%@page import="com.salim.vo.Member"%>
<%@page import="com.salim.vo.Collect"%>
<%@page import="java.util.Date"%>
<%@page import="com.salim.vo.Income"%>
<%@page import="com.salim.vo.Code"%>
<%@page import="java.util.List"%>
<%@page import="com.salim.service.impl.CodeServiceImpl"%>
<%@page import="com.salim.service.CodeService"%>
<%@page import="com.salim.service.impl.IncomeServiceImpl"%>
<%@page import="com.salim.service.IncomeService"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- datepicker 넣기 -->
	
	<script>
		$(document).ready(function(){
		  /* 달력 */
	      $("#datepicker").datepicker({
    	     showOtherMonths: true, 
        	 selectOtherMonths: true,	
         	 yearSuffix:'년',	
   	    	 monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],	
    	     dayNamesMin:['일','월','화','수','목','금','토'],	
    	     dateFormat:'yy-mm-dd',
    	     showMonthAfterYear:true,
     	  	 onSelect: function(dateText, inst){
       			 $("#datepicker").text(dateText),
       			 location.replace("/SALIM_project/household/login/incomeSelect.do?incomeDate="+dateText);
     	  	 
     	  	 }      	
     	 });
	      
	      /* 대분류 선택시 소분류 나오게 */
	      $(".bigCategory").on("change", function(){
				var idx = this.selectedIndex;
				var bigSel = this;
				$.ajax({
					"url":"/SALIM_project/category/smallCode.do",
					"data":{"bigCode":$(this).val()},
					"type":"post",
					"dataType":"json",
					"success":function(obj){
						var txt="<option value='1'>미분류</option>";
						$.each(obj, function(){
							txt = txt + "<option value = '"+this.smallCode+"'>"+this.smallContent+"</option>";
						});	
						$(bigSel).next().html(txt);
					},
					"beforeSend":function(){
						if(idx==0){
							$(bigSel).next().empty().append("<option value='1'>미분류</option>");
							return false;
						}
					}
				});
			});    
	      
	      /* 소분류코드를 click하면 뿌려주는 것 */
			$(".smallCategory").on("click", function(){
				var sma = this;
				$.ajax({
					"url":"/SALIM_project/category/smallCode.do",
					"data":{"bigCode":$(this).prev().val()},
					"type":"post",
					"dataType":"json",
					"success":function(obj){
						var txt="<option value='1'>미분류</option>";
						$.each(obj, function(){
								var selected = $(sma).val()==this.smallCode?"selected='selected'":"";
								txt = txt + "<option "+selected+" value = '"+this.smallCode+"'>"+this.smallContent+"</option>";
						});
						$(sma).empty().html(txt); 
					}
				});
			});
			
			/* 맨 위 체크박스 누르면 다 선택되기 */
			$("#checkAll").on("click", function(){	
				if($("#checkAll").prop("checked")){ //또는 var ch = $(this).is(":checked"); -> 체크되면 true가 뜸
					$("input[name=incomeId]").prop("checked", true);
					$("input[name=incomeId]:checked").each(function(){
						var test = $(this).val();
						if(test == 0){	
							$(this).prop("checked", false);
						}
					});
				}else{ 
					$("input[name=incomeId]").prop("checked", false);
				}
			});
			
			/* 권한자이면 클릭했을 때 수정가능하게 바꾸기 */
			$("table").contents().on("click", function(){
				var grantId = '<%=((Collect)session.getAttribute("group_info"))== null? "":((Collect)session.getAttribute("group_info")).getGrantId()%>';
				var memberId = '<%=((Member)session.getAttribute("login_info")).getMemberId()%>';
				if(grantId != "" && (grantId != memberId)){ //그룹권한자와 회원이 불일치	
				}else{
					$("input[readOnly=readOnly]").attr("readOnly", false);
					$(".bigCategory").attr("disabled", false);
					$(".smallCategory").attr("disabled", false);
				}
			});
			
			//수입내역 글자수 체크	
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
				$("input[name=incomeId]:checked").each(function(idx){
					if($(this).val() != 0){
						if($("input[name=incomeId]:checked").length-1 == idx){
							checkedArr+="incomeIdList="+$(this).val();
						}else{
							checkedArr+="incomeIdList="+$(this).val()+"&";
						}
					}
				});
				if($("input[name=incomeId]:checked").length == 0){
					alert("삭제할 것을 선택해주세요.");
				}else if($("input[name=incomeId]:checked").val()==0){
					alert("존재하지 않는 데이터입니다. 다시 선택해주세요.");
				}else{
					location.href = "/SALIM_project/household/login/incomeDelete.do?incomeDate="+$("#datepicker").val()+"&"+checkedArr;
				}
			}	
		}
		
		//저장시 숫자 포맷 체크
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
		}
	
	</script>


<body>

<form action="${initParam.rootPath }/household/login/income.do" method="post">
	
	
<div class="container text-center">
	<div class="row">
    	<div class="col-md-10">
        	<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
            	<div class="col-md-5" >
                	<!-- 달력 - 날짜 선택 -->
					<!-- <div class="row" style="margin-top: 30px; margin-bottom: 180px; margin-left:50px;"> -->
					<p>
					<input type="text" id="datepicker" name="incomeDate" value="${requestScope.incomeDate }" placeholder="${requestScope.incomeDate }">
					</p>
                </div>
                <div class="col-md-7" >
                	<!-- 오늘 수입, 지출 불러오기 -->
					<table class="table table-bordered">
						<thead>
							<tr>
								<div style="margin-bottom: 30px">
									<h1 align="left"> &lt; 수 입  작 성 &gt; </h1>
								</div>
								<td colspan="2">이번달 오늘까지 누계</td>
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
                </div>
            </div>
            <div class="col-md-12">
				<!-- 수입입력란 -->
				<table class="table table-bordered">
				
					<thead>
						<tr>
							<td colspan="4" align="left">
								<a href="${initParam.rootPath }/household/login/expenseSelect.do"><input type="button" value="지출"/></a>
								<a href="${initParam.rootPath }/household/login/incomeSelect.do"><input type="button" value="수입"/></a>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<input type="checkbox" id="checkAll"><!--체크박스 체크하면 전체 선택  -->
							</td>
							<td>수입내역</td>
							<td>수입금액</td>
							<td>수입분류</td>
						</tr>
					</tbody>
					<tfoot>
						<c:if test="${requestScope.incomeList != null }">
							<c:forEach items="${requestScope.incomeList }" var="income" varStatus="no">
								<tr>
									<td>
										<input type="checkbox" name="incomeId" value="${income.incomeId }"/>	<!-- 체크박스 하나하나 -->
										<input type="hidden" name="incomeId" value="${income.incomeId }"/>
									</td>
									<td>
										<input type="text" name="explanation" class="explane" value="${income.explanation}" readonly="readonly" placeholder="${income.explanation}">
									</td>
									<td>
										<input type="text" class="element" name="incomeMoney" value="${income.incomeMoney}" readonly="readonly" placeholder="${income.incomeMoney}">
									</td>
									<td>
										<select name="bigCategory" class="bigCategory" id="selectBig" disabled="disabled">
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
										<select name="codeId" class="smallCategory" disabled="disabled">
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
								<input type="checkbox" name="incomeId" value="0"/> <!-- 체크박스 하나하나 -->
								<input type="hidden" name="incomeId" value="0"/>
							</td>
							<td><input type="text" name="explanation" class="explane" readonly="readonly"/></td>
							<td><input type="text" name="incomeMoney" class="element" readonly="readonly"/></td>
							
							<!-- 여기서 부터 코드 선택 테이블 -->
							<td>
								<select class="bigCategory" name="bigCategory" disabled="disabled">
									<c:forEach items="${requestScope.bigCategoryList}" var="bigCategory">
										<option value="${bigCategory.bigCode}">${bigCategory.bigContent}</option>
									</c:forEach>
								</select>
								
								<select name="codeId" class="smallCategory" disabled="disabled">
									<option value="1">미분류</option>
								</select>
							</td>
						</tr>
					</c:forEach>
						
					</tfoot>
				</table>
            </div>
        </div>
        <div class="col-md-2" style="margin-top: 100px;">
        	<!-- 메모장 -->
        	<h4><메 모 란></h4>
			<textarea rows="20" cols="50" name="notes" id="notes">${requestScope.notes.content }</textarea>
			<input type="hidden" name="notesNum" value="${empty requestScope.notes.no? 0:requestScope.notes.no }">
        </div>
    
    </div>
    
    	<div class="row" >
			<div class="col-md-2" align="center">
				<!-- 저장버튼 -->
				<input type="submit" value="저장" id="submitIncome" onclick="return checkFormat()"/>
				<input type="button" value="선택삭제" id="deleteIncome" onclick="checkevent()"/>
			</div>
		</div>
    
</div>


</form>
