<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<div>
	<h1>mail인증 페이지</h1>
	<form method="post" action="authEmail">
		<c:choose>
			<c:when test="${not empty authEmail}">
				email : <input type="text" name="authedMail" value="${authEmail}"><br>
			</c:when>
			<c:otherwise>
				email 인증 : <input type="text" name="authMail"><button>메일인증하기</button><br>
			</c:otherwise>
		</c:choose>
		인증번호 : <input type="text" id="a"><button type="button" onclick="auth()">인증하기</button><br>
		<input type="text" value="${authNum}" id="b"><br>
	</form>
	<form action="joinForm" method="post">
		<button hidden="true" id="joinButton">가입하러가기</button>
	</form>
	
	
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