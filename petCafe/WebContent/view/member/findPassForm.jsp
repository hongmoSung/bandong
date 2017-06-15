<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- sweet -->
<script src="${pageContext.request.contextPath}/sweet/sweetalert.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/sweet/sweetalert.css"/>
<style type="text/css">
	.col-sm-9 {
		margin-bottom: 15px;
	}
</style>
<script type="text/javascript">
	function doAction() {
		var email = document.querySelector("#email");
		var memberId = document.querySelector("#memberId");
		 
		if(email.value == "") {
			swal("email을 입력해주세요");
			return false;
		}
		if(memberId.value == "") {
			swal("memberId를 입력해주세요");
			return false;
		}
		return true;
	}	
</script>
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
			<div class="center-block text-center" style="width: 500px; margin-bottom: 20px;">
				<h1>비밀번호 찾기</h1>
			</div>
			<div class="center-block" style="width: 500px;">
				<form class="form-horizontal" method="post" action="findPass" onsubmit="return doAction();">
					<div class="form-group">
						<label class="control-label col-sm-3">email</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" name="email" id="email">
						</div>
						<label class="control-label col-sm-3">memberId</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" name="memberId" id="memberId">
						</div>
						<div class="text-center">
							<button class="btn btn-success btn-lg">찾기</button>
						</div>
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