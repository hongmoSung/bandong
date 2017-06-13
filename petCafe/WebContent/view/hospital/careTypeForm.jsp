<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<textarea rows="" cols="" style="resize: none;"></textarea>
<div class="container">
	<input value="${msg}" id="msg">
	<script type="text/javascript">
		if($("#msg").attr("value") == "성공") {
			alert("등록 성공")
		}
		if($("#msg").attr("value") == "실패") {
			alert("등록 실패")
		}
	</script>
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<jsp:include page="/view/include/leftMenu.jsp"/>
		</div>
		<div class="col-md-10 text-center">
			<div style="text-align: center;">
				<h1>진료 분야 등록</h1>
			</div>
			<form class="form-horizontal" method="post" action="careTypeInsert">
				<div class="form-group">
					<label class="control-label col-sm-3" for="typeName">진료 분야</label>
					<div class="col-sm-9">
					<input class="form-control" type="text" id="typeName" name="typeName"><br>
					</div>
					<label class="control-label col-sm-3" for="hospitalId">병원 아이디</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="hospitalId" name="hospitalId" value="${hospitalId}"><br>
					</div>
					<label class="control-label col-sm-3" for="name">병원 이름</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="name" name="name" value="${hospital.name}"><br>
					</div>
					<label class="control-label col-sm-3" for="address">병원 주소</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="address" name="address" value="${hospital.address}"><br>
					</div>
				</div>
				<button>등록하기</button>
			</form>
		</div>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
	
</body>
</html>