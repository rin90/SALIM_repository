<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>

<style> 
.area{
    padding:100px; 
    width: 670px;
   /*  resize: horizontal; */
    /* overflow: auto; */
}
</style>
<script type="text/javascript"
   src="/SALIM_project/lib/scripts/jquery.js"></script>
<script type="text/javascript">


$(document).ready(function(){

   

   
   
   //document에서 새로고침 방지 그러나 F12화면 새로고침 방지가 안됨  -> 그래서 쿠키로 합니다 ... 새로고침 방지하는 이유는 값이 그대로 보존되서 조회수가 올라감 .좋아요도redirect해서
   //옮기면서 해도 결국 같을거야 왜냐하면 어차피 똑같이 값을 주기 때문에 insert,update,delete같은 경우는 insert,update,delete로 다시 안돌아 가자나
   /* $(document).keydown(function (e) {
        
        if (e.which === 116 || e.which === 123) { //116->f5키를 뜻함 123 -> f12키를 뜻함 :::막음
           if (typeof event == "object") {
                event.keyCode = 0;
            }
            return false;
        } else if (e.which === 82 && e.ctrlKey) {
            return false;
        }

   });   근데 이런 보안은 오용이랍니다. 그래서 cooki를 이용합시다.*/ 
   
   $("#d").css("background","gray")
   
   $("#update").on("click",function(){// 댓글 수정 버튼 눌렀을시  누른 댓글만 텍스트에어리어 생김
      
      $("span.secondComment").show().next().next().next().hide()
      
      // 순서:  기존 댓글 보이게 하기 -> 그리고 span.commentInfo의 형제를 감추기(수정텍스트에어리어)
      $("span.commentInfo").show().next().hide(); //원상복귀
      
      //이벤트소스(수정버튼)의 부모를 감추기(댓글내용) ->그리고 spon의 형제를 보이게하기(form)
      $(this).parent().hide().next().show();  // 보이게하기
      
    });
   
   $("#second").on("click",function(){ //답글 버튼 클릭했을 때
      
      $("span.commentInfo").show().next().hide();
      
      $("span.secondComment").show().next().next().next().hide()
      
      $(this).parent().hide().next().next().next().show();
      
      
      
   });
   
   
   $("#register").on("submit",function(){ //댓글 폼 글 체크
      alert("확인")
      if($("#comment0").val().length == 0){
         alert("내용을입력해주세요");
         return false;
      }    
   
   });
   
   $(".updateMethod").on("submit",function(){ // 수정폼 글자수 체크
      if($(this).find("textarea").val().length == 0){
         alert("수정할 내용을 입력해주세요");
         return false;
      }
      
   });
   
   $(".secondRegister").on("submit",function(){ //답글폼 글자수 체크
      if($(this).find("textarea").val().length == 0){
         alert("수정할 내용을 입력해주세요");
         return false;
      }
      
   });
   
   
   
   $(".secondRegister").on("submit",function(){ //답글 폼 글 체크
      
      var t=$(this).find("textarea").val()//form에서 자식인 textarea를 찾는다.
      //event소스에서 찾는게 좋다.
      
      /* if($(".secondText").val().length == 0){ //이것은 secondText라는 이름을 가진 클래스를 다 가지고와서 배열로 갖고있는다.
                                       //그래서 첫번째 것만 값을 가져옴 다른 for문을 돌려서 값체크 해야됨
         alert("내용을 입력해주세요");
         return false;
      } */
      
      if(t.length == 0){
         alert("내용을 입력해주세요");
         return false;
      }
      
   });

   
   $("#scodCancel").on("click",function(){ //답글 취소 버튼 처리
      //먼가 변화되는 값이 없으니 서버로 갈 이유가 없다. 기냥 다시 답글 Form을 안보이게 해주고 답글 버튼을 보여주게 처리
      //ajax처리를 할 때는 서버를 가야하는 이유가 있고 원페이지를 처리할 때이다.
      $(this).parent().hide().prev().prev().prev().show();         
   });
   
   $("#updateCancel").on("click",function(){//수정 취소 버튼
      $(this).parent().find("textarea").val($(this).parent().find(".scope").val())
      $(this).parent().hide().prev().show();
      
   });

   
   
 });

</script>

<div class="col-md-8 col-md-offset-2">
<h1>글 확인</h1><hr>
          <input type="hidden" name="page" value="${requestScope.page }">
         <%--카테고리를 기준으로 해서 검색list 또는 기본 list로 이동 --%>
         
         <c:choose>
            <c:when test="${empty requestScope.category  }">
               <a  class="btn btn-md btn-default  pull-right" href="${initParam.rootPath }/free/login/list.do?page=${requestScope.page }">목록</a>
            </c:when>
            <c:otherwise>
               <a  class="btn btn-md btn-default  pull-right"
               href="${initParam.rootPath }/free/login/keyword.do?page=${requestScope.page }&&category=${requestScope.category}&search=${requestScope.search}">목록</a>
            </c:otherwise>
         </c:choose>
         <p/>
 <br><br>
   
 <h2><label for="sel1">${requestScope.freeBoard.title }</label></h2>
       <h5 align="right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                  value="${requestScope.freeBoard.registerTime }" /></h5>
      



<h4 align="left">작성자 : ${requestScope.freeBoard.memberId }</h4> &nbsp;&nbsp;&nbsp;
<p />
<hr>

<c:if test="${requestScope.freeBoard.fileName != null }">
<img
   src="${initParam.rootPath }/fileroute/${requestScope.freeBoard.fileName }">
