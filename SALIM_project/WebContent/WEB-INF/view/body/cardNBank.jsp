<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		//전체 체크 박스 - 카드
		$("#AllCheck").on("click", function() {
			if ($("#AllCheck").prop("checked")) {
				$("input[name=cardId]").prop("checked", true);
			} else {
				$("input[name=cardId]").prop("checked", false);
			}
		})
		//전체 체크 박스 - 통장
		$("#AllCheck2").on("click", function() {
			if ($("#AllCheck2").prop("checked")) {
				$("input[name=bankId]").prop("checked", true);
			} else {
				$("input[name=bankId]").prop("checked", false);
			}
		})

	});

	//체크된 것만 값 넘기기 - 카드
	function deleteCard() {
		var checked = "";
		$("input[name=cardId]:checked").each(function(idx) {
			if ($("input[name=cardId]:checked").length - 1 == idx) {
				checked += "cardIdList=" + $(this).val();
			} else {
				checked += "cardIdList=" + $(this).val() + "&";
			}
		})
		if ($("input[name=cardId]:checked").length == 0) {
			alert("삭제할 것을 선택해주세요.");
		} else {
			location.href = "/SALIM_project/cardNBank/login/cardRemove.do?"+ checked;
		}
	};
	
	//체크된 것만 값 넘기기 - 통장
	function deleteBankbook() {
		var checked = "";
		$("input[name=bankId]:checked").each(function(idx) {
			if ($("input[name=bankId]:checked").length - 1 == idx) {
				checked += "bankIdList=" + $(this).val();
			} else {
				checked += "bankIdList=" + $(this).val() + "&";
			}
		})
		if ($("input[name=bankId]:checked").length == 0) {
			alert("삭제할 것을 선택해주세요.");
		} else {
			location.href = "/SALIM_project/cardNBank/login/bankRemove.do?"+ checked;
		}
	};

	//등록을 눌렀을 때 카드 내용 안쓰면 등록 안되게 하기
 	function cardAddCheck() {
		if ($("#namingCard").val().trim() == "") {
			alert("설명을 입력하세요.");
			return false;
		}
	};
	
	function bankAddCheck(){
		if($("#namingbank").val().trim() == ""){
			alert("설명을 입력하세요.");
			return false;
		}
	}; 

	function naming2() {
		if ($(".naming").val().trim() == "") {
			alert("설명을 입력하세요.");
			return false;
		}
	}; 
	 
</script>
</head>
<body>

	<form action="${initParam.rootPath}/cardNBank/login//cardAdd.do"method="post">
		<h2>카드 등록</h2>
		<select name=bankList1>
			<option value="기타">은행목록</option>
			<c:forEach items="${requestScope.bankList }" var="bank">
				<option value="${bank.code }">${bank.code }</option>
			</c:forEach>
		</select>&nbsp; <input type="text" name="cardNaming" id="namingCard" />&nbsp;&nbsp;
		<input type="submit" value="등록" onclick="return cardAddCheck()" />
	</form>

	<form action="${initParam.rootPath}/cardNBank/login/bankAdd.do" method="post">
		<h2>통장 등록</h2>
		<select name=bankList2>
			<option value="기타">은행목록</option>
			<c:forEach items="${requestScope.bankList }" var="bank">
				<option value="${bank.code }">${bank.code }</option>
			</c:forEach>
		</select>&nbsp; <input type="text" name="bankNaming" id="namingbank"/>&nbsp;&nbsp;
		<!-- bankNaming -->
		<input type="submit" value="등록" onclick="return bankAddCheck()"/>
	</form>

	<form action="/SALIM_project/cardNBank/login/cardModify.do" method="post">
		<h2>등록된 카드 목록</h2>
		<p>
		<table border='1' style="width: 500px;">
			<thead>
				<tr>
					<td><input type="checkbox" id="AllCheck"></td>
					<td>은행명</td>
					<td>카드명</td>
				</tr>
			</thead>
			<tbody id="listTbody">
				<c:forEach items="${requestScope.cardList}" var="card"
					varStatus="no">
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
					<td colspan="3">
						<input type="submit" value="수정" onclick="return naming2()"> 
						<input type="button" value="삭제" onclick="deleteCard()">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	<br>
	<br>


	<form action="/SALIM_project/cardNBank/login/bankModify.do" method="post">
		<h2>등록된 통장 목록</h2>
		<p>
		<table border='1' style="width: 500px;">
			<thead>
				<tr>
					<td><input type="checkbox" id="AllCheck2"></td>
					<td>은행명</td>
					<td>카드명</td>
				</tr>
			</thead>
			<tbody id="listTbody">
				<c:forEach items="${requestScope.bankBookList}" var="bank" varStatus="no">
					<tr>
						<td>
							<input type="checkbox" name="bankId" value="${bank.bankId }"> 
							<input type="hidden" name="bankList[${no.index}].bankId" value="${bank.bankId }">
							<input type="hidden" name="bankList[${no.index}].memberId" value="${sessionScope.login_info.memberId }">
						</td>
						<td>
							<select name="bankList[${no.index }].bankType">
								<option value="기타">은행목록</option>
								<c:forEach items="${requestScope.bankList }" var="bank2">
									<c:choose>
										<c:when test="${bank2.code == bank.bankType}">
											<option value="${bank2.code }" selected="selected">${bank2.code }</option>
										</c:when>
										<c:otherwise>
											<option value="${bank2.code }">${bank2.code }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
						<td>
							<input type="text" name="bankList[${no.index}].bankDescription" value="${bank.bankDescription}" placeholder="${bank.bankDescription}" class="naming">
						</td>
					</tr>
				</c:forEach>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<input type="submit" value="수정" onclick="return naming2()"> 
						<input type="button" value="삭제" onclick="deleteBankbook()">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	<br>
	<br>
</body>