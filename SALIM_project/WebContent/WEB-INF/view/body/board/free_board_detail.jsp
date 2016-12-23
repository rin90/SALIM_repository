<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.update, .second, .delete, .updateCancel, .bto, .scodCancel {
   display: inline-block;
   zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */
   *display: inline;
   vertical-align: baseline;
   margin: 5px 8px;
   outline: none;
   cursor: pointer;
   text-align: center;
   text-decoration: none;
   font: 14px/100% Arial, Helvetica, sans-serif;
   padding: 10px 10px;
   text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
   -webkit-border-radius: .5em;
   -moz-border-radius: .5em;
   border-radius: .5em;
   -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
   -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
   box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
   color: #606060;
   border: solid 1px #b7b7b7;
   background: #fff;
   background: -webkit-gradient(linear, left top, left bottom, from(#fff),
      to(#ededed));
   background: -moz-linear-gradient(top, #fff, #ededed);
   filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',
      endColorstr='#ededed');
}

img{
   width: 20%;
   height: 20%;
   
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
   
   $("#d").css("background","#FFFF99")
   
   $(".update").on("click",function(){// 댓글 수정 버튼 눌렀을시  누른 댓글만 텍스트에어리어 생김
      
      $("span.secondComment").show().next().next().next().hide()
      
      // 순서:  기존 댓글 보이게 하기 -> 그리고 span.commentInfo의 형제를 감추기(수정텍스트에어리어)
      $("span.commentInfo").show().next().hide(); //원상복귀
      
      //이벤트소스(수정버튼)의 부모를 감추기(댓글내용) ->그리고 spon의 형제를 보이게하기(form)
      $(this).parent().hide().next().show();  // 보이게하기
      
    });
   
   $(".second").on("click",function(){ //답글 버튼 클릭했을 때
      
      $("span.commentInfo").show().next().hide();
      
      $("span.secondComment").show().next().next().next().hide()
      
      $(this).parent().hide().next().next().next().show();
      
      
      
   });
   
   
   $("#register").on("submit",function(){ //댓글 폼 글 체크
     
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
   
   
  /*  
   $(".secondRegister").on("submit",function(){ //답글 폼 글 체크
      
      var t=$(this).find("textarea").val()//form에서 자식인 textarea를 찾는다. */
      //event소스에서 찾는게 좋다.
      
      /* if($(".secondText").val().length == 0){ //이것은 secondText라는 이름을 가진 클래스를 다 가지고와서 배열로 갖고있는다.
                                       //그래서 첫번째 것만 값을 가져옴 다른 for문을 돌려서 값체크 해야됨
         alert("내용을 입력해주세요");
         return false;
      } */
      
   /*    if(t.length == 0){
         alert("내용을 입력해주세요");
         return false;
      }
      
   }); */

   
   $(".scodCancel").on("click",function(){ //답글 취소 버튼 처리
      //먼가 변화되는 값이 없으니 서버로 갈 이유가 없다. 기냥 다시 답글 Form을 안보이게 해주고 답글 버튼을 보여주게 처리
      //ajax처리를 할 때는 서버를 가야하는 이유가 있고 원페이지를 처리할 때이다.
      $(this).parent().hide().prev().prev().prev().show();         
   });
   
   $(".updateCancel").on("click",function(){//수정 취소 버튼
      $(this).parent().find("textarea").val($(this).parent().find(".scope").val())
      $(this).parent().hide().prev().show();
      
   });

   
   
 });

</script>


<h3>${requestScope.freeBoard.title } &nbsp;&nbsp;&nbsp;</h3>
<hr>
<div class="row" style="margin: 0 0 1%; font-family: Serif; font-size: 20px;font-weight: bold;"> <%-- row:한줄 (한줄이 12칸임) --%>
<div class="col-md-4" > <%-- col-md-4 :부트스트랩에 있는 것,4칸을 가지라는 것 --%>
 ${requestScope.freeBoard.memberId } &nbsp;&nbsp;&nbsp;
</div>

<div class="col-md-offset-4 col-md-4" align="right"> <%-- col-md-offset-4 4칸을 밀어라  --%>
   <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
      value="${requestScope.freeBoard.registerTime }" />
</div>
</div>

<br>

<p />
<div>
<c:if test="${requestScope.freeBoard.fileName != null }">
<img
   src="${initParam.rootPath }/fileroute/${requestScope.freeBoard.fileName }">
</c:if>
</div>
<br><div style="font-family: 맑은고딕; font-size: 20px; font-weight:lighter">${requestScope.freeBoard.content }</div><br>
<p />
댓글 &nbsp;${requestScope.commentTotal }&nbsp;&nbsp;조회&nbsp;${requestScope.freeBoard.click }&nbsp;&nbsp;
   
   
      <hr> <br>
      
       <input type="hidden" name="page" value="${requestScope.page }">
      
      
      <div align="right">        
         <%--카테고리를 기준으로 해서 검색list 또는 기본 list로 이동 --%>
         <c:choose>
            <c:when test="${empty requestScope.category  }">
               <a class="btn btn-default" style="margin: 0 3%" href="${initParam.rootPath }/free/login/list.do?page=${requestScope.page }">목록</a>
            </c:when>
            <c:otherwise>
               <a class="btn btn-default" style="margin: 0 3%"
               href="${initParam.rootPath }/free/login/keyword.do?page=${requestScope.page }&&category=${requestScope.category}&search=${requestScope.search}">목록</a>
            </c:otherwise>
         </c:choose>
        
         
         <c:if test="${requestScope.freeBoard.memberId== sessionScope.login_info.memberId }">
         <a class="btn btn-default"
         href="${initParam.rootPath }/free/login/updateForm.do?category=${requestScope.category }&search=${requestScope.search}&page=${requestScope.page}&no=${requestScope.freeBoard.no}">수정</a> &nbsp;&nbsp;
         <%--카테고리를 기준으로 해서 검색list에서 상세화면에서 삭제했을 때는 기본list 1페이지로 기본list에서 삭제했을 때는 현재 페이지로 이동 --%>
         <c:choose>
            <c:when test="${empty requestScope.category }">
               <a class="btn btn-default" style="margin: 0 1%"
               href="${initParam.rootPath }/free/login/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">삭제</a>   <p/>
           
            </c:when>
            <c:otherwise>
               <a class="btn btn-default" style="margin: 0 1%"
               href="${initParam.rootPath }/free/login/delete.do?no=${requestScope.freeBoard.no}&page=1">삭제</a>   <p/>               
            
            </c:otherwise>
         </c:choose>
         </c:if>
    </div>
<hr>
<br>  
      
      
      
      
      
      
   
      <div id="d">
      <c:forEach  items="${requestScope.freeComment }" var="comment">
         <div id="tom" style="border-bottom: 1px solid white">
               
               <c:if test="${comment.groupLevel ==1}">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└
               </c:if>            
                  ${comment.commentMemberId } &nbsp;&nbsp;&nbsp;
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
                           <input style="border-radius: 2px" class="second" type="button" value="답글">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span>                                                                  
                     </c:otherwise>
                  </c:choose>
                  
                  
                  <span style="padding:5px" class="commentInfo">
                     <c:if test="${comment.commentMemberId ==sessionScope.login_info.memberId }">
                        <input class="update" type="button" value="수정 ">
                        <a class="delete" href="${initParam.rootPath }/comment/login/delete.do?id=${comment.id }&no=${comment.no}&page=${requestScope.page}&category=${requestScope.category}&search=${requestScope.search}">삭제</a>
                     </c:if>
                        <br>
                        <c:if test="${comment.groupLevel ==1}">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if>
                           
                     ${comment.commentContent }
                  </span>
                  
                  </c:otherwise>
               </c:choose>
            
            <!-- 수정 Form  -->
            <form  class="updateMethod" action="${initParam.rootPath }/comment/login/update.do" method="post" hidden="false">
               <input class="scope" type="hidden" value="${comment.commentContent }">
               <textarea name="commentContent" rows="3" cols="50" >${comment.commentContent }</textarea>
               <input class="updateCancel" type="button" value="수정취소">
               <input type="hidden" name="id" value="${comment.id }">
               <input type="hidden" name="no" value="${comment.no }">
               <input type="hidden" name="page" value="${requestScope.page }">
               <input type="hidden" name="category" value="${requestScope.category }">
               <input type="hidden" name="search" value="${requestScope.search}">
               <input class="bto" type="submit" value="수정">
            </form>
            
            <!-- 답글Form -->
            <form class="secondRegister" action="${initParam.rootPath }/comment/login/insert.do" method="post" hidden="">
               <hr><br>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="scodCancel" type="button" value="답글 취소">└<br>&nbsp;&nbsp;
               ★&nbsp;&nbsp;&nbsp;
               <textarea class="secondText" name="commentContent" rows="3" cols="50"></textarea>
               <input type="hidden" name="commentMemberId" value="${sessionScope.login_info.memberId }">
               <input type="hidden" name="no" value="${requestScope.freeBoard.no }">
               <input type="hidden" name="groupLevel" value="1">
               <input type="hidden" name="page" value="${requestScope.page }">
               <input type="hidden" name="category" value="${requestScope.category }">
               <input type="hidden" name="search" value="${requestScope.search }">
               <input type="hidden" name="commentGroup" value="${comment.commentGroup }">
               <input class="bto" type="submit" value="등록">
            </form>
               

            
         </div>
      </c:forEach>
      </div>
      
      
      <!-- 댓글 -->
      <form id="register" action="${initParam.rootPath }/comment/login/insert.do" method="post">
      
       <h2 style="coller: white">댓글</h2>
   <div align="center">
      
      
         &nbsp;&nbsp;<textarea class="form-control" style="width: 95%; border-bottom: 10%" id="comment0" name="commentContent" rows="2" cols="10"></textarea>
         </div>
         <input type="hidden" name="commentMemberId" value="${sessionScope.login_info.memberId }">
         <input type="hidden" name="no" value="${requestScope.freeBoard.no }">
         <input type="hidden" name="groupLevel" value="0">
         <input type="hidden" name="page" value="${requestScope.page }">
         <input type="hidden" name="category" value="${requestScope.category }">
         <input type="hidden" name="search" value="${requestScope.search }">
         <div align="right">
         <input class="bto" type="submit" value="등록">
         </div>
      </form>
      
      
      
      
         <p/>


