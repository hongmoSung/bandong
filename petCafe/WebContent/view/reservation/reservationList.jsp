<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<link href="../css/bootstrap.min.css" rel="stylesheet">
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
			.fc-day-top.fc-sat.fc-past, .fc-day-top.fc-sat.fc-future { 
	    		color:#0000FF; 
		    }
		    .fc-day-top.fc-sun.fc-past, .fc-day-top.fc-sun.fc-future { 
		    	color:#FF0000; 
		    }
		</style>

		<script type="text/javascript">
			var reserList = [];
			<c:if test="${not empty reserList}">
				reserList = [
					<c:forEach var="index" begin="0" end="${fn:length(reserList) - 1}" varStatus="loop">
						<c:if test="${not loop.first}">,</c:if>
						{
							"start":"<c:out value='${reserList[index].reserDate}'/>T<c:out value='${reserList[index].reserTime}'/>",
							"title": "<c:out value='${hospitalList[index].name}'/>",
							"id": "<c:out value='${reserList[index].reserId}'/>"
						}
					</c:forEach>
				];
			</c:if>
		
	// 	hospitalDayOff["backgroundColor"] = "#99CCFF";
	// 	hospitalDayOff["rendering"] = "background";
		var selectedDate;
		var holiday = [];
		<jsp:useBean id="now" class="java.util.Date"/>
		<fmt:formatDate value="${now}" var="todayDate" pattern="yyyyMMddHH"/>
		
		jQuery(document).ready(function() {
			jQuery("#calendar").fullCalendar({
				  locale : "ko"
				, editable : false
				, eventLimit : true
				, header : {
					left: 'prev',
				    center: 'title',
				    right: 'today, next'
				}
				, eventSources : [
					{
						  events : reserList
					},
					{
						  googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
						, className : "koHolidays"
						, color : "#FF0000"
					}
				]
				, eventClick:function(calEvent, jsEvent, view) {
					var updateOK = false;
					var selDate = calEvent.start;

					if( selDate.format("YYYYMMDDHH") - ${todayDate} >= 3 ) {
						updateOK = true;
					}
					
					if(updateOK) {
						$("#reserId").attr("value", calEvent.id);
						$("#selectDate").attr("value", selDate.format("YYYY-MM-DD"));
					}
					else {
						alert("지난 날짜는 수정 또는 삭제할 수 없습니다");
						return ;
					}
					
					$.ajax({
						data: {
							  "reserId": reserId.value
						},
						url: "userReserCheck",
						success: function (data) {
							$("#inputReserForm").html(data);
						}
					});
					$("#updateModal").modal();
					
	            }
				, dayClick : function(date, jsEvent, view) {
					if(selectedDate) {
						$(selectedDate).css('background-color', '#FFFFFF');
						$(selectedDate).popover("destroy");
					}
					selectedDate = this;
					
					var popContent;
					
					$(this).attr("title", date.format("YYYY-MM-DD"));
					$(this).attr("data-container", "body"); 
					$(this).attr("data-toggle", "popover");
					$(this).attr("data-placement", "right"); 
					
					for(var i = 0; i < reserList.length; i++) {
						var reserListDate = reserList[i].start;
						if(reserListDate.substring(0, 10) == date.format("YYYY-MM-DD")) {
							if(!popContent) {
								popContent = reserListDate.substring(11, 16) + " " + reserList[i].title;
							}
							else {
								popContent += reserListDate.substring(11, 16) + " " + reserList[i].title;
							}
						}
					}
					if(!popContent) {
						popContent = "등록된 예약이 없습니다!";
					}
							
					$(this).attr("data-content", popContent);
					$(this).css('background-color', '#99CCFF');
					
					$('[data-toggle="popover"]').popover({container: "body"});
				}
				, googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE" 
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
				</div>
			</div>
			
			<div class="modal fade" id="updateModal">
				<div class="modal-dialog">
					<div class="modal-content">
					    <div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">X</button>
							<h4 class="modal-title">예약 정보 확인</h4>
					    </div>
					    <div class="modal-body">
					    	<form method="post" name="uForm" onsubmit="return chkForm();" action="reserUpdate" id="uForm">
					    		예약 날짜 : <input type="text" name="userSelectDate" id="selectDate" readonly/>
					    		<input type="hidden" name="reserId" id="reserId"/>
					    		<div id="inputReserForm">
					    		</div>
					    		<div>
					    			<button id='updateBtn' type='button' class='btn btn-default' onclick='chkForm();'>수정</button>
					    			<button id='deleteBtn' type='button' class='btn btn-default' onclick='deleteReser();'>삭제</button>
					    		</div>
							</form>
							<div id="checkResult"></div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</body>
	<script>
		var f = document.uForm;

		function validTest() {
			var reserName = f.reserName;
			$.ajax({
				data: {
					  "name": reserName.value
				},
				url: "modifyFormCheck",
				success: function (data) {
					$("#checkResult").html(data);
				}
			});
		}
		
		function chkForm() {
			var reserName = f.reserName;
			console.log("true?false? : ", $("#checkResult>p").text() == ("수정 또는 삭제 버튼을 누르세요") || $("#checkResult>p").text() == "");
			if( $("#checkResult>p").text() == ("수정 또는 삭제 버튼을 누르세요") || $("#checkResult>p").text() == "") {
				f.submit();
			}
			else {
				alert("수정된 내용을 확인해 주세요..");
				return ;
			}
		}
		
		function deleteReser() {
			alert("삭제하겠습니다..");
			
			f.action = "reserDelete";
			f.submit();
		}
	</script>
</html>