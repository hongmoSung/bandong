<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<div class="container">
	<div class="center-block" style="width: 500px;">
		<h1 class="text-center">로그인</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" method="POST" action="login">
			<div class="form-group">
				<label class="control-label col-sm-3" for="memberId">id</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="memberId" id="memberId"><br>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="pass">pass</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="pass" id="pass"><br>
				</div>
			</div>
			<div class="text-center">
				<button>로그인 하기</button>
			</div>
		</form>
		<div>
			<a class="col-sm-6" href="${pageContext.request.contextPath}/login/findForm">id, password 가 기억안나냐?</a>
			<a class="col-sm-6" href="${pageContext.request.contextPath}/member/authForm">아이디가 아직도 없어?!</a>
		</div>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>