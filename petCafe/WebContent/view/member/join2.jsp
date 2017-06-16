<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- sweet -->
<script src="${pageContext.request.contextPath}/sweet/sweetalert.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/sweet/sweetalert.css"/>

</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<script type="text/javascript">
	var god = "";
	var authNum = "";
	var email = "";
	function authEmail() {
		email = document.querySelector("#email").value;
		var dType = "ajax";
		console.log(email);
		
		$.ajax({
			data : {
						"authMail" : email,
						"ajax" : dType						
						},
			url : "authEmail2",
			dataType : "json",
			success : function (data) {
				console.log(data);
				var result = data;
				console.log(result.authNum);
				authNum = result.authNum;
				console.log(result.result);
				god = result.result;
				if(result.result == "성공") {
					console.log("성공어럴트");
					swal("인증번호가 전송되었습니다.", "메일에서 확인해주세요", "success");
					document.querySelector("#authE").hidden = false;
				} 
				else if(result.result == "실패") {
					console.log("실패어럴트");
					swal("인증번호 전송에 실패 하였습니다.", "Try again", "error");
				} 
			}
		});
	}
		
		/////////////////////////////////////////////////////////////////////////
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
	
	function checking() {
		var eee = document.querySelector("#inputError2").value;
		console.log(eee);
		console.log(authNum);
		if (authNum == eee) {
			document.querySelector("#authS").hidden = false;
			document.querySelector("#inputSuccess2").value = eee;
			document.querySelector("#authE").hidden = true;
			document.querySelector("#joinForm").hidden = false;
			document.querySelector("#email2").value = email;
		}		
	}
	
</script>
<div class="container">
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<jsp:include page="/view/include/leftMenu.jsp"/>
		</div>
		<div class="col-md-10 center-block" style="width:800px;">
			<div class="center-block text-center" style="width: 500px;">
				<h1>회원 가입</h1>
				<label for="a">email</label>
				<input type="text" id="email"><button onclick="authEmail();" id="authBtn" type="button" class="btn btn-primary btn-xl" style="margin-left: 5px;">인증하기</button><br>
				
				<div class="form-group has-success has-feedback" id="authS" hidden="true">
				  <label class="control-label" for="inputSuccess2">인증 성공</label>
				  <input type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status">
				  <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
				  <span id="inputSuccess2Status" class="sr-only">(success)</span>
				</div>
				<div class="form-group has-error has-feedback" hidden="true" id="authE">
				  <label class="control-label" for="inputError2">인증번호를 넣어주세요</label>
				  <input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status" onkeyup="checking();">
				  <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
				  <span id="inputError2Status" class="sr-only">(error)</span>
				</div>
			</div>
			<!-- -->
			<!-- -->
			<!-- -->
			<form id="joinForm" hidden="true" class="form-horizontal" method="POST" action="join" onsubmit="return doAction()" enctype="multipart/form-data">
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
					<input class="form-control" type="text" name="email" id="email2" value="${email}" readonly="readonly">
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
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>