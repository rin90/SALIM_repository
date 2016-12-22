<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<style>
.div1{

}
.div2
{

}
#section42 {

width:200px;
height:200px;
padding-top:10px;
color: #fff; 
background-color: #009688;
}

</style>
<head>

<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>jQuery UI Selectable - Serialize</title>
<!-- 부트스트랩 -->  
<!--   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
 <!-- 부트스트랩  끝/--> 
<!--   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <style>
  #feedback { font-size: 1.4em; }

  #selectable .ui-selecting { background: #FECA40; }

  #selectable .ui-selected { background: #F39814; color: white; }

  #selectable { list-style-type: none; margin: 0; padding: 0; width: 100%; }

  #selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 30px; }
  </style>
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="/SALIM_project/scripts/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   
   $(".mydiv").on("click","selectable",function(){
      alert("dk");
   });
   
   $("#okayClick").on("click",function(){
      $("#form").prop("action","${initParam.rootPath }/collection/okay.do");
      $("#form").submit();
   });
   $("#noClick").on("click",function(){
      $("#form").prop("action","${initParam.rootPath }/collection/refusal.do");
      $("#form").submit();
   });
   
});

</script>


<title>Insert title here</title>
</head>
<body>
<div class="col-md-8 col-md-offset-2"><br><br>
		<table class="table table-striped">
	         
<tr class="success">
      <td>
          <h4 style="margin-left: 260px"><a href="${initParam.rootPath }/household/login/incomeSelect.do">개인 가계부 이동</a></h4>
      </td>
   </tr>
   
   </table>
	
	
	
<table class="table table-striped">
	


<tr class="info">
      <td>
          <h4 style="margin-left: 260px">나의 그룹 가계부</h4>
      </td>
      
   </tr>
    

	
</table>
	<table class="table table-striped">
	  <tr>
    <form action="${initParam.rootPath }/collection.do" method='get'>
         <!-- <input type='submit' value='그룹 가계부 추가'> -->
         <button type="submit" class="btn btn-default btn-md pull-right">+그룹가계부 추가</button>
      </form> 
    </tr> 
	 <tr class="active">
	 <br><br>
		<th>그룹 가계부 이름</th><th>그룹 가계부 리더</th><th>그룹 가계부 소개 </th><th></th><th></th>
	</tr>
   <c:if test="${requestScope.collectionListInviteTrue!=null}">
   
   
      
      <c:forEach  items="${requestScope.collectionListInviteTrue}" var="collection">   
            
            <%@include file="collectionIncludedFile.jsp" %>   
          
      </c:forEach>
   </c:if>
</table>
<br>
<table class="table table-striped">       
<tr class="danger">
      <td> 
         <c:if test="${requestScope.collectionListInvitefalse!=null}">
            <h4 style="margin-left: 260px">초대 받은 가계부</h4>
         </c:if>
      </td>
</tr>      
</table>


<table class="table table-striped">
<tr class="active">
   <th align="center">그룹 가계부 이름</th>
   <th align="center">그룹 가계부 리더</th>
   <th align="center">그룹 가계부 소개 </th>
   <th align="center"></th>
   <th align="center"></th>
</tr>
<!-- <tr  class="active">
		<td align="center">초대 받은 그룹 가계부 </td>
		<td align="center">초대한 사람</td>
		<td align="center">그룹 가계부 소개 </td>
		<td align="center"></td>
	</tr> -->
      <c:if test="${requestScope.collectionListInvitefalse!=null}">
        <c:forEach  items="${requestScope.collectionListInvitefalse}" var="collection">   
         
            <%@include file="collectionIncludedFile2.jsp" %>   
         
        </c:forEach>
      </c:if>
</table>
	
</div>


<%-- <table>
<tr>
   <td></td>
   <td>
      <h2><a href="${initParam.rootPath }/household/login/incomeSelect.do">개인 가계부</a></h2>
   </td>
</tr>
<tr>
   <td></td>
   <td>
       <h2>그룹 가계부</h2>
   </td>
   
</tr>
<tr>
<th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th>
   <th></th>
   <th align='right'>
      <form action="${initParam.rootPath }/collection.do" method='get'>
         <!-- <input type='submit' value='그룹 가계부 추가'> -->
         <button type="submit" class="btn btn-default btn-lg">+그룹가계부 추가</button>
      </form>   
   </th>
</tr>
<tr>
      <td>
         <h3>나의 그룹 가계부</h3>
      </td>
   </tr>
</table>

<table>   

   <c:if test="${requestScope.collectionListInviteTrue!=null}">
   
   
      
      <c:forEach  items="${requestScope.collectionListInviteTrue}" var="collection">   
      <tr>   
            <%@include file="collectionIncludedFile.jsp" %>   
      </tr>
      </c:forEach>
      
   
   </c:if>
</table>
<br>

<c:if test="${requestScope.collectionListInvitefalse!=null}">
         
               <h3>초대 받은 그룹 가계부</h3>
         
         </c:if>
<table>
      <c:if test="${requestScope.collectionListInvitefalse!=null}">
   
   <tr>
      
      <c:forEach  items="${requestScope.collectionListInvitefalse}" var="collection">   
         
            <%@include file="collectionIncludedFile2.jsp" %>   
         
      </c:forEach>
      
   </tr>
   </c:if>
</table>  --%>  

</body>
</html>