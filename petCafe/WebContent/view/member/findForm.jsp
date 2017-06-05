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
	<h1>찾기 페이지</h1>
	<form method="POST" action="findId">
		email : <input type="text" name="email"><br>
		<button>아이디 찾기</button><br>
	</form>
	<a href="${pageContext.request.contextPath}/login/findPassForm">비밀번호 찾기</a>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>