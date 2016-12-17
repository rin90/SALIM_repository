<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>${sessionScope.group_info.collectionName} 가계부 수정하기</h2>
<table>
   <tr>
      <td>
         그룹 가계부명
      </td>
      <td>
         ${sessionScope.group_info.collectionName}
         <input type="hidden" id="collectionName" name="colletionName" value="${sessionScope.group_info.collectionName }">
      </td>
   </tr>
   <tr>
      <td>
          가계부 설명
      </td>
      <td>
         ${sessionScope.group_info.collectionIntro}
         <input type="hidden" id='collectionIntro' name="collectionIntro" value="${sessionScope.group_info.collectionIntro }">
      </td>
   </tr>
   
   <tr>
      <td>
         ${sessionScope.group_info.grantId }
      </td>
      <td>
         <input type="hidden" id='grantId' name='grantId' value="${sessionScope.group_info.grantId}" >
      </td>
   </tr>
</table>
</body>
</html>