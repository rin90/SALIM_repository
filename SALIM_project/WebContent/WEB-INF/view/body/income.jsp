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
<!DOCTYPE html>
<html>	
<head>	
<meta charset="UTF-8">	
<title>수입 입력 화면</title>	
</head>

<!-- 여기서부터 코드  -->
	<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 기기에 맞춰서 크기를 잡으라는 말. 이것을 쓸거면 기본 meta태그를 삭제 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
	
	/* 달력 */
		$(document).ready(function(){
	      $("#datepicker").datepicker({
    	     showOtherMonths: true, /* 다른 달도 보여줌 */
        	 selectOtherMonths: true,	/* 다른 달도 선택할 수 있게 해줌 */
         	 yearSuffix:'년',	/* 달력에 년도를 표시 */
   	    	 monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],	/* 달의 이름을 지정 */
    	     dayNamesMin:['일','월','화','수','목','금','토'],	/* 요일의 이름을 지정 */
    	     dateFormat:'yy-mm-dd',
     	  	 onSelect: function(dateText , inst){
       			 $("#datepicker").text(dateText),
       			 $(".incomeDateHidden").val(dateText),
       			location.replace("/SALIM_project/household/login/incomeSelect.do?incomeDate="+dateText);
       			 
       			 //여기에 아작스 처리를 하면??
       				/* alert("시작");
       				$.ajax({
       					
       					"url":"/SALIM_project/household/login/incomeSelect.do",
       					"data":{"incomeDate":dateText},
       					"type":"post",
       					"dataType":"json",
       					"success":function(obj){//가져온 것이 income타입의 객체들...
       						alert("뭐가 나오나");
       					
       						/* request.setAttribute("incomeList", obj);
       						session.setAttribute("incomeDate", dateText);
       					}
       				});  */
       				
       		 }
       	
     	 });

		});
	</script>
	
	<script type="text/javascript">
		/* 코드 리스트 뿌려줌 - 아작스 처리 */	
		$(document).ready(function(){
			//첫번쨰 분류 선택시 소분류 조회.
			$(".bigCategory").on("change", function(){
				var idx = this.selectedIndex;
				var bigSel = this;
				//alert($(".bigCategory").val())
				$.ajax({
					"url":"/SALIM_project/category/smallCode.do",
					"data":{"bigCode":$(this).val()},
					"type":"post",
					"dataType":"json",
					"success":function(obj){
						var txt="<option>미분류</option>";
						$.each(obj, function(){
							
							txt = txt + "<option value = '"+this.smallCode+"'>"+this.smallContent+"</option>";
						});	
						$(bigSel).next().html(txt);
					},
					"beforeSend":function(){
						if(idx==0){
							$(bigSel).next().empty().append("<option>미분류</option>");
							return false;
						}
					}
				});
			});
		});
	</script>
	
<!-- 	
	<script type="text/javascript">
		/* 현재 또는 선택한 날짜로 조회해서 테이블을 유동적으로 조정하자 */
		$(document).ready(function(){
			
		//만약 조회한 것이 없다면... 테이블 10줄 뿌려주자
		//조회한 것이 있다면 조회한 것까지 합해서 10줄이 되게 뿌려주자 -> 새로 입력한 다음 새로운게 등장하려면 아작스처리
			
		/* 현재 income이 가지고 있는 code의 collection과 code을 가져오기 */
		
		
		});
	
	</script>

 -->
 	
 	<!-- 소분류코드를 click하면 뿌려주는 것 -->
	 <script type="text/javascript">
 		$(document).ready(function(){
 			$(".smallCategory").on("click", function(){
 				var idx = this.selectedIndex;
 				
 				var sma = this;
 				$.ajax({
 					"url":"/SALIM_project/category/smallCode.do",
 					"data":{"bigCode":$(this).prev().val()},
					"type":"post",
					"dataType":"json",
					"success":function(obj){
						var txt="<option value='0'>미분류</option>";
						$.each(obj, function(){
								var selected = $(sma).val()==this.smallCode?"selected='selected'":"";
								txt = txt + "<option "+selected+" value = '"+this.smallCode+"'>"+this.smallContent+"</option>";
						});
						$(sma).html(txt);
						
					}
 				});
 			});
 		});
	 </script>
	 
 	
<!--  	<script type="text/javascript">
 		$(document).ready(function(){
 			$("#submitIncome").on("click", function(){
 				$.ajax({
 					"beforeSend":function(){
 						alert($(".money").text())
 					}
 				});
 			});
 		});
 	
 	</script> -->
 	
 	
 	<!-- 맨 위 체크박스 누르면 다 선택되기 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$("#checkAll").on("click", function(){
				if($("#checkAll").prop("checked")){
					$("input[name=incomeId]").prop("checked", true);
				}else{
					$("input[name=incomeId]").prop("checked", false);
				}
			});
		});
		
		
		/* 체크된 것만 컨트롤러로 넘겨서 삭제하기 */
		


		$(document).ready(function(){
			$("#deleteIncome").on("click", function(){
				alert("클릭");
				var checkedArr = [];
				function checkIncomeId(){
					$("input [name=incomeId]:checked").each(function(i){
						checkedArr.push($(this).val());
						
					});
					if(checkedArr.length ==0){
						alert("삭제할 것을 선택해주세요");
					}
					alert("넣음")
					alert(checkedArr);
				}
				$.ajax({
					"url":"/SALIM_project/household/login/incomeDelete.do",
					"type":"post",
					"dateType":"json",
					"data":{"incomeIdList":checkedArr}
				});
			});
		});
		
	</script>

