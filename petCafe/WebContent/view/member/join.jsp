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
	회원가입<br>
	<form method="POST" action="join">
		id : <input type="text" name="memberId"><br>
		pass : <input type="text" name="pass"><br>
		nickName : <input type="text" name="nickName"><br>
		email : <input type="text" name="email" id="email"><br>
		phoneNum : <input type="text" name="phoneNum"><br>
		<button>가입하기</button>
	</form>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>