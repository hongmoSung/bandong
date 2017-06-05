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
<h1>수정페이지</h1>
	<form method="post" action="update">
		id : <input type="text" value="${member.memberId}" readonly="readonly" name="memberId"><br>
		pass : <input type="text" value="${member.pass}" readonly="readonly" name="pass"><br>
		nickName : <input type="text" value="${member.nickName}" name="nickName"><br>
		email : <input type="text" value = "${member.email}" name="email"><br>
		phoneNum : <input type="text" value="${member.phoneNum}" name="phoneNum"><br>
		rank : <input type="text" value = "${member.rank}" name="rank" readonly="readonly"><br>
		<button>수정</button>
	</form>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>