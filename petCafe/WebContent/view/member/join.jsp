<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<div class="container">
	<div class="center-block text-center" style="width: 500px;">
		<h1>회원가입</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" method="POST" action="join" onsubmit="return doAction()">
			<div class="form-group">
				<label class="control-label col-sm-3">id</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="memberId" id="memberId">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">pass</label>
				<div class="col-sm-9">
					<input class="form-control" class="form-control" type="text" name="pass" id="pass">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">nickName</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="nickName" id="nickName">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">email</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="email" id="email" value="${email}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">phoneNum</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="phoneNum">
				</div>
			</div>
			<div class="text-center">
				<button class="btn btn-success btn-lg">가입하기</button>
			</div>
		</form>
	</div>
</div>

<script>
	function doAction() {
		var id = document.querySelector("#memberId");
		var pass = document.querySelector("#pass");
		var nickName = document.querySelector("#nickName");
		var email = document.querySelector("#email");
		var phoneNum = document.querySelector("#phoneNum");
		
		if(id.value == "") {
			alert("id를 입력하세요");
			return false;
		} 
		if(pass.value == "") {
			alert("pass를 입력하세요");
			return false;
		} 
		if(nickName.value == "") {
			alert("nickName를 입력하세요");
			return false;
		} 
		if(email.value == "") {
			alert("email를 입력하세요");
			return false;
		} 
		if(phoneNum.value == "") {
			alert("phoneNum를 입력하세요");
			return false;
		} 
		return true;
	}
</script>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>