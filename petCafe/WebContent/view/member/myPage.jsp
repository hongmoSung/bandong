<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
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
		<h1 class="text-center">myPage</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" role="form" method="post" action="updateForm">
			<div class="form-group">
				<label class="control-label col-sm-3" for="memberId">아이디</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.memberId}" readonly="readonly" id="memberId" name="memberId">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="pass">비밀번호</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.pass}" readonly="readonly" name="pass" id="pass">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="nickName">nickName</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.nickName}" readonly="readonly" id="nickName">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="email">e-mail</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value = "${member.email}" readonly="readonly" id="email">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="phoneNum">phone-number</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.phoneNum}" readonly="readonly" id="phoneNum">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="rank">회원 등급</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.rank}" readonly="readonly" id="rank">
				</div>
			</div>
			<div class="text-center">
				<button class="btn btn-success btn-lg">수정하기</button>
			</div>
		</form>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>