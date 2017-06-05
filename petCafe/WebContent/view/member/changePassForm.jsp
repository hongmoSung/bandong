<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h1>비밀번호 바꾸기</h1>
	<c:out value="${memberID}"/>
	<form method="post" action="changePass">
		<input type="text" value="${memberId}" readonly="readonly"><br>
		현재 비밀번호 : <input type="text" name="tempPass"><br>
		바꿀 비밀번호 : <input type="text" name="pass"><br>
		비밀번호 확인 : <input type="text" name="pass2"><br>
		<button>바꾸기</button>
	</form>	
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>