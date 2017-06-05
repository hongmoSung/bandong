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
		<form class="form-horizontal" method="POST" action="join">
			<div class="form-group">
				<label class="control-label col-sm-3">id</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="memberId" id="memberId">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">pass</label>
				<div class="col-sm-9">
					<input class="form-control" class="form-control" type="text" name="pass">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">nickName</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="nickName">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">email</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="email" id="email">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">phoneNum</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="phoneNum">
				</div>
			</div>
			<div class="text-center">
				<button>가입하기</button>
			</div>
		</form>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>