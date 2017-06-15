<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
		<h1>수정페이지</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" method="post" action="update" onsubmit="return doAction()" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-3" for="memberId">프로필</label>
				<div class="col-sm-9">
					<img src="${pageContext.request.contextPath}${imgSrc}" style="width: 343px; height: 480px;">
					<input class="form-control" type="file" name="attachFile" id="attachFile">
				</div>
				<label class="control-label col-sm-3">id</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.memberId}" readonly="readonly" name="memberId">
				</div>
				<label class="control-label col-sm-3">pass</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.pass}" readonly="readonly" name="pass">
				</div>
				<label class="control-label col-sm-3">nickName</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.nickName}" name="nickName" id="nickName">
				</div>
				<label class="control-label col-sm-3">email</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value = "${member.email}" name="email" id="email">
				</div>
				<label class="control-label col-sm-3">phoneNum</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.phoneNum}" name="phoneNum" id="phoneNum">
				</div>
				<label class="control-label col-sm-3">rank</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value = "${member.rank}" name="rank" readonly="readonly">
				</div>
				<div class="text-center">
					<button class="btn btn-success btn-lg">수정</button>
				</div>
			</div>
		</form>	
	</div>
</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>

<script>
	function doAction() {
		var nickName = document.querySelector("#nickName");
		var email = document.querySelector("#email");
		var phoneNum = document.querySelector("#phoneNum");
		
		if(nickName.value == "") {
			alert("닉네임을 입력해주세요")	
			return false;
		}
		if(email.value == "") {
			alert("이메일을 입력해주세요")	
			return false;
		}
		if(phoneNum.value == "") {
			alert("핸드폰을 입력해주세요")	
			return false;
		}
			return true;
	}
</script>
</body>
</html>