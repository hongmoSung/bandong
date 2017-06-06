<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
		<h1>비밀번호 찾기</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" method="post" action="findPass">
			<div class="form-group">
				<label class="control-label col-sm-3">email</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="email">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">memberId</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" name="memberId">
				</div>
			</div>
			<div class="text-center">
				<button class="btn btn-success btn-lg">찾기</button>
			</div>
		</form>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>