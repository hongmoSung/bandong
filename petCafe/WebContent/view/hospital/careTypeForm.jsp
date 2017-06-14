<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<textarea rows="" cols="" style="resize: none;"></textarea>
<div class="container">
	<input value="${msg}" id="msg">
	<script type="text/javascript">
		function doAction() {
			var typeName = document.querySelector("#typeName");
			console.log(typeName.value);
			if(typeName.value == "") {
				swal("진료 분야를 적어주세요!");
				return false;
			}
			return true;
		}
		if($("#msg").attr("value") == "성공") {
			swal("등록 성공!", "You clicked the button!", "success");
		}
		if($("#msg").attr("value") == "실패") {
			swal("등록 실패", "Your imaginary file is safe :)", "error");
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
			<form class="form-horizontal" method="post" action="careTypeInsert" onsubmit="return doAction()">
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