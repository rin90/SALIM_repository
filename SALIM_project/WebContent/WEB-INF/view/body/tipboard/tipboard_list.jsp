<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript" src="/SALIM_project/lib/scripts/jquery.js"></script>
<script type="text/javascript">


</script>


<div class="container">
  <h2>Tip 게시판</h2>
  <p><font color="blue">여러분들의 Tip을 공유해 훌륭한 살림꾼이 되어봅시다!</font></p>            
  <table class="table table-bordered">
      <thead>
         <tr  class="info">
             <td>분류</td>
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회</td>
         </tr>
      </thead>
      
      
 

      

      <tbody id="tbody">
         <!--  목록 뿌리기 -->
         <c:forEach items="${requestScope.list }" var="tipBoard">
            <tr>
               <td>${tipBoard.classification }</td>
               <td>${tipBoard.no }</td>
               <td> 
               <a href="${initParam.rootPath }/tip/login/seleteDetail.do?no=${tipBoard.no}&page=${requestScope.pageBean.page}">${tipBoard.title }</a></td>
               <td>${tipBoard.memberId }</td>
               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${tipBoard.registerTime }"/></td>
               <td>${tipBoard.click }</td> 
            </tr>
         </c:forEach>
         
      </tbody>   
   </table>
         
         
         <div align="center">
         <!-- 이전페이지 -->
         <c:choose>
            <c:when test="${requestScope.pageBean.previousGroup }">
               <a href="${initParam.rootPath }/tip/login/list.do?page=${requestScope.pageBean.beginPage-1}">◀&nbsp;</a>
            </c:when>
            <c:otherwise>
               ◀&nbsp;
            </c:otherwise>
         </c:choose>
         
         <!-- 페이지 뿌리기 -->
         <c:forEach begin="${requestScope.pageBean.beginPage }" end="${requestScope.pageBean.endPage }" var="page">
            <c:choose>
               <c:when test="${requestScope.pageBean.page == page }">
                  [${page }]
               </c:when>
               <c:otherwise>
                  <a href="${initParam.rootPath }/tip/login/list.do?page=${page }">${page }</a>            
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <!-- 다음페이지 -->
         <c:choose>
            <c:when test="${requestScope.pageBean.nextGroup }">
               <a href="${initParam.rootPath }/tip/login/list.do?page=${requestScope.pageBean.endPage+1 }">&nbsp;▶</a>
            </c:when>
            <c:otherwise>
               &nbsp;▶            
            </c:otherwise>
         </c:choose>
         
         <form action="${initParam.rootPath }/tip/login/form.do">
         <input type="hidden" name="page" value="${requestScope.pageBean.page }">
         &nbsp;&nbsp;&nbsp;
         </form>
         
         
         
         <form action="${initParam.rootPath }/tip/login/keyword.do" method="post">
         <select name="category" class="btn btn-sm btn-primary dropdown-toggle" >            
            <c:forEach items="${requestScope.codes }" var="code">
            <c:choose>
               <c:when test="${requestScope.category == code.code }">
                  <option selected="selected">${code.code }</option>
               </c:when>
               <c:otherwise>
                  <option>${code.code }</option>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         </select>   
         <input type="hidden" name="page" value="1">
         <input type="text" name="search"> <input type="submit" value="검색"class= "btn btn-primary btn-sm Small"> 
         </div>
          <a class="btn btn-md btn-sm btn-default  pull-right" href="${initParam.rootPath }/tip/login/form.do?page=${requestScope.pageBean.page}">글쓰기</a>
         
         </form>
</div>