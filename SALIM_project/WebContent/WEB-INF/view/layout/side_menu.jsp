<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="today" class="java.util.Date"/>

<%-- 
<!-- 그룹 환경 설정 -->
<!-- 동적으로 생성되는 메뉴 - DB에서 collection의 grant_id와 현재 로그인한 회원의 member_id가 일치한 경우만 메뉴를 보여줌 -->
<c:if test="${sessionScope.group_info.grantId==sessionScope.login_info.memberId}">
	<a href="${initParam.rootPath }/collectionSetting.do">환경 설정</a><br>
	<a href="${initParam.rootPath }/cardNBank/login/cardNBankSelect.do">그룹 통장 관리</a><br>
	<a href="${initParam.rootPath }/collection/inviteSetting.do">그룹 멤버 관리</a><br>
</c:if>
 --%>



<div class="container">
	<div class="panel-group" id="accordion">
	
		<%-- <div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
						일정
					</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse"> <!-- in -->
				<div class="panel-body">
					<a href="${initParam.rootPath }/calendar/login/load.do">일정</a><br>
				</div>
			</div>
		</div> --%>	
		
		
		<div style="width: 18%">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse5">
						그룹 환경 설정   
					</a>
				</h4>
			</div>
			<div id="collapse5" class="panel-collapse collapse">
				<div class="panel-body">
					<c:if test="${sessionScope.group_info.grantId==sessionScope.login_info.memberId}">
						<a href="${initParam.rootPath }/collectionSetting.do"> 환경 설정</a><br>
						<a href="${initParam.rootPath }/cardNBank/login/cardNBankSelect.do"> 그룹 통장 관리</a><br>
						<a href="${initParam.rootPath }/collection/inviteSetting.do"> 그룹 멤버 관리</a><br>
					</c:if>
				</div>
			</div>
		</div>
		
		<div style="width: 18%">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
						일정
					</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse">
				<div class="panel-body">
					<a href="${initParam.rootPath }/calendar/login/load.do">  일정관리</a><br>
				</div>
			</div>
		</div>
		
		
		
		
		<div style="width: 18%">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
						등록
					</a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse">
				<div class="panel-body">
					<a href="${initParam.rootPath }/household/login/incomeSelect.do"> 수입 & 지출 등록</a><br>
					<a href="${initParam.rootPath }/household/login/findbudget.do"> 예산 등록</a><br>
					<c:if test="${sessionScope.group_info.grantId!=sessionScope.login_info.memberId}">
						<a href="${initParam.rootPath }/cardNBank/login/cardNBankSelect.do">  개인 카드/통장 등록</a><br>
					</c:if>
				</div>
			</div>
		</div>
		
		<div  style="width: 18%">	<!-- class="panel panel-default" -->
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
						보고서
					</a>
				</h4>
			</div>
			<div id="collapse3" class="panel-collapse collapse">
				<div class="panel-body">
					<a href="${initParam.rootPath }/report/login/loadMonth.do">  월 지출 내역</a><br>
					<a href="${initParam.rootPath }/report/login/loadYear.do">  연간 가계 내역</a><br>
				</div>
			</div>
		</div>
		
		<div style="width: 18%">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
						게시판
					</a>
				</h4>
			</div>
			<div id="collapse4" class="panel-collapse collapse">
				<div class="panel-body">
					<a href="${initParam.rootPath }/tip/login/list.do?page=1">  Tip게시판</a><br>
					<a href="${initParam.rootPath }/free/login/list.do?page=1">  자유게시판</a><br>
				</div>
			</div>
		</div>

		
	</div>
</div>



