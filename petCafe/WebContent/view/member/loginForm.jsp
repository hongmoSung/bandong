<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
로그인
	<form method="POST" action="login">
		id : <input type="text" name="memberId"><br>
		pass : <input type="text" name="pass"><br>
		<button>로그인 하기</button><br>
	</form>
	<a href="${pageContext.request.contextPath}/login/findForm">id, password 가 기억안나냐?</a>
	<a href="${pageContext.request.contextPath}/member/authForm">아이디가 아직도 없어?!</a>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>