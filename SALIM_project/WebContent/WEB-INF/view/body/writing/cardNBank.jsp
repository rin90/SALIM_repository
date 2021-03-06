<%@page import="com.salim.vo.Member"%>
<%@page import="com.salim.vo.Collect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 15px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<script src="/SALIM_project/scripts/jquery.js"></script>
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
		
		//권한이 있으면 등록, 수정, 삭제할 수 있게 해주기
 		var grantId = '<%=((Collect)session.getAttribute("group_info"))== null? "":((Collect)session.getAttribute("group_info")).getGrantId()%>';
		var memberId = '<%=((Member)session.getAttribute("login_info")).getMemberId()%>'; 
			if(grantId != "" && (grantId != memberId)){
				alert("그룹 리더만 등록 가능합니다.");
			}else{
				$("input[readOnly=readOnly]").attr("readOnly", false);
				$("select[disabled=disabled]").attr("disabled", false);
			} 
		
		//카드&통장 설명 글자수 체크	
		$(".form-control").keyup(function(e){
			var content = $(this).val();
			if(content.length>20){
				alert("30자 이내로 작성해주세요.");
				$(this).focus();
			}
		});	
		
		//카드&통장 수정시 글자수 체크
		$(".naming").keyup(function(e){
			var content = $(this).val();
			if(content.length>20){
				alert("30자 이내로 작성해주세요.");
				$(this).focus();
			}
		});
		

	});

	var grantId = '<%=((Collect)session.getAttribute("group_info"))== null? "":((Collect)session.getAttribute("group_info")).getGrantId()%>';
	var memberId = '<%=((Member)session.getAttribute("login_info")).getMemberId()%>';
	
	//체크된 것만 값 넘기기 - 카드
	function deleteCard() {
		if(grantId != "" && (grantId != memberId)){
			alert("카드 삭제 권한이 없습니다. 해당 그룹 관리자에게 문의해주세요.");
		}else{ 
			$("select[disabled=disabled]").attr("disable", false);
			
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
		}
	};
	
	//체크된 것만 값 넘기기 - 통장
	function deleteBankbook() {
		if(grantId != "" && (grantId != memberId)){
			alert("통장 삭제 권한이 없습니다. 해당 그룹 관리자에게 문의해주세요.");
		}else{
			$("select[disabled=disabled]").attr("disable", false);
			
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
		}	
	};

	//등록 - 카드
 	function cardAddCheck() {
		if(grantId != "" && (grantId != memberId)){
			alert("카드 등록 권한이 없습니다. 해당 그룹 관리자에게 문의해주세요.");
			return false;
		}else{
			$("input[readOnly=readOnly]").attr("readOnly", false);
			$("select[disabled=disabled]").attr("disabled", false);
			if ($("#namingCard").val().trim() == "") {
				alert("설명을 입력하세요.");
				return false;
			}
		}	
	};
	
	//등록 - 통장
	function bankAddCheck(){
		if(grantId != "" && (grantId != memberId)){
			alert("카드 등록 권한이 없습니다. 해당 그룹 관리자에게 문의해주세요.");
			return false;
		}else{
			if($("#namingbank").val().trim() == ""){
				alert("설명을 입력하세요.");
				return false;
			}
		}	
	}; 
	
	//통장 목록 - 수정
	function naming2() {
		if(grantId != "" && (grantId != memberId)){
			alert("수정 권한이 없습니다. 해당 그룹 관리자에게 문의해주세요.");
			return false;
		}else{
			$("select[disable]").attr("disable", false);
			if ($(".naming").val().trim() == "") {
				alert("설명을 입력하세요.");
				return false;
			}
		}
	}; 
	 
</script>
</head>

