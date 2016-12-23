<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br>
<div class="col-md-10 col-md-offset-2">
<h2>그룹 가계부 추가</h2>
<br><br>
<form action="${initParam.rootPath }/collection/collection_add.do" method="post">
<div class="form-group">
  <h4><label class="control-label col-sm-2" >가계부 이름</label></h4>
  <div class="col-sm-10">
      <input type="text" class="form-control" name='collectionName' placeholder="그룹의 이름을 지어보세요.">
      <p id="idResult" class="help-block"></p>
      
    </div>
</div>
<br><br>
 <div class="form-group">
    <h4><label class="control-label col-sm-2" for="pwd">그룹 소개</label></h4>
    <div class="col-sm-10"> 
    	<input type='text' class="form-control" name='collectionIntro' size='30' placeholder="어떤 그룹인지 소개해주세요">
	</div>
</div>


<div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
    <br><br>
      <button type="submit" class="btn btn-lg btn-success pull-right">추가하기</button>
    </div>
  </div>
</form>
</div>
</body>
</html>

<!-- 

<h2>그룹 가계부 추가</h2>

<form action="${initParam.rootPath }/collection/collection_add.do" method="post">
<table>
<tr>
	<td>
		가계부 이름
	</td>
</tr>
<tr>
	<td>
		<input type='text' name='collectionName' size='30'>
	</td>
</tr>
<tr><td><br></td></tr>
<tr>
	<td>
		가계부 설명
	</td>
</tr>
<tr>
	<td>
		<input type='text' name='collectionIntro' size='30'>
	</td>
</tr>
<tr><td><br></td></tr>
<tr>
	<td colspan='2' align=right>
		<input type='submit' value='추가하기'>
	</td>
</tr>
	
</table>
	
</form>


 -->