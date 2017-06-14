<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style type="text/css">
	.col-sm-9 {
		margin-bottom: 10px;
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
				<label class="control-label col-sm-3" for="pass">비밀번호</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.pass}" readonly="readonly" name="pass" id="pass">
				</div>
				<label class="control-label col-sm-3" for="nickName">nickName</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.nickName}" readonly="readonly" id="nickName">
				</div>
				<label class="control-label col-sm-3" for="email">e-mail</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value = "${member.email}" readonly="readonly" id="email">
				</div>
				<label class="control-label col-sm-3" for="phoneNum">phone-number</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.phoneNum}" readonly="readonly" id="phoneNum">
				</div>
				<label class="control-label col-sm-3" for="rank">회원 등급</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" value="${member.rank}" readonly="readonly" id="rank">
				</div>
			<div class="text-center">
				<button class="btn btn-success btn-lg">수정하기</button>
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