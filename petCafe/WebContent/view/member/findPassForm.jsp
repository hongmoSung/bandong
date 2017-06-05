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
	<h1>비밀번호 찾기</h1>
	<form method="post" action="findPass">
		email : <input type="text" name="email"><br>
		id : <input type="text" name="memberId"><br>
		<button>찾기</button>
	</form>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>