<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- sweet -->
<script src="${pageContext.request.contextPath}/sweet/sweetalert.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/sweet/sweetalert.css"/>
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/view/include/topMenu.jsp"/>
	</div>
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<jsp:include page="/view/include/leftMenu.jsp"/>
		</div>
		<input type="hidden" value="${loginError}" id="msg">
		<script type="text/javascript">
			var mm = $("#msg").attr("value");
			console.log(mm);
			if(mm == "로그인 실패") {
				swal("로그인에 실패하였습니다.", "똑바로 적어주세요...", "error");
			}
			if(mm == "") {
				swal("로그인 해주세요 ^^");
			}
		</script>
		<div class="col-md-10">
			<div class="center-block text-center" style="width: 500px; margin-bottom: 25px;">
				<h1 class="text-center">로그인</h1>
				<form class="form-horizontal" method="POST" action="login" onsubmit="return doAction()" id="mForm">
					<div class="form-group text-center">
						<label class="control-label col-sm-3" for="memberId">id</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" name="memberId" id="memberId"><br>
						</div>
						<label class="control-label col-sm-3" for="pass">pass</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" name="pass" id="pass"><br>
						</div>
					</div>
					<div class="text-center center-block" style="width: 500px;">
						<button class="btn btn-primary btn-lg" style="margin: 0 auto;">로그인 하기</button>
					</div>
					<div class="row" style="margin-top: 100px;">
						<a class="col-sm-6" href="${pageContext.request.contextPath}/login/findForm">id, password 가 기억안나냐?</a>
<%-- 							<a class="col-sm-6" href="${pageContext.request.contextPath}/member/authForm">아이디가 아직도 없어?!</a> --%>
						<a class="col-sm-6" href="${pageContext.request.contextPath}/member/join2">아이디가 아직도 없어?!</a>
					</div>
				</form>
			</div>
		</div>
	</div>	
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
<!-- 매일전송 성공 여부를 위한 인풋태그 -->
<input value="${result}" hidden="true" name="result" id="result"/> 
<script>
	var result = document.querySelector("#result");
	if (result.value != "") {
		swal(result.value);
	}
</script>
<script>
	var id = document.querySelector("#memberId");
	var pass = document.querySelector("#pass");
	function doAction() {
		console.log("zz");
		if (id.value == "") {
			swal("id를 입력하세요")
			return false;
		}
		if (pass.value == "") {
			swal("비밀번호를 입력하세요")
			return false;
		}
		return true;
	}
</script>

</body>
</html>