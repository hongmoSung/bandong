<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>예약 상세 페이지</title>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div>
			<c:import url="/view/include/topMenu.jsp"/>
		</div>
		
		<div class="row" id="firstDiv">
			<div class="col-md-2">
				<c:import url="/view/include/leftMenu.jsp"/>
			</div>
			<div class="col-md-10 cont">
				<form action="insertReser" method="post">
					예약 날짜 : <input type="text" value="${userSelectDate}" name="reserDate"/><br>
					예약 시간 : <select name="reserTime">
								<c:forEach begin="10" end="18" var="time">
									<option value="${time}"><c:out value="${time}"/></option>
								</c:forEach>
							</select>시<br>

					진료 분야 : <select name="careType">
								<c:forEach var="type" items="${careTypeList}">
									<option value="${type.careTypeId}"><c:out value="${type.typeName}"/></option>
								</c:forEach>
							</select><br>
					
					상세 내용 : <textarea rows="8" cols="100" name="detail"></textarea><br>
					예약자 이름 : <input type="text" name="reserName"/><br>
					<input type="hidden" value="${hospitalId}" name="hospitalId"/><br>
					
					<button>예약 하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>