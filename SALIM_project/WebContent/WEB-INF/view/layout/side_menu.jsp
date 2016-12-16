<%@ page contentType="text/html;charset=UTF-8"%>
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


<a href="${initParam.rootPath }/test/time.do">Test</a><br>


<a href="${initParam.rootPath }/list.do?page=1">Tip게시판</a><br>

<a href="${initParam.rootPath }/free/login/list.do?page=1">자유게시판</a><br>


<a href="${initParam.rootPath }/">Q&A</a><br>
<a href="${initParam.rootPath }/collectionSetting.do">그룹 환경설정</a><br>




