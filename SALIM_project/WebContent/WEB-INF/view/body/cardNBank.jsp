<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function(){
		//전체 체크 박스
		$("#AllCheck").on("click",function(){
			if($("#AllCheck").prop("checked")){
				$("input[name=cardId]").prop("checked", true);
			}
			else{
				$("input[name=cardId]").prop("checked", false);
			}
		})
		

	});
	
	//체크된 것만 값 넘기기
	function deleteCNB(){
		var checked = "";
		$("input[name=cardId]:checked").each(function(idx){
			if($("input[name=cardId]:checked").length-1 == idx){
				checked+="cardIdList="+$(this).val();
			}else{
				checked+="cardIdList="+$(this).val()+"&";
			}
		})
		if($("input[name=cardId]:checked").length == 0){
			alert("삭제할 것을 선택해주세요.");
		}else{
			location.href="/SALIM_project/cardNBank/cardNBankRemove.do?"+checked;
		}
	};
	
	//등록을 눌렀을 때 카드 내용 안쓰면 등록 안되게 하기
	function naming(){
		if($("#naming").val().trim() == ""){
			alert("설명을 입력하세요.");
			return false;
		}
	};
	
	function naming2(){
		if($(".naming").val().trim() == ""){
			alert("설명을 입력하세요.");
			return false;
		}
	};

	
</script>
</head>
<body>
   
   <form action="${initParam.rootPath}/cardNBank/cardNBankAdd.do" method="post">
  		<h2>카드 등록</h2>
      	<select name=bankList1>
      		<option value="기타">은행목록</option>
      		<c:forEach items="${requestScope.bankList }" var="bank">
      			<option value="${bank.code }">${bank.code }</option>
      		</c:forEach>
      	</select>&nbsp;
        <input type="text" name="cardNaming" id="naming"/>&nbsp;&nbsp;
   		<input type="submit" value="등록" onclick="return naming()"/>
	</form>
	
	<form action="">
   		<h2>통장 등록</h2>
   		<select name=bankList2 >
      		<option value="기타">은행목록</option>
      		<c:forEach items="${requestScope.bankList }" var="bank">
      			<option value="${bank.code }">${bank.code }</option>
      		</c:forEach>
  		</select>&nbsp;
   		<input type="text" name="bankNaming" />&nbsp;&nbsp;<!-- bankNaming -->
   		<input type="submit" value="등록"/>
   </form>
   
   <form action="/SALIM_project/cardNBank/login/cardUpdate.do" method="post">
	   <h2>등록된 카드 및 통장 목록</h2>
	   <p>
	   <table border='1' style="width: 500px;">
	      <thead>
	         <tr>
	         	<td><input type="checkbox" Id="AllCheck"></td>
	            <td>은행명</td>
	            <td>카드명</td>
	         </tr>   
	      </thead>
	      <tbody id="listTbody">
	       <c:forEach items="${requestScope.cardList}" var="card" varStatus="no">
	      	  	<tr>
	      	  	<td>
	      	  		<input type="checkbox" name="cardId" value="${card.cardId }">
	      	  		<input type="hidden" name="cardList[${no.index}].cardId" value="${card.cardId }">
	      	  		<input type="hidden" name="cardList[${no.index}].memberId" value="${sessionScope.login_info.memberId }">
	      	  	</td>
	      		<td>
	      			<select name="cardList[${no.index }].cardType">
	      				<option value="기타">은행목록</option>
	      				<c:forEach items="${requestScope.bankList }" var="bank">
	      					<c:choose>
	      						<c:when test="${bank.code == card.cardType}">
	      							<option value="${bank.code }" selected="selected">${bank.code }</option>
	      						</c:when>
	      						<c:otherwise>
	      							<option value="${bank.code }">${bank.code }</option>
	      						</c:otherwise>
	      					</c:choose>
	      				</c:forEach>
	      			</select>
	      		</td>
	      		<td>
	      			<input type="text" name="cardList[${no.index}].cardDescription" value="${card.cardDescription}" placeholder="${card.cardDescription}" class="naming">
	      		</td>
	      	</tr>
	      </c:forEach> 

	      </tbody>
	      <tfoot>
	      	<tr>
	      		<td colspan="3"><input type="submit" value="수정" onclick="return naming2()">
	      		<input type="button" value="삭제" onclick="deleteCNB()">
	      	</tr>
	      </tfoot>
	   </table>
   </form>
   <br><br>
  

</body>
