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

   

   
   
   //document���� ���ΰ�ħ ���� �׷��� F12ȭ�� ���ΰ�ħ ������ �ȵ�  -> �׷��� ��Ű�� �մϴ� ... ���ΰ�ħ �����ϴ� ������ ���� �״�� �����Ǽ� ��ȸ���� �ö� .���ƿ䵵redirect�ؼ�
   //�ű�鼭 �ص� �ᱹ �����ž� �ֳ��ϸ� ������ �Ȱ��� ���� �ֱ� ������ insert,update,delete���� ���� insert,update,delete�� �ٽ� �ȵ��� ���ڳ�
   /* $(document).keydown(function (e) {
        
        if (e.which === 116 || e.which === 123) { //116->f5Ű�� ���� 123 -> f12Ű�� ���� :::����
           if (typeof event == "object") {
                event.keyCode = 0;
            }
            return false;
        } else if (e.which === 82 && e.ctrlKey) {
            return false;
        }

   });   �ٵ� �̷� ������ �����̶��ϴ�. �׷��� cooki�� �̿��սô�.*/ 
   
   $("#d").css("background","gray")
   
   $("#update").on("click",function(){// ��� ���� ��ư ��������  ���� ��۸� �ؽ�Ʈ����� ����
      
      $("span.secondComment").show().next().next().next().hide()
      
      // ����:  ���� ��� ���̰� �ϱ� -> �׸��� span.commentInfo�� ������ ���߱�(�����ؽ�Ʈ�����)
      $("span.commentInfo").show().next().hide(); //���󺹱�
      
      //�̺�Ʈ�ҽ�(������ư)�� �θ� ���߱�(��۳���) ->�׸��� spon�� ������ ���̰��ϱ�(form)
      $(this).parent().hide().next().show();  // ���̰��ϱ�
      
    });
   
   $("#second").on("click",function(){ //��� ��ư Ŭ������ ��
      
      $("span.commentInfo").show().next().hide();
      
      $("span.secondComment").show().next().next().next().hide()
      
      $(this).parent().hide().next().next().next().show();
      
      
      
   });
   
   
   $("#register").on("submit",function(){ //��� �� �� üũ
      alert("Ȯ��")
      if($("#comment0").val().length == 0){
         alert("�������Է����ּ���");
         return false;
      }    
   
   });
   
   $(".updateMethod").on("submit",function(){ // ������ ���ڼ� üũ
      if($(this).find("textarea").val().length == 0){
         alert("������ ������ �Է����ּ���");
         return false;
      }
      
   });
   
   $(".secondRegister").on("submit",function(){ //����� ���ڼ� üũ
      if($(this).find("textarea").val().length == 0){
         alert("������ ������ �Է����ּ���");
         return false;
      }
      
   });
   
   
   
   $(".secondRegister").on("submit",function(){ //��� �� �� üũ
      
      var t=$(this).find("textarea").val()//form���� �ڽ��� textarea�� ã�´�.
      //event�ҽ����� ã�°� ����.
      
      /* if($(".secondText").val().length == 0){ //�̰��� secondText��� �̸��� ���� Ŭ������ �� ������ͼ� �迭�� �����ִ´�.
                                       //�׷��� ù��° �͸� ���� ������ �ٸ� for���� ������ ��üũ �ؾߵ�
         alert("������ �Է����ּ���");
         return false;
      } */
      
      if(t.length == 0){
         alert("������ �Է����ּ���");
         return false;
      }
      
   });

   
   $("#scodCancel").on("click",function(){ //��� ��� ��ư ó��
      //�հ� ��ȭ�Ǵ� ���� ������ ������ �� ������ ����. ��� �ٽ� ��� Form�� �Ⱥ��̰� ���ְ� ��� ��ư�� �����ְ� ó��
      //ajaxó���� �� ���� ������ �����ϴ� ������ �ְ� ���������� ó���� ���̴�.
      $(this).parent().hide().prev().prev().prev().show();         
   });
   
   $("#updateCancel").on("click",function(){//���� ��� ��ư
      $(this).parent().find("textarea").val($(this).parent().find(".scope").val())
      $(this).parent().hide().prev().show();
      
   });

   
   
 });

</script>

<div class="col-md-8 col-md-offset-2">
<h1>�� Ȯ��</h1><hr>
          <input type="hidden" name="page" value="${requestScope.page }">
         <%--ī�װ��� �������� �ؼ� �˻�list �Ǵ� �⺻ list�� �̵� --%>
         
         <c:choose>
            <c:when test="${empty requestScope.category  }">
               <a  class="btn btn-md btn-default  pull-right" href="${initParam.rootPath }/free/login/list.do?page=${requestScope.page }">���</a>
            </c:when>
            <c:otherwise>
               <a  class="btn btn-md btn-default  pull-right"
               href="${initParam.rootPath }/free/login/keyword.do?page=${requestScope.page }&&category=${requestScope.category}&search=${requestScope.search}">���</a>
            </c:otherwise>
         </c:choose>
         <p/>
 <br><br>
   
 <h2><label for="sel1">${requestScope.freeBoard.title }</label></h2>
       <h5 align="right"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                  value="${requestScope.freeBoard.registerTime }" /></h5>
      



<h4 align="left">�ۼ��� : ${requestScope.freeBoard.memberId }</h4> &nbsp;&nbsp;&nbsp;
<p />
<hr>

