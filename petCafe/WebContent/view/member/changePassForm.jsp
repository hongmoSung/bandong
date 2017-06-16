<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
	.col-sm-9 {
		margin-bottom: 15px;
	}
</style>
</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<input type="hidden" value="${smsg}" id="smsg">
<script type="text/javascript">
	var smsg = document.querySelector("#smsg").value;
	console.log(smsg);
	if(smsg == "s") {
		swal("임시 비밀번호가 전송되었습니다.", "success", "success");
	}
</script>
<div class="container">
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<jsp:include page="/view/include/leftMenu.jsp"/>
		</div>
		<div class="col-md-10">
			<div class="center-block text-center" style="width: 500px; margin-bottom: 25px;">
				<h1>비밀번호 바꾸기</h1>
			</div>
			<div class="center-block" style="width: 500px;">
				<c:out value="${memberID}"/>
				<p style="text-align: center;">고객님의 아이디는 ${memberId} 입니다.</p> 
				<form class="form-horizontal" method="post" action="changePass">
					<input type="text" value="${memberId}" readonly="readonly" hidden="true" name="memberId"><br>
						<div class="form-group">
							<label class="control-label col-sm-3" for="tempPass">임시 비밀번호 </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" name="tempPass" id="tempPass">
							</div>
							<label class="control-label col-sm-3" for="pass">바꿀 비밀번호</label>
							<div class="col-sm-9">
								<input class="form-control" type="text" name="pass" id="pass">
							</div>
							<label class="control-label col-sm-3" for="pass2">비밀번호 확인</label>
							<div class="col-sm-9">
								<input class="form-control" type="text" name="pass2">
							</div>
							<div class="text-center" style="width: 500px;">
								<button class="btn btn-success btn-lg">바꾸기</button>
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