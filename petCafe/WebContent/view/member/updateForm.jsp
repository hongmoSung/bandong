<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>
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
		<h1>수정페이지</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" method="post" action="update">
			<div class="form-group">
				<label class="control-label col-sm-3">id</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.memberId}" readonly="readonly" name="memberId">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">pass</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.pass}" readonly="readonly" name="pass">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">nickName</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.nickName}" name="nickName">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">email</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value = "${member.email}" name="email">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">phoneNum</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.phoneNum}" name="phoneNum">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">rank</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value = "${member.rank}" name="rank" readonly="readonly">
				</div>
			</div>
			<div class="text-center">
				<button>수정</button>
			</div>
	</form>	
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>