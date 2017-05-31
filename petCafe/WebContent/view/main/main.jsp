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
	main<br>
	<c:choose>
		<c:when test="${not empty member}">
			<c:out value="${member.nickName} 님 환영합니다 ^^"/>
		</c:when>
		<c:otherwise>
			<c:out value="로그인해주세요"/>
		</c:otherwise>
	</c:choose>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>