<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="today" class="java.util.Date"/>

<a href="${initParam.rootPath }/calendar.do">일정</a><br>
<a href="${initParam.rootPath }/calendar/load.do?memberId=tester2">일정2</a><br>
<%-- <a href="${initParam.rootPath }/calendar/load.do?memberId=${sessionScope.login_info.memberId }">일정3</a><br> --%>

<a href="${initParam.rootPath }/report/loadMonth.do?memberId=tester2">월 지출 내역</a><br>
<a href="${initParam.rootPath }/report/loadYear.do?memberId=tester2">년간 가계 내역</a><br>

<a href="${initParam.rootPath }/graph.do">막대그래프</a><br>

<a href="${initParam.rootPath }/main.do">메인페이지</a><br>
<a href="${initParam.rootPath }/next.do">다음페이지</a><br>


<a href="${initParam.rootPath }/household/login/incomeSelect.do">수입&지출 입력</a><br>
<a href="${initParam.rootPath }/household/login/findbudget.do">예산작성</a><br> 

<a href="${initParam.rootPath }/cardNBank/login/cardNBankSelect.do">카드/통장 등록</a><br>

<a href="${initParam.rootPath }/test/time.do">Test</a><br>


<a href="${initParam.rootPath }/tip/login/list.do?page=1">Tip게시판</a><br>

<a href="${initParam.rootPath }/free/login/list.do?page=1">자유게시판</a><br>




<a href="${initParam.rootPath }/collectionSetting.do">그룹 환경설정</a><br>

<a href="${initParam.rootPath }/">Tip게시판</a><br>
<a href="${initParam.rootPath }/collectionSetting.do">그룹 환경설정</a><br>







<!-- 동적으로 생성되는 메뉴 - DB에서 collection의 grant_id와 현재 로그인한 회원의 member_id가 일치한 경우만 메뉴를 보여줌 -->
<c:if test="${sessionScope.group_info.grantId==sessionScope.login_info.memberId}">
<a href="${initParam.rootPath }/collectionSetting.do">환경 설정</a><br>
<a href="${initParam.rootPath }/collection/inviteSetting.do">그룹 멤버 관리</a><br>
</c:if>


