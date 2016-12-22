<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>	
<head>	
<meta charset="UTF-8">	
<title>SALIM에 오신 것을 환영합니다.</title>	

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SALIM 가계부에 오신 것을 환영합니다.</title>



</head>

  <!-- j쿼리 등록 : datepicker -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 부트스트랩 등록 -->
<link href="/SALIM_project/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/SALIM_project/bootstrap/js/bootstrap.js"></script>
 

<style type="text/css">
header {
    background-color: #00001E;
    text-align: center;
    padding: 5px;
} 

footer {
    background-color: #00001E;
    padding-top: 30px;
    text-align: center;
    height: 50px;
    clear: both;
    padding-bottom: 10px;
}

.carousel-control.right {
    right: 0;
    left: auto;
    background-image: -webkit-linear-gradient(left,rgba(0,0,0,.0001) 0,rgba(0,0,0,0) 100%);
    background-image: -o-linear-gradient(left,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);
    background-image: -webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.0001)),to(rgba(0,0,0,.5)));
    background-image: linear-gradient(to right,rgba(0,0,0,.0001) 0,rgba(0,0,0,.0) 100%);
}

.carousel-control.left {
    background-image: -webkit-linear-gradient(left,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);
    background-image: -o-linear-gradient(left,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);
    background-image: -webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,.0001)));
    background-image: linear-gradient(to right,rgba(0,0,0,0) 0,rgba(0,0,0,.0001) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
    background-repeat: repeat-x;
}

.glyphicon-chevron-right:before {
    content: "\e080";
    color: #00001E;
}

.glyphicon-chevron-left:before {
    content: "\e079";
    color: #00001E;
}

.left carousel-control{
	color:#2A0066;
}



</style>


</head>	
	
	
	<header>
	
	<!--여기, 로그인 여부에 따라서 header가 달라진다.-->
 
		  <c:choose><%--SALIM 로고 -로그인 여부에 따라 다른 처리(링크의 유무) --%>
			<c:when test="${not empty sessionScope.login_info.memberId}">
				<h2 align="left" style="margin-left: 50px; margin-top: 40px">
					<a id="logo" href="${initParam.rootPath }/collection/findAllCollectionList.do"><font color="#ffffff">SALIM</font></a>
				</h2>
			</c:when>
			<c:otherwise>
				<h2 align="left" style="margin-left: 50px; margin-top: 40px">
					<a href="${initParam.rootPath }/main.do"><font color="#ffffff">SALIM</font></a>
				</h2>
			</c:otherwise>
		</c:choose>
		
		<!-- 로그인시 본인과 그룹 간을 이동할 수 있는 select박스 -->
		<form method="post" action="${initParam.rootPath }/collection/moving.do">
			<c:if test="${sessionScope.login_info != null }">
				<select id="selectInfo" onchange="form.submit()" name="selectId">
					<option value="${sessionScope.login_info}">개인</option>
					<c:forEach items="${sessionScope.groupList }" var="collection">
						<c:choose>
							<c:when test="${sessionScope.group_info.collectionId == collection.collectionId}">
								<option value=${collection.collectionId } selected="selected">${collection.collectionName }</option>
							</c:when>
							<c:otherwise>
								<option value="${collection.collectionId }">${collection.collectionName }</option>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
				</select>
			</c:if>
		</form>
	
	<div align="right" style="margin-right:30px;">
			<c:choose>
			<c:when test='${sessionScope.login_info!=null}'>
				<a href="${initParam.rootPath}/myPage.do">마이페이지</a>&nbsp;&nbsp;
				<a href="${initParam.rootPath}/member/logout.do">로그아웃</a>
			
			</c:when>
			<c:otherwise>
				<a href="${initParam.rootPath}/loginMember.do" class="btn btn-success" role="button">로그인</a>&nbsp;&nbsp;
				<a href="${initParam.rootPath }/joinMember.do" class="btn btn-warning" role="button">회원가입</a>
				<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			</c:otherwise>
		</c:choose>
		
		</div>
	
	
	
</header>
 
	
	
	
	<!-- 사진 나오는 부분 -->
	<body id="page-top" class="index">
	
       <div class="container" align="center" style="margin-top: 50px">
            <div class="row"style="min-height: 553px;">
                <div class="col-lg-12">
                    
                     <!-- 옆으로 넘어가게 하는 코드 -->  
        			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  						<!-- 옆으로 넘어가는 동그라미 설정 -->
	  					<ol class="carousel-indicators">
	    					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    					<li data-target="#carousel-example-generic" data-slide-to="1"></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
	  					</ol>
	
	 					<!-- 이미지 넣는 곳 -->
	  					<div class="carousel-inner" role="listbox">
	    					<div class="item active">
	      						<img src="/SALIM_project/img/portfolio/pic1.PNG" width="820" alt="그림이 없을 때 나오는 설명">
	      						<div class="carousel-caption">
	        						사진 위에 설명 나오게 하는 곳
	      						</div>
	    					</div>
	   						<div class="item">
	      						<img src="/SALIM_project/img/portfolio/pic2.PNG" width="358" alt="그림이 없을 때 나오는 설명">
	      						<div class="carousel-caption">
	        						사진 위에 설명 나오게 하는 곳
	      						</div>
	    					</div>
			    			<div class="item">
			      				<img src="/SALIM_project/img/portfolio/pic3.PNG" width="817" alt="그림이 없을 때 나오는 설명">
			      				<div class="carousel-caption">
			        				사진 위에 설명 나오게 하는 곳
			      				</div>
			    			</div>
			  			</div>
			  		 	<!-- 화살표 누르면 바뀌는 곳 -->
			  			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    			<span class="sr-only">Previous</span>
			  			</a>
			  			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    			<span class="sr-only">Next</span>
			  			</a>
					</div>
					
					
                </div>
            </div>
        </div> 
        
        
 
	
	
	
</body>

<footer>
<font style="color: white">
	살림프로젝트&nbsp;&nbsp;&nbsp;&nbsp;담당자: SALIM 팀&nbsp;&nbsp;&nbsp;&nbsp;
</font>

<a href="${initParam.rootPath }/inquiry.do">문의하기</a>

</footer>



</html>