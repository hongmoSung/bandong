<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=b3aef8f92a8bdd9510a7905608389df3&libraries=services"></script>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- sweet -->
<script src="${pageContext.request.contextPath}/sweet/sweetalert.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/sweet/sweetalert.css"/>

<!--  -->
<script type="text/javascript">
	function doAction() {
		var name = document.querySelector("#name");
		var address = document.querySelector("#address");
		var telNumber = document.querySelector("#telNumber");
		if (address.value == "") {
			swal("주소를 등록해주세요");
			return false;			
		}
		if(name.value == "") {
			swal("병원 이름을 등록해주세요");
			return false;
		}
		if(telNumber.value == "") {
			swal("전화번호를 등록해주세요");
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
	<input type="text" value="${msg}" id="zz">
	<script>
		console.log($("#zz").value);
		
		if($("#zz").attr("value") == "실패") {
			alert("등록 실패");
		} 
		if($("#zz").attr("value") == "성공") {
			alert("등록 성공");
		} 
	</script>
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<jsp:include page="/view/include/leftMenu.jsp"/>
		</div>
		<div class="col-md-10 text-center">
		<div class="center-block text-center" style="width: 500px; margin-bottom: 25px;">
			<h1>병원등록</h1>
			<div id="map" style="width:100%;height:350px;margin-top:10px; margin-bottom:10px; display:none"></div>
			<form class="form-horizontal" method="post" action="join" onsubmit="return doAction();">
				<div style="margin-bottom: 15px;">
					<input class="col-sm-9" type="text" placeholder="주소"  id="address" name="address">
					<input class="col-sm-3" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="name">병원이름</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="name" name="name">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="telNumber">전화번호</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="telNumber" name="telNumber">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="lat">위도</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="lat" name="latitude">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="lng">경도</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="lng" name="longitude">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="memberId">회원아이디</label>
					<div class="col-sm-9">
						<input class="form-control" type="text" id="memberId" name="memberId" value="${member.memberId}" readonly="readonly">
				</div>
				<div class="text-center">
					<button class="btn btn-success btn-lg" style="margin-top: 20px;">등록하기</button>
				</div>
				</div>
			</form>
		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		</div>
	</div>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
       mapOption = {
           center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
           level: 5 // 지도의 확대 레벨
       };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
// 				alert(fullAddr);
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
//                        	alert(result.addr[0].lat);// 위도
//                        	alert(result.addr[0].lng);// 경도
                       	
                       	// 인풋텍스트에 넣어주기
                       	var lat = document.querySelector("#lat");
                       	var lng = document.querySelector("#lng");
                       	
                       	lat.value = result.addr[0].lat;
                       	lng.value = result.addr[0].lng;
//                        	document.appendChild()
                       	
                       	
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</body>
</html>