</c:if>
<br>${requestScope.freeBoard.content }
<p />
<br><br><br>
댓글 &nbsp;${requestScope.commentTotal }&nbsp;&nbsp;조회&nbsp;${requestScope.freeBoard.click }&nbsp;&nbsp;
   
   
      <hr> <br>
            
         <c:if test="${requestScope.freeBoard.memberId== sessionScope.login_info.memberId }">
            <%--카테고리를 기준으로 해서 검색list에서 상세화면에서 삭제했을 때는 기본list 1페이지로 기본list에서 삭제했을 때는 현재 페이지로 이동 --%>
         <c:choose>
            <c:when test="${empty requestScope.category }">
               <a class="btn btn-sm btn-default  pull-right"
               href="${initParam.rootPath }/free/login/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">삭제</a>   <p/>
            </c:when>
            <c:otherwise>
               <a class="btn btn-sm btn-default  pull-right"
               href="${initParam.rootPath }/free/login/delete.do?no=${requestScope.freeBoard.no}&page=1">삭제</a>   <p/>               
            </c:otherwise>
         </c:choose>
         <a 
         href="${initParam.rootPath }/free/login/updateForm.do?category=${requestScope.category }&search=${requestScope.search}&page=${requestScope.page}&no=${requestScope.freeBoard.no}" class="btn btn-sm btn-default  pull-right">수정</a> &nbsp;&nbsp;
      
         </c:if>
               <!-- 댓글 -->
      <form id="register" action="${initParam.rootPath }/comment/login/insert.do" method="post">
         <hr>
         <label for="comment">댓글 작성</label><textarea class="form-control" rows="5" id="comment0" name="commentContent" ></textarea>
         <input type="hidden" name="commentMemberId" value="${sessionScope.login_info.memberId }">
         <input type="hidden" name="no" value="${requestScope.freeBoard.no }">
         <input type="hidden" name="groupLevel" value="0">
         <input type="hidden" name="page" value="${requestScope.page }">
         <input type="hidden" name="category" value="${requestScope.category }">
         <input type="hidden" name="search" value="${requestScope.search }">
         <input type="submit" value="등록" class="btn btn-sm btn-default  pull-right">
      </form>
      <br><br>
      
      <div id="d">
      <c:forEach  items="${requestScope.freeComment }" var="comment">
         <div id="tom" style="border-bottom: 1px solid white">
               
               <c:if test="${comment.groupLevel ==1}">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└
               </c:if>            
                  &nbsp;&nbsp;&nbsp;${comment.commentMemberId } &nbsp;&nbsp;&nbsp;
                  <c:choose>
                     <c:when test="${comment.commentMemberId==null }">

                     </c:when>
                     <c:otherwise>                     
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${comment.commentRegisterTime }"/>
                  
                  <c:choose><%-- 답글은 답글 버튼 없게하기 위해 --%>
                     <c:when test="${comment.groupLevel ==1 }">
                     
                     </c:when>
                     <c:otherwise>   
                        <span style="padding:5px" class="secondComment">
                           <input id="second"  type="button" value="답글" class="btn btn-sm btn-default  pull-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span>                                                                  
                     </c:otherwise>
                  </c:choose>
                  
                  
                  <span style="padding:5px" class="commentInfo">
                     <c:if test="${comment.commentMemberId ==sessionScope.login_info.memberId }">
                        <a href="${initParam.rootPath }/comment/login/delete.do?id=${comment.id }&no=${comment.no}&page=${requestScope.page}&category=${requestScope.category}&search=${requestScope.search}" class="btn btn-sm btn-default  pull-right" >삭제</a>
                        <button id="update"  class="btn btn-sm btn-default  pull-right">수정22</button>
                     </c:if>
                        <br>
                        <c:if test="${comment.groupLevel ==1}">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if>
                           
                     &nbsp;&nbsp;&nbsp;${comment.commentContent }
                  </span>
                  
                  </c:otherwise>
               </c:choose>
            
            <!-- 수정 Form  -->
            <form  class="updateMethod" action="${initParam.rootPath }/comment/login/update.do" method="post" hidden="false">
               <input class="scope" type="hidden" value="${comment.commentContent }">
               <textarea name="commentContent" rows="3" cols="50" >${comment.commentContent }</textarea>
               <input type="submit" value="수정" class="btn btn-sm btn-info  pull-right">
               <input id="updateCancel" type="button" class="btn btn-sm btn-default  pull-right" value="수정취소">
               <input type="hidden" name="id" value="${comment.id }">
               <input type="hidden" name="no" value="${comment.no }">
               <input type="hidden" name="page" value="${requestScope.page }">
               <input type="hidden" name="category" value="${requestScope.category }">
               <input type="hidden" name="search" value="${requestScope.search}">
               
            </form>
            
            <!-- 답글Form -->
            <form class="secondRegister" action="${initParam.rootPath }/comment/login/insert.do" method="post" hidden="">
               <hr>
               <input id="secondButton" type="submit" class="btn btn-sm btn-default  pull-right" value="답글 등록">
               <input id="scodCancel" class="btn btn-sm btn-default  pull-right" type="button" value="답글 취소">
               <label for="comment">답글 작성</label>&nbsp;&nbsp;&nbsp;
               <textarea id="secondText" class="form-control" rows="5" name="commentContent" ></textarea>
               <input type="hidden" name="commentMemberId" value="${sessionScope.login_info.memberId }">
               <input type="hidden" name="no" value="${requestScope.freeBoard.no }">
               <input type="hidden" name="groupLevel" value="1">
               <input type="hidden" name="page" value="${requestScope.page }">
               <input type="hidden" name="category" value="${requestScope.category }">
               <input type="hidden" name="search" value="${requestScope.search }">
               <input type="hidden" name="commentGroup" value="${comment.commentGroup }">
               
            </form>
               

            
         </div>
      </c:forEach>
      </div>
      
      
      
      
         <p/>


</div>



