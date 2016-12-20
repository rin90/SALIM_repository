<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="today" class="java.util.Date"/>


<!-- 그룹 환경 설정 -->
<!-- 동적으로 생성되는 메뉴 - DB에서 collection의 grant_id와 현재 로그인한 회원의 member_id가 일치한 경우만 메뉴를 보여줌 -->
<c:if test="${sessionScope.group_info.grantId==sessionScope.login_info.memberId}">
	<a href="${initParam.rootPath }/collectionSetting.do">환경 설정</a><br>
	<a href="${initParam.rootPath }/collection/inviteSetting.do">그룹 멤버 관리</a><br>
</c:if>

<!-- 일정 -->
<a href="${initParam.rootPath }/calendar/login/load.do">일정</a><br>

<!-- 작성 -->
<a href="${initParam.rootPath }/household/login/incomeSelect.do">수입&지출 입력</a><br>
<a href="${initParam.rootPath }/household/login/findbudget.do">예산작성</a><br> 

<!-- 보고서 -->
<a href="${initParam.rootPath }/report/login/loadMonth.do">월 지출 내역</a><br>
<a href="${initParam.rootPath }/report/login/loadYear.do">년간 가계 내역</a><br>

<%-- <a href="${initParam.rootPath }/cardNBank/login/cardNBankSelect.do">카드/통장 등록</a><br> --%>

<!-- 게시판 -->
<a href="${initParam.rootPath }/free/login/list.do?page=1">자유게시판</a><br>
<a href="${initParam.rootPath }/">Tip게시판</a><br>


