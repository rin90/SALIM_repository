<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="today" class="java.util.Date"/>

<a href="${initParam.rootPath }/calendar.do">일정</a><br>
<a href="${initParam.rootPath }/calendar/load.do?memberId=tester2">일정2</a><br>
<%-- <a href="${initParam.rootPath }/calendar/load.do?memberId=${sessionScope.login_info.memberId }">일정3</a><br> --%>
<%-- <a href="${initParam.rootPath }/calendar.do">일정</a><br> --%>

<a href="${initParam.rootPath }/graph.do">막대그래프</a><br>
<a href="${initParam.rootPath }/main.do">메인페이지</a><br>
<a href="${initParam.rootPath }/next.do">다음페이지</a><br>


<a href="${initParam.rootPath }/household/login/incomeSelect.do">수입&지출 입력</a>






<a href="${initParam.rootPath }/test/time.do">Test</a><br>
<a href="${initParam.rootPath }/free/list.do?page=1">자유게시판</a><br>
<a href="${initParam.rootPath }/list.do?page=1">Tip게시판</a><br>
<a href="${initParam.rootPath }/">Q&A</a><br>




