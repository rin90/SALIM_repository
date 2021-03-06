<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="today" class="java.util.Date"/>

<div class="container" style="min-height: 1300px;">
	<div class="panel-group" id="accordion">
		

		<!-- 로그인시 본인과 그룹 간을 이동할 수 있는 select박스 -->
			<div style="width: 18%">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse6">
							빠른 이동
						</a>
					</h4>
				</div>
				<div id="collapse6" class="panel-collapse collapse">
					<div class="panel-body">
						<c:if test="${sessionScope.login_info != null }">
							<a href="${initParam.rootPath }/collection/moving.do?selectId=${sessionScope.login_info}">개인 가계부</a><br>
								<c:forEach items="${sessionScope.groupList }" var="collection">
									<a href="${initParam.rootPath }/collection/moving.do?selectId=${collection.collectionId }">${collection.collectionName }</a><br>
								</c:forEach>
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
					<a href="${initParam.rootPath }/household/login/expenseSelect.do">  수입 & 지출 등록</a><br>
					<a href="${initParam.rootPath }/household/login/findbudget.do">  예산 등록</a><br>
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
					<a href="${initParam.rootPath }/free/login/list.do?page=1">  자유게시판</a><br>
					<a href="${initParam.rootPath }/tip/login/list.do?page=1">  Tip게시판</a><br>
				</div>
			</div>
		</div>
		
		<c:choose>
			<c:when test="${sessionScope.group_info.grantId==sessionScope.login_info.memberId}">
				<!-- 그룹 관련 사이드 메뉴 -->
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
							<a href="${initParam.rootPath }/collectionSetting.do">  환경 설정</a><br>
							<a href="${initParam.rootPath }/cardNBank/login/cardNBankSelect.do">  그룹 통장 관리</a><br>
							<a href="${initParam.rootPath }/collection/inviteSetting.do">  그룹 멤버 관리</a><br>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div style="width: 18%">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse7">
								마이페이지
							</a>
						</h4>
					</div>
					<div id="collapse7" class="panel-collapse collapse">
						<div class="panel-body">
							<a href="${initParam.rootPath}/myPage.do">  내 정보 확인</a><br>
							<a href="${initParam.rootPath }/myInfo_modify.do">  개인 정보 수정</a><br>
							<a href="${initParam.rootPath }/cardNBank/login/cardNBankSelect.do">  카드/통장 관리</a><br>
							<a href="${initParam.rootPath }/collection/findAllCollectionList.do">  가계부 관리</a><br>
							<a href="${initParam.rootPath }/leaveMember.do">  회원 탈퇴</a>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		
	</div>
</div>



