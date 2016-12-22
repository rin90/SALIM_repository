<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script type="text/javascript" src="${initParam.rootPath }/lib/scripts/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				/* 	$("#good").css("color","red")
				
				 $("#good").on("click",function(){		
				 $.ajax({	
				 "url":"${initParam.rootPath}/free/login/good.do",
				 "type":"post",
				 "data":"whether="+$("#good").val()+"&no="+${requestScope.freeBoard.no},
				 "beforeSend":function(){
				 if(!$("#good").val()){
				
				 $("#good").text("�� 0");
				 $("#good").prop("value","false");
				
				 }else {	
				
				 $("#good").text("�� 1");
				 $("#good").prop("value","");
				 }		
				 } */
				//		});//ajax
				//	});//event

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

				$("#a").css("background", "gray")

				$(".update").on("click", function() {// ��� ���� ��ư ��������  ���� ��۸� �ؽ�Ʈ����� ����

					$("span.secondComment").show().next().next().next().hide()

					// ����:  ���� ��� ���̰� �ϱ� -> �׸��� span.commentInfo�� ������ ���߱�(�����ؽ�Ʈ�����)
					$("span.commentInfo").show().next().hide(); //���󺹱�

					//�̺�Ʈ�ҽ�(������ư)�� �θ� ���߱�(��۳���) ->�׸��� spon�� ������ ���̰��ϱ�(form)
					$(this).parent().hide().next().show(); // ���̰��ϱ�

				});

				$(".second").on("click", function() { //��� ��ư Ŭ������ ��

					$("span.commentInfo").show().next().hide();

					$("span.secondComment").show().next().next().next().hide()

					$(this).parent().hide().next().next().next().show();

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
				

				$("#register").on("submit", function() { //��� �� �� üũ
					alert("Ȯ��")
					if ($("#comment0").val().length == 0) {
						alert("�������Է����ּ���");
						return false;
					}

				});

				$(".secondRegister").on("submit", function() { //��� �� �� üũ

					var t = $(this).find("textarea").val()//form���� �ڽ��� textarea�� ã�´�.
					//event�ҽ����� ã�°� ����.

					/* if($(".secondText").val().length == 0){ //�̰��� secondText��� �̸��� ���� Ŭ������ �� ������ͼ� �迭�� �����ִ´�.
																//�׷��� ù��° �͸� ���� ������ �ٸ� for���� ������ ��üũ �ؾߵ�
						alert("������ �Է����ּ���");
						return false;
					} */

					if (t.length == 0) {
						alert("������ �Է����ּ���");
						return false;
					}

				});

				$(".scodCancel").on("click", function() { //��� ��� ��ư ó��
					//�հ� ��ȭ�Ǵ� ���� ������ ������ �� ������ ����. ��� �ٽ� ��� Form�� �Ⱥ��̰� ���ְ� ��� ��ư�� �����ְ� ó��
					//ajaxó���� �� ���� ������ �����ϴ� ������ �ְ� ���������� ó���� ���̴�.
					$(this).parent().hide().prev().prev().prev().show();
				});

				$(".updateCancel").on("click", function() {//���� ��� ��ư
							$(this).parent().find("textarea").val($(this).parent().find(".scope").val())
							$(this).parent().hide().prev().show();

				});

			});
</script>


${requestScope.tipBoard.title } &nbsp;&nbsp;&nbsp;
<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${requestScope.tipBoard.registerTime }" />
<hr>
${requestScope.tipBoard.memberId } &nbsp;&nbsp;&nbsp;
<p />
<c:if test="${requestScope.tipBoard.fileName != null }">
	<img src="${initParam.rootPath }/tipFileRoute/${requestScope.tipBoard.fileName }">
</c:if>
<br>${requestScope.tipBoard.content }
<p />
��� &nbsp;${requestScope.commentTotal }&nbsp;&nbsp;��ȸ&nbsp;${requestScope.tipBoard.click }&nbsp;&nbsp;




	

		<hr> <br>
	
		<div id="a">
		<c:forEach  items="${requestScope.tipComment }" var="comment">
			<div id="tom" style="border-bottom: 1px solid white">
					
					<c:if test="${comment.groupLevel ==1}">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��
					</c:if>				
						${comment.commentMemberId } &nbsp;&nbsp;&nbsp;
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
									<input class="second" type="button" value="���">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</span>																						
							</c:otherwise>
						</c:choose>
						
						
						<span style="padding:5px" class="commentInfo">
							<c:if test="${comment.commentMemberId ==sessionScope.login_info.memberId }">
								<input class="update" type="button" value="���� ">
								<a href="${initParam.rootPath }/tip/comment/login/delete.do?id=${comment.id }&no=${comment.no}&page=${requestScope.page}&category=${requestScope.category}&search=${requestScope.search}">����</a>
							</c:if>
								<br>
								<c:if test="${comment.groupLevel ==1}">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
									
							${comment.commentContent }
						</span>
						
						</c:otherwise>
					</c:choose>
				
				<!-- ���� Form  -->
				<form  class="updateMethod" action="${initParam.rootPath }/tip/comment/login/update.do" method="post" hidden="false">
					<input class="scope" type="hidden" value="${comment.commentContent }">
					<textarea name="commentContent" rows="3" cols="50" >${comment.commentContent }</textarea>
					<input class="updateCancel" type="button" value="�������">
					<input type="hidden" name="id" value="${comment.id }">
					<input type="hidden" name="no" value="${comment.no }">
					<input type="hidden" name="page" value="${requestScope.page }">
					<input type="hidden" name="category" value="${requestScope.category }">
					<input type="hidden" name="search" value="${requestScope.search}">
					<input type="submit" value="����">
				</form>
				
				<!-- ���Form -->
				<form class="secondRegister" action="${initParam.rootPath }/tip/comment/login/insert.do" method="post" hidden="">
					<hr><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="scodCancel" type="button" value="��� ���">��<br>&nbsp;&nbsp;
					��&nbsp;&nbsp;&nbsp;
					<textarea class="secondText" name="commentContent" rows="3" cols="50"></textarea>
					<input type="hidden" name="commentMemberId" value="${sessionScope.login_info.memberId }">
					<input type="hidden" name="no" value="${requestScope.tipBoard.no }">
					<input type="hidden" name="groupLevel" value="1">
					<input type="hidden" name="page" value="${requestScope.page }">
					<input type="hidden" name="category" value="${requestScope.category }">
					<input type="hidden" name="search" value="${requestScope.search }">
					<input type="hidden" name="commentGroup" value="${comment.commentGroup }">
					<input class="secondButton" type="submit" value="���">
				</form>
					

				
			</div>
		</c:forEach>
		</div>
		
		
		<!-- ��� -->
		<form id="register" action="${initParam.rootPath }/tip/comment/login/insert.do" method="post">
		
			��&nbsp;&nbsp;<textarea id="comment0" name="commentContent" rows="2" cols="140"></textarea>
			<input type="hidden" name="commentMemberId" value="${sessionScope.login_info.memberId }">
			<input type="hidden" name="no" value="${requestScope.tipBoard.no }">
			<input type="hidden" name="groupLevel" value="0">
			<input type="hidden" name="page" value="${requestScope.page }">
			<input type="hidden" name="category" value="${requestScope.category }">
			<input type="hidden" name="search" value="${requestScope.search }">
			<input type="submit" value="���" class="btn btn-sm btn-default  pull-right">
		</form>
		
		
		
		
			<p/>

			<input type="hidden" name="page" value="${requestScope.page }">
			<%--ī�װ��� �������� �ؼ� �˻�list �Ǵ� �⺻ list�� �̵� --%>
			<c:choose>
				<c:when test="${empty requestScope.category  }">
					<a href="${initParam.rootPath }/tip/login/list.do?page=${requestScope.page }">���</a>
				</c:when>
				<c:otherwise>
					<a 
					href="${initParam.rootPath }/tip/login/keyword.do?page=${requestScope.page }&&category=${requestScope.category}&search=${requestScope.search}">���</a>
				</c:otherwise>
			</c:choose>
			<p/>
			
			<c:if test="${requestScope.tipBoard.memberId== sessionScope.login_info.memberId }">
			<a 
			href="${initParam.rootPath }/tip/login/updateForm.do?category=${requestScope.category }&search=${requestScope.search}&page=${requestScope.page}&no=${requestScope.tipBoard.no}">����</a> &nbsp;&nbsp;
			<%--ī�װ��� �������� �ؼ� �˻�list���� ��ȭ�鿡�� �������� ���� �⺻list 1�������� �⺻list���� �������� ���� ���� �������� �̵� --%>
			<c:choose>
				<c:when test="${empty requestScope.category }">
					<a 
					href="${initParam.rootPath }/tip/login/delete.do?no=${requestScope.tipBoard.no}&page=${requestScope.page}">����</a>	<p/>
				</c:when>
				<c:otherwise>
					<a
					href="${initParam.rootPath }/tip/login/delete.do?no=${requestScope.tipBoard.no}&page=1">����</a>	<p/>					
				</c:otherwise>
			</c:choose>
			</c:if>
			






