<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- sweet -->
<script src="${pageContext.request.contextPath}/sweet/sweetalert.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/sweet/sweetalert.css"/>
</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<div class="container">
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<jsp:include page="/view/include/leftMenu.jsp"/>
		</div>
		<div class="col-md-10">
			<div class="center-block text-center" style="width: 500px; margin-bottom: 25px;">
				<h1>병원상세보기</h1>
		</div>
				<c:set value="${hospital}" var="h"/>
			<div class="center-block" style="width: 500px;">
				<form>
					<div class="form-group">
						<label class="control-label col-sm-3">병원 아이디</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.hospitalId}" name="hospitalId" id="hospitalId">
						</div>
						<label class="control-label col-sm-3">병원명</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.name}" name="hospitalName" id="hospitalName">
						</div>
						<label class="control-label col-sm-3">전화번호</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.telNumber}" name="telNumber" id="telNumber">
						</div>
						<label class="control-label col-sm-3">병원 주소</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.address}" name="address" id="address">
						</div>
						<label class="control-label col-sm-3">위도</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.latitude}" name="latitude" id="latitude">
						</div>
						<label class="control-label col-sm-3">경도</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.longitude}" name="longitude" id="longitude">
						</div>
						<label class="control-label col-sm-3">회원ID</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.memberId}" name="memberId" id="memberId">
						</div>
						<div class="text-center">
							<button>수정하기</button>
						</div>
					</div>
					<div>
						<h1>진료분야</h1>
						<form>
							<label>진료분야</label><input>
							<button>등록하기</button>
						</form>
						<c:forEach items="${careList}" var="c">
								<input type="text" value="${c.careTypeId}" hidden="true"><br>
								<input type="text" value="${c.hospitalId}" hidden="true"><br>
								<input type="text" value="${c.typeName}"><button>삭제하기</button><br>
						</c:forEach>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>