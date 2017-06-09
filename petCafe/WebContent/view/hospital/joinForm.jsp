<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=b3aef8f92a8bdd9510a7905608389df3&libraries=services"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>	
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<div class="container">
	<div class="center-block text-center" style="width: 500px;">
		<h1>병원등록</h1>
	</div>
	<div class="center-block" style="width: 500px;">
		<form class="form-horizontal" method="post" action="join">
			<div class="form-group">
				<input class="col-sm-9" type="text" placeholder="주소"  id="address" name="address">
				<input class="col-sm-3" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
			</div>
			<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
			<div class="form-group">
				<label class="control-label col-sm-3">병원이름</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" id="name" name="name">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">전화번호</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" id="telNumber" name="telNumber">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">위도</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" id="lat" name="latitude">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">경도</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" id="lng" name="longitude">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">회원아이디</label>
				<div class="col-sm-9">
					<input class="form-control" type="text" id="memberId" name="memberId" value="${member.memberId}">
				</div>
			</div>
			<div class="text-center">
				<button class="btn btn-success btn-lg">등록하기</button>
			</div>
		</form>
	</div>
	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
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