<body>

	<div class="col-md-9 col-md-offset-2">
	
		<form action="${initParam.rootPath}/cardNBank/login/cardAdd.do"method="post">
			<h2>카드 등록</h2>
			<p><font color='gray'>사용하고 계신 신용 카드를 등록해주세요.</font></p><br>
			<div class="form-group">
				<label for="sel1">카드 목록</label>
				<select name=bankList1  disabled="disabled" class="form-control">
					<option value="기타">카드 선택</option>
					<c:forEach items="${requestScope.bankList }" var="bank">
						<option value="${bank.code }">${bank.code }</option>
					</c:forEach>
				</select>&nbsp; <br>
				<label for="sel1">카드 설명</label>
				<input class="form-control" type="text" name="cardNaming" id="namingCard" readonly="readonly" />&nbsp;&nbsp;<br>
				<input type="submit" value="등록" onclick="return cardAddCheck()" class="btn btn-default btn-md  pull-right" />
			</div>
		</form>
	
		<form action="${initParam.rootPath}/cardNBank/login/bankAdd.do" method="post">
		
			<h2>통장 등록</h2>
			<p><font color='gray'>사용하고 계신 통장을 등록해주세요.</font></p><br>
			<div class="form-group">
				<label for="sel1">통장 목록</label>
				<select name=bankList2  disabled="disabled" class="form-control">
					<option value="기타">은행 선택</option>
					<c:forEach items="${requestScope.bankList }" var="bank">
						<option value="${bank.code }">${bank.code }</option>
					</c:forEach>
				</select>&nbsp; <br>
				<label for="sel2">통장 설명</label>
				<input type="text" name="bankNaming" id="namingbank" readonly="readonly" class="form-control"/>&nbsp;&nbsp;<br>
				<input type="submit" value="등록" onclick="return bankAddCheck()" class="btn btn-default btn-md  pull-right"/>
			</div>
		</form>
	
		<form action="/SALIM_project/cardNBank/login/cardModify.do" method="post">
			<h2>등록된 카드 목록</h2><p>
			<table>
				<thead>
					<tr>
						<td><input type="checkbox" id="AllCheck"></td>
						<td><h5>&nbsp;은행명</h5></td>
						<td><h5>&nbsp;카드명</h5></td>
					</tr>
				</thead>
				<tbody id="listTbodyCard">
					<c:forEach items="${requestScope.cardList}" var="card" varStatus="no">
						<tr>
							<td>
								<input type="checkbox" name="cardId" value="${card.cardId }"> 
								<input type="hidden" name="cardList[${no.index}].cardId" value="${card.cardId }">
								<input type="hidden" name="cardList[${no.index}].memberId" value="${sessionScope.login_info.memberId }">
							</td>
							<td>
								<select name="cardList[${no.index }].cardType" disabled="disabled" class="form-control">
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
								<input type="text" name="cardList[${no.index}].cardDescription" value="${card.cardDescription}" readonly="readonly" placeholder="${card.cardDescription}" class="form-control">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="submit" value="수정" onclick="return naming2()" class="btn btn-primary pull-right">
			<input type="button" value="삭제" onclick="deleteCard()" class="btn btn-danger pull-right">					
		</form><br><br>
	
		<form action="/SALIM_project/cardNBank/login/bankModify.do" method="post">
			<h2>등록된 통장 목록</h2><p>
			<table>
				<thead>
					<tr>
						<td><input type="checkbox" id="AllCheck2"></td>
						<td><h5>&nbsp;은행명</h5></td>
						<td><h5>&nbsp;통장명</h5></td>
					</tr>
				</thead>
				<tbody id="listTbodyBank">
					<c:forEach items="${requestScope.bankBookList}" var="bank" varStatus="no">
						<tr>
							<td>
								<input type="checkbox" name="bankId" value="${bank.bankId }" > 
								<input type="hidden" name="bankList[${no.index}].bankId" value="${bank.bankId }">
								<input type="hidden" name="bankList[${no.index}].memberId" value="${sessionScope.login_info.memberId }">
							</td>
							<td>
								<select name="bankList[${no.index }].bankType" disabled="disabled" class="form-control">
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
								<input type="text" name="bankList[${no.index}].bankDescription" value="${bank.bankDescription}" 
									   readonly="readonly" placeholder="${bank.bankDescription}" class="form-control">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="submit" value="수정" onclick="return naming2()" class="btn btn-primary pull-right"> 
		    <input type="button" value="삭제" onclick="deleteBankbook()" class="btn btn-danger pull-right">
		</form><br><br>
		
	</div> 

</body>