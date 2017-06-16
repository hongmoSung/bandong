<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- sweet -->
<script src="${pageContext.request.contextPath}/sweet/sweetalert.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/sweet/sweetalert.css"/>

<style type="text/css">
	.col-sm-9 {
		margin-bottom: 15px;
	}
</style>
</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<div class="container">
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<jsp:include page="/view/include/leftMenu.jsp"/>
		</div>
	<div class="center-block text-center" style="width: 500px; margin-bottom: 25px;">
		<h1>회원가입</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" method="POST" action="join" onsubmit="return doAction()" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-3">profile</label>
				<div class="col-sm-9">
					<input class="form-control" type="file" name="attachFile" id="attachFile">
				</div>
				<label class="control-label col-sm-3">id</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="memberId" id="memberId">
				</div>
				<label class="control-label col-sm-3">pass</label>
				<div class="col-sm-9">
					<input class="form-control" class="form-control" type="text" name="pass" id="pass">
				</div>
				<label class="control-label col-sm-3">nickName</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="nickName" id="nickName">
				</div>
				<label class="control-label col-sm-3">email</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="email" id="email" value="${email}" readonly="readonly">
				</div>
				<label class="control-label col-sm-3">phoneNum</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="phoneNum" id="phoneNum">
				</div>
				<div class="text-center">
				<button class="btn btn-primary btn-lg">가입하기</button>
				</div>
			</div>
		</form>
	</div>
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
			swal("id를 입력하세요")
			return false;
		} 
		if(pass.value == "") {
			swal("pass를 입력하세요")
			return false;
		} 
		if(nickName.value == "") {
			swal("nickName를 입력하세요")
			return false;
		} 
		if(email.value == "") {
			swal("email를 입력하세요")
			return false;
		} 
		if(phoneNum.value == "") {
			swal("phoneNum를 입력하세요")
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