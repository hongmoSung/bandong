<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>풀캘린더</title>
	
	<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- 	<link href="../css/custom2.css" rel="stylesheet"> -->
	<link href="${pageContext.request.contextPath}/css/fullcalendar.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/css/fullcalendar.print.css" rel="stylesheet" media="print"/>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/css/moment.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/css/fullcalendar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/css/locale-all.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/css/gcal.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
	<style type="text/css">
	    body {
	        margin : 40px 10px;
	        padding : 0;
	        font-family : "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	        font-size : 14px;
	    }
	    #calendar {
	        max-width : 900px;
	        margin : 0 auto;
	    }
	    .no-diagnosis { 
	    	background-image: url("/petCafe/images/no-diagnosis.jpg"); 
	    	background-size: contain; 
	    } 
	    .fc-day-top.fc-sat.fc-past, .fc-day-top.fc-sat.fc-future { 
	    	color:#0000FF; 
	    }
	    .fc-day-top.fc-sun.fc-past, .fc-day-top.fc-sun.fc-future { 
	    	color:#FF0000; 
	    }
	</style>
	
	<script type="text/javascript">
		var hospitalDayOff = [{
			start: "2017-06-23",
			color: "transparent"
		}];
		var reserList = [
			<c:forEach var="index" begin="0" end="${fn:length(reservationList) - 1}" varStatus="loop">
				<c:if test="${not loop.first}">,</c:if>
				{
					"start":"<c:out value='${reservationList[index].reserDate}'/>T<c:out value='${reservationList[index].reserTime}'/>",
					<c:set value="${reservationList[index].reserName}" var="reserName"/>
					"title": "<c:out value='${reserName.charAt(0)}'/>*<c:out value='${reserName.charAt(2)}'/>"
				}
			</c:forEach>
		];
		
	// 	hospitalDayOff["backgroundColor"] = "#99CCFF";
	// 	hospitalDayOff["rendering"] = "background";
		var selectedDate;
		var holiday = [];
		<jsp:useBean id="now" class="java.util.Date"/>
		<fmt:formatDate value="${now}" var="todayYear" pattern="yyyy"/>
		<fmt:formatDate value="${now}" var="todayMonth" pattern="MM"/>
		<fmt:formatDate value="${now}" var="todayDate" pattern="dd"/>
		jQuery(document).ready(function() {
			jQuery("#calendar").fullCalendar({
				  locale : "ko"
				, editable : false
				, eventLimit : true
				, eventSources : [
					{
						  events : hospitalDayOff
					},
					{
						  events : reserList
					},
					{
						  googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
						, className : "koHolidays"
						, color : "#FF0000"
					}
				]
				, eventRender : function (event, eventElement) {
					for(var i = 0; i < hospitalDayOff.length; i++) {
						if(event.start["_i"].substring(0, 10) == hospitalDayOff[i].start.substring(0, 10)) {
							$("td[data-date='" + (event.start["_i"].substring(0,10)) + "']").addClass("no-diagnosis");
						}
					}
					if(event.id) {
						var holiSub = event.id.substring(0, 8);
						holiday.push(holiSub);
					}
				}
				, dayClick : function(date, jsEvent, view) {
					if(selectedDate) {
						$(selectedDate).css('background-color', '#FFFFFF');
						$(selectedDate).popover("destroy");
					}
					selectedDate = this;
					$("#reserBtn").attr("disabled", true);
					$("#reserSelect").html("");
					
					var reserOK = false;
					var popContent;
					if(${todayYear} - date.format("YYYY") < 0) {
						reserOK = true;
					}
					else if(${todayYear} - date.format("YYYY") == 0) {
						if(${todayMonth} - date.format("MM") < 0) {
							reserOK = true;
						}
						else if(${todayMonth} - date.format("MM") == 0) {
							if(${todayDate} - date.format("DD") < 0) {
								reserOK = true;
							}
						}
					}
					
// 					if( !($(this).attr("data-toggle")) ) {
						$(this).attr("title", date.format("YYYY-MM-DD"));
						$(this).attr("data-container", "body"); 
						$(this).attr("data-toggle", "popover");
						$(this).attr("data-placement", "right"); 
							
						if(reserOK) {
							var todayReser;
							var reserCount = 0;
							for(var i = 0; i < reserList.length; i++) {
								var reserListDate = reserList[i].start;
								if(reserListDate.substring(0, 10) == date.format("YYYY-MM-DD")) {
									reserCount++;
									if(!popContent) {
										popContent = reserListDate.substring(11, 16) + " " + reserList[i].title;
									}
									else {
										popContent += reserListDate.substring(11, 16) + " " + reserList[i].title;
									}
									for(var time = 10; time <= 18; time++) {
										if( parseInt(reserListDate.substring(11, 13)) == time )
											continue;
										$("#reserSelect").html($("#reserSelect").html() + "<option value='" + reserListDate.substring(11, 13) + "'>" + time + "</option>");
									}
								}
								if(reserCount >= 2) {
									popContent = "더이상 예약 할 수 없습니다";
									reserOK = false;
									break;
								}
							}
							if(!popContent) {
								popContent = "등록된 예약이 없습니다!";
							}
							
							for(var i = 0; i < holiday.length; i++) {
								if( holiday[i] == date.format("YYYYMMDD") ) {
									popContent = "공휴일 입니다.";
									reserOK = false;
									break;
								}
							}
							for(var i = 0; i < hospitalDayOff.length; i++) {
								if( hospitalDayOff[i].start == date.format("YYYY-MM-DD") ) {
									popContent = "오늘은 진료가 없습니다..";
									reserOK = false;
									break;
								}
							}
						}
						else {
							popContent = "지난 날짜에는 예약할 수 없습니다. T_T";
						}

						if(reserOK) {
							$("#reserBtn").attr("disabled", false);
							$("#selectDate").attr("value", date.format("YYYY-MM-DD"));
						}
						$(this).attr("data-content", popContent);
						$(this).css('background-color', '#99CCFF');
// 					}
					$('[data-toggle="popover"]').popover({container: "body"});
				}
				, googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE" 
	    	});
	    });
	</script>
	<script>
		$(document).ready(function() {
		    $("#reserBtn").on("click", function () {
		        $("#reserModal").modal();
		    });
		});
 	</script>
	<body>
		<div class="container">
			<div>
				<c:import url="/view/include/topMenu.jsp"/>
			</div>
			<div class="row" id="firstDiv">
				<div class="col-md-2">
					<c:import url="/view/include/leftMenu.jsp"/>
				</div>
				<div id="calendar" class="col-md-10 cont">
					<div>
						<button class="btn btn-primary btn-xl page-scroll" disabled="true" id="reserBtn"
								data-toggle="modal" data-target="#myModal">예약하기</button>
					</div>
				</div>
			</div>
			<div class="modal fade" id="reserModal">
				<div class="modal-dialog">
				
				  <!-- Modal content-->
				  <div class="modal-content">
				    <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">X</button>
						<h4 class="modal-title">예약 상세 페이지</h4>
				    </div>
				    <div class="modal-body">
				    	<form method="post" name="rForm" onsubmit="false;">
					    	예약 날짜 : <input type="text" name="userSelectDate" id="selectDate" disabled="true"/>
					    	예약 시간 : <select name="reserTime" id="reserSelect">
									</select>시<br>

							진료 분야 : <select name="careType">
										<c:forEach var="type" items="${careTypeList}">
											<option value="${type.careTypeId}"><c:out value="${type.typeName}"/></option>
										</c:forEach>
									</select><br>
									
							상세 내용 : <textarea rows="5" cols="60" name="detail" style="resize: none;"></textarea><br>
							예약자 이름 : <input type="text" name="reserName"/><br>
							<div id="checkResult">aaa</div>
							<button id="insertBtn" type="button" class="btn btn-default">insert</button>
							<!--  data-dismiss="modal" 
							action="reserInsert" -->
				    	</form>
					</div>
<!-- 					<div class="modal-footer"> -->
<!-- 					</div> -->
				  </div>
				  
				</div>
			</div>
		</div>
	</body>
	<script>
		var f = document.rForm;
		
		var time = f.userSelectDate;
		var care = f.careType;
		var name = f.reserName;
		console.log("time1 : ", time.value);
		
		$("#insertBtn").on("click", function () {
			time = f.userSelectDate;
			care = f.careType;
			name = f.reserName;
			console.log("time2 : ", time.value);
			
			$.ajax({
				type: "post",
// 				dataType: 
				data: {time: time.value},
				url: "${pageContext.request.contextPath}/view/reservation/formCheck.jsp",
				success: function (data) {
					$("#checkResult").html(data);
				}
			});
		});
		function chkForm() {
			
			
			if(time.value == "") {
				return ;
			}
			
			if(care.value == "") {
				return ;
			}
			
			if(name.value == "") {
				return ;
			}
		}
	</script>
</html>