<c:if test="${requestScope.freeBoard.fileName != null }">
<img
   src="${initParam.rootPath }/fileroute/${requestScope.freeBoard.fileName }">
</c:if>
<br>${requestScope.freeBoard.content }
<p />
<br><br><br>
��� &nbsp;${requestScope.commentTotal }&nbsp;&nbsp;��ȸ&nbsp;${requestScope.freeBoard.click }&nbsp;&nbsp;
   
   
      <hr> <br>
            
         <c:if test="${requestScope.freeBoard.memberId== sessionScope.login_info.memberId }">
            <%--ī�װ��� �������� �ؼ� �˻�list���� ��ȭ�鿡�� �������� ���� �⺻list 1�������� �⺻list���� �������� ���� ���� �������� �̵� --%>
         <c:choose>
            <c:when test="${empty requestScope.category }">
               <a class="btn btn-sm btn-default  pull-right"
               href="${initParam.rootPath }/free/login/delete.do?no=${requestScope.freeBoard.no}&page=${requestScope.page}">����</a>   <p/>
            </c:when>
            <c:otherwise>
               <a class="btn btn-sm btn-default  pull-right"
               href="${initParam.rootPath }/free/login/delete.do?no=${requestScope.freeBoard.no}&page=1">����</a>   <p/>               
            </c:otherwise>
         </c:choose>
         <a 
         href="${initParam.rootPath }/free/login/updateForm.do?category=${requestScope.category }&search=${requestScope.search}&page=${requestScope.page}&no=${requestScope.freeBoard.no}" class="btn btn-sm btn-default  pull-right">����</a> &nbsp;&nbsp;
      
         </c:if>
               <!-- ��� -->
      <form id="register" action="${initParam.rootPath }/comment/login/insert.do" method="post">
         <hr>
         <label for="comment">��� �ۼ�</label><textarea class="form-control" rows="5" id="comment0" name="commentContent" ></textarea>
         <input type="hidden" name="commentMemberId" value="${sessionScope.login_info.memberId }">
         <input type="hidden" name="no" value="${requestScope.freeBoard.no }">
         <input type="hidden" name="groupLevel" value="0">
         <input type="hidden" name="page" value="${requestScope.page }">
         <input type="hidden" name="category" value="${requestScope.category }">
         <input type="hidden" name="search" value="${requestScope.search }">
         <input type="submit" value="���" class="btn btn-sm btn-default  pull-right">
      </form>
      <br><br>
      
      <div id="d">
      <c:forEach  items="${requestScope.freeComment }" var="comment">
         <div id="tom" style="border-bottom: 1px solid white">
               
               <c:if test="${comment.groupLevel ==1}">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��
               </c:if>            
                  &nbsp;&nbsp;&nbsp;${comment.commentMemberId } &nbsp;&nbsp;&nbsp;
                  <c:choose>
                     <c:when test="${comment.commentMemberId==null }">

                     </c:when>
                     <c:otherwise>                     
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${comment.commentRegisterTime }"/>
                  
                  <c:choose><%-- ����� ��� ��ư �����ϱ� ���� --%>
                     <c:when test="${comment.groupLevel ==1 }">
                     
                     </c:when>
                     <c:otherwise>   
                        <span style="padding:5px" class="secondComment">
                           <input id="second"  type="button" value="���" class="btn btn-sm btn-default  pull-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span>                                                                  
                     </c:otherwise>
                  </c:choose>
                  
                  
                  <span style="padding:5px" class="commentInfo">
                     <c:if test="${comment.commentMemberId ==sessionScope.login_info.memberId }">
                        <a href="${initParam.rootPath }/comment/login/delete.do?id=${comment.id }&no=${comment.no}&page=${requestScope.page}&category=${requestScope.category}&search=${requestScope.search}" class="btn btn-sm btn-default  pull-right" >����</a>
                        <button id="update"  class="btn btn-sm btn-default  pull-right">����22</button>
                     </c:if>
                        <br>
                        <c:if test="${comment.groupLevel ==1}">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if>
                           
                     &nbsp;&nbsp;&nbsp;${comment.commentContent }
                  </span>
                  
                  </c:otherwise>
               </c:choose>
            
            <!-- ���� Form  -->
            <form  class="updateMethod" action="${initParam.rootPath }/comment/login/update.do" method="post" hidden="false">
               <input class="scope" type="hidden" value="${comment.commentContent }">
               <textarea name="commentContent" rows="3" cols="50" >${comment.commentContent }</textarea>
               <input type="submit" value="����" class="btn btn-sm btn-info  pull-right">
               <input id="updateCancel" type="button" class="btn btn-sm btn-default  pull-right" value="�������">
               <input type="hidden" name="id" value="${comment.id }">
               <input type="hidden" name="no" value="${comment.no }">
               <input type="hidden" name="page" value="${requestScope.page }">
               <input type="hidden" name="category" value="${requestScope.category }">
               <input type="hidden" name="search" value="${requestScope.search}">
               
            </form>
            
            <!-- ���Form -->
            <form class="secondRegister" action="${initParam.rootPath }/comment/login/insert.do" method="post" hidden="">
               <hr>
               <input id="secondButton" type="submit" class="btn btn-sm btn-default  pull-right" value="��� ���">
               <input id="scodCancel" class="btn btn-sm btn-default  pull-right" type="button" value="��� ���">
               <label for="comment">��� �ۼ�</label>&nbsp;&nbsp;&nbsp;
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