<!-- var arr = new Array(); 
$('#sel input:checkbox').each(function() {
if ($(this).is(':checked')) {
arr.push($(this).val());
}
});

if (arr.length == 0) {
alert("값을 선택하세요.");
}
else {
return arr;
} -->



	
</head>
<body>

<div id="aaaa">
	
</div>

<form action="${initParam.rootPath }/household/login/income.do" method="post" name="form1"> <!-- 원래 로그인하는 확인하는 곳으로 가야함 - interceptor -->
	
	<!-- 달력 - 날짜 선택 -->
	<p>
<%-- c:set이용해서 원하는scope에 넣을 수 있음, fmt : date..이용해 원하는 형식 지정할 수 있음 --%>
	<%-- 
	날짜 표시되는 형식을 바꾸고 싶은데.......ㅠㅠㅠㅠㅠㅠ--%>
	<%-- <fmt : formatDate value="${sessionScope.incomeDate }" pattern='yy-MM-dd'/> --%>

	<input type="text" id="datepicker" name="incomeDate" value="${sessionScope.incomeDate }" placeholder="${sessionScope.incomeDate }">
	</p>
	
	<!-- placeholder="$ { sessionScope.incomeDate }"
	<fmt : formatDate value='$ { sessionScope.incomeDate }' pattern='yy-MM-dd'/> -->
	
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
				<td>얼마 들어왔는지 누계</td>
			</tr>
			<tr>
				<td>지출</td>
				<td>얼마 나갔는지 누계</td>
			</tr>
			<tr>
				<td>누계</td>
				<td>수입-지출</td>
			</tr>
		</tbody>
	</table>
	
	
	<!-- 수입입력란 -->
	<table border="1">
		<thead>
			<tr>
				<td>
					<a href="${initParam.rootPath }/code/expense/codeList.do"><input type="button" value="지출"/></a>
				</td>
				<td>
					<a href="${initParam.rootPath }/household/login/incomeSelect.do"><input type="button" value="수입"/></a>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					삭제 <input type="checkbox" id="checkAll" value="체크박스가 다 체크되었는지 확인하는 것"/>
				</td>
				<!-- <td>날짜</td> -->
				<td>수입내역</td>
				<td>수입금액</td>
				<td>분류</td>
			</tr>
		</tbody>
		<tfoot>

			<c:if test="${requestScope.incomeList != null }">
				<c:forEach items="${requestScope.incomeList }" var="income" varStatus="no">
					<tr>
						<td>
							<input type="checkbox"/>
							<input type="hidden" name="incomeId" value="${income.incomeId }">
						</td>
						<td>
							${income.explanation}<input type="hidden" name="explanation" value="${income.explanation}">
						</td>
						<td>
							${income.incomeMoney}<input type="hidden" name="incomeMoney" value="${income.incomeMoney}" class="money">
						</td>
						<td>
							<select name="bigCategory" class="bigCategory" id="selectBig">
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
							<select name="codeId" class="smallCategory">
								<option selected="selected" value="${requestScope.selectSmallCategoryList[no.index].smallCode}">${requestScope.selectSmallCategoryList[no.index].smallContent}</option>
							</select>
						</td>
					</tr>	
				</c:forEach>
			</c:if> 

		
		
		
		
		<!-- 아무 것도 안 뿌려준 입력창 -->
			<tr>
				<td>
					<input type="checkbox"/>
					<input type="hidden" name="incomeId" value="0"/>
				</td>
					
				<td><input type="text" name="explanation"/></td>
				<td><input type="text" name="incomeMoney" class="money"/></td>
				
				<!-- 여기서 부터 코드 선택 테이블 -->
				<td>
					<select class="bigCategory">
						<c:forEach items="${requestScope.bigCategoryList}" var="bigCategory">
							<option value="${bigCategory.bigCode }">${bigCategory.bigContent}</option>
						</c:forEach>
					</select>
			
					<select name="codeId" class="smallCategory">
						<!-- <option>미분류</option> -->
					</select>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<!-- 메모장 -->
	<textarea rows="25" cols="60" name="notes"></textarea>
	
	<!-- 저장버튼 -->
	<input type="submit" value="저장" id="submitIncome"/>
	<input type="button" value="선택삭제" id="deleteIncome"/>
	
</form>
</body>
</html>