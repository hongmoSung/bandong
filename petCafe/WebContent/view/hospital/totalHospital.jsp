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
			<div style="text-align: center;">
				<h1>모든 병원</h1>
			</div>
			<c:forEach items="${hospitals}" var="h">
				<table hidden="true">
					<tr>
						<th>id</th>
						<td id="hospitalId">${h.hospitalId}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td id="name">${h.name}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td id="address">${h.address}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td id="telNumber">${h.telNumber}</td>
					</tr>
					<tr>
						<th>위도</th>
						<td id="latitude">${h.latitude}</td>
					</tr>
					<tr>
						<th>경도</th>
						<td id="longitude">${h.longitude}</td>
					</tr>
					<tr>
						<th>원장</th>
						<td id="memberId">${h.memberId}</td>
					</tr>
				</table>
			</c:forEach>
			
			<!-- 주소 검색을 위한 태그와 버튼-->
			<input type="hidden" id="sample5_address" placeholder="주소">
			<input class="btn btn-primary btn-xl" type="button" onclick="ffffff()" value="주소 검색" style="float: right;" ><br>
			<!-- 맵이 나오는 위치 -->
			<div id="map" style="width:100%;height:350px;"></div>
	</div>
	<!-- 우편검색을 위한 창 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//apis.daum.net/maps/maps3.js?apikey=b3aef8f92a8bdd9510a7905608389df3&libraries=services"></script>
	<script>
		var hospitalId = document.querySelectorAll("#hospitalId");
		var hospitalName = document.querySelectorAll("#name");
		var address = document.querySelectorAll("#address");
		var telNumber = document.querySelectorAll("#telNumber");
		var latitude = document.querySelectorAll("#latitude");
		var longitude = document.querySelectorAll("#longitude");
		var memberId = document.querySelectorAll("#memberId");
	    
		var hospital = [{}];
		for (var i = 0; i < hospitalId.length; i++) {
			hospital[i] = {
					hospitalId : hospitalId[i].innerHTML,
					hospitalName : hospitalName[i].innerHTML,
					address : address[i].innerHTML,
					telNumber : telNumber[i].innerHTML,
					latitude : latitude[i].innerHTML,
					longitude : longitude[i].innerHTML,
					memberId : memberId[i].innerHTML
			}
		}
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new daum.maps.LatLng(37.5638268704, 126.9754657955), // 지도의 중심좌표
		        level: 11 // 지도의 확대 레벨
		    };
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var positions = [{}];
		var infos = [{}];
// 		마커를 표시할 위치와 title 객체 배열입니다 
		for(var i = 0; i < hospital.length; i++) {
			positions[i] = {
				        title: hospital[i].hospitalId, 
				        latlng: new daum.maps.LatLng(hospital[i].latitude, hospital[i].longitude)
				    	}
		}
		//
		for(var i = 0; i < hospital.length; i++) {
			infos[i] = {
			        title: hospital[i].hospitalId,
			        hospitalName: hospital[i].hospitalName,
			        address: hospital[i].address
		    	}
		}
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
		var iwContent = "";
		var marker = [{}];
		for (var i = 0; i < positions.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new daum.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    marker[i] = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage, // 마커 이미지 
		        clickable: true
		    });
		
		}
		for(var i = 0; i < marker.length; i++) {
			console.log(marker[i].dg);
		}
		var infowindow = [{}];
		for(var i = 0; i < infos.length; i++) {
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			// 인포윈도우를 생성합니다
			infowindow[i] = new daum.maps.InfoWindow({
// 			    content : "<div style='padding:5px;'>" + infos[i].hospitalName + "<br>" + infos[i].address + "<br><a href='${pageContext.request.contextPath}/reservation/insert?hospitalId=" + infos[i].title +"'>예약하기</a></div>",
			    content : '<div style="padding:5px;"><a href=${pageContext.request.contextPath}/reservation/selectDate?hospitalId=' + infos[i].title +'>예약하기</a><br><p>병원이름 : ' + infos[i].hospitalName + '</p><p>주소 : ' + infos[i].address + '</p><br></div>',
			    removable : iwRemoveable
			});
			// 마커에 클릭이벤트를 등록합니다
		}
		console.dir(infowindow.content);
		// 클로저
		for(let i = 0; i < infowindow.length; i++) {
// 			console.log(infowindow[i].content);
			daum.maps.event.addListener(marker[i], 'click', function() {
// 			      // 마커 위에 인포윈도우를 표시합니다
			      infowindow[i].open(map, marker[i]);  
			});
		}
		
		
		
		//주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
		//검색을 위한 함수
		function ffffff() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

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
                document.getElementById("sample5_address").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
//                         marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
	</script>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>