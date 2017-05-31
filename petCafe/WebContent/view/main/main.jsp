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
	main<br>${pageContext.request.contextPath }
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>