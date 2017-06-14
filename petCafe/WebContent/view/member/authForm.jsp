<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매일 인증페이지</title>
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
<div class="container">
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<jsp:include page="/view/include/leftMenu.jsp"/>
		</div>
	<div class="center-block text-center" style="width: 500px; margin-bottom: 25px;">
		<h1>mail인증 페이지</h1>
		<!-- 메일전송 성공여부 매세지 -->
		<input type="text" value="<c:out value="${result}"/>" id="result" name="result" hidden="true">
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" method="post" action="authEmail" onsubmit="return doAction()">
			<div class="form-group">
				<c:choose>
					<c:when test="${not empty authEmail}">
							<label class="control-label col-sm-3" for="authedMail">email</label>
							<div class="col-sm-9">
								<input class="form-control" type="text" name="authedMail" id="authedMail" value="${authEmail}" readonly="readonly"><br>
							</div>
							<label class="control-label col-sm-3">인증번호</label>
							<div class="col-sm-9">
								<input type="text" id="a"><button type="button" onclick="auth()">인증하기</button><br>
							</div>
							<div class="text-center">
								<input type="text" value="${authNum}" id="b" hidden="true"><br>
							</div>
					</c:when>
					<c:otherwise>
							<label class="control-label col-sm-3">email 인증</label>
							<div class="col-sm-9">
								<input type="text" name="authMail" id="authMail"><button>메일인증</button>
							</div>
					</c:otherwise>
				</c:choose>
		</form>
		<form class="text-center" action="joinForm" method="post">
			<input type="text" value="${authEmail}" name="email" id="email" hidden="true"/><br>
			<button hidden="true" id="joinButton">가입하러가기</button>
		</form>
			</div>
		</div>
	</div>
</div>
	<script>
		var result = document.querySelector("#result");
		console.log(result.value);
		if(result.value != "") {
			if(result.value == "성공") {
				swal("인증번호가 전송되었습니다.", "Your imaginary file has been deleted.", "success");
			}
			if(result.value == "실패") {
				swal("인증번호가 전송실패되었습니다.", "Your imaginary file has been deleted.", "error");
			}
		}
		function doAction() {
			
			var email = document.querySelector("#authMail");
			
			if(email.value == "") {
				swal("email을 입력해주세요");
				return false;
			}
			return true;			
		}
		function auth() {
			var inputNum = document.querySelector("#a");
			var authNum = document.querySelector("#b")
			var joinButton = document.querySelector("#joinButton");
			console.dir(joinButton);
			console.log(inputNum);
			if(inputNum.value == "") {
				swal("인증번호를 넣어주세요");
				return
			}
			if(inputNum.value != authNum.value) {
				swal("인증 실패", "Your imaginary file is safe :)", "error");
				return
			}
			else if (inputNum.value == authNum.value) {
				swal("인증 성공!", "Your imaginary file has been deleted.", "success");
				joinButton.hidden = false;
			}
		}
	</script>

<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>