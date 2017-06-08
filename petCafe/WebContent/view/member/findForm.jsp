<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
		<h1>찾기 페이지</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-inline" method="POST" action="findId" onsubmit="return doAction()">
			<div class="form-group">
				<label for="email">E-mail</label>
				<input type="text" name="email" id="email">
				<button class="btn btn-success btn-lg">아이디 찾기</button><br>
			</div>
		</form>
	</div>
	<div class="center-block text-center" style="width: 500px;">
		<a href="${pageContext.request.contextPath}/login/findPassForm">비밀번호 찾기</a>
	</div>
</div>

<script>
	function doAction() {
		var email = document.querySelector("#email");
		
		if (email.value == "") {
			alert("email을 입력해주세요")
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