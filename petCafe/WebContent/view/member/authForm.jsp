<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매일 인증페이지</title>
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
		<h1>mail인증 페이지</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" method="post" action="authEmail">
			<c:choose>
				<c:when test="${not empty authEmail}">
					<div class="form-group">
						<label class="control-label col-sm-3" for="authedMail">email</label>
						<div class="col-sm-9">
							<input class="form-contorl" type="text" name="authedMail" id="authedMail" value="${authEmail}"><br>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<label class="control-label col-sm-3">email 인증</label>
						<div class="col-sm-9">
							<input type="text" name="authMail"><button>메일인증</button>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			
			<div class="form-group">
				<label class="control-label col-sm-3">인증번호</label>
				<div class="col-sm-9">
					<input type="text" id="a"><button type="button" onclick="auth()">인증하기</button><br>
				</div>
			</div>
			<div class="text-center">
				<input type="text" value="${authNum}" id="b"><br>
			</div>
		</form>
		<form class="text-center" action="joinForm" method="post">
			<button class="btn btn-success btn-lg" hidden="true" id="joinButton">가입하러가기</button>
		</form>
	</div>
	
	
	<script>
		function auth() {
			var inputNum = document.querySelector("#a");
			var authNum = document.querySelector("#b")
			var joinButton = document.querySelector("#joinButton");
			console.log(inputNum);
			if(inputNum.value != authNum.value) {
				alert("인증 실패");
			}
			else if (inputNum.value == authNum.value) {
				alert("인증 성공");
				joinButton.hidden = false;
			}
		}
	</script>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>