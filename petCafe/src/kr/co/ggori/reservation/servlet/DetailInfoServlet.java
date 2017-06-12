package kr.co.ggori.reservation.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reservation/detailInfo")
public class DetailInfoServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(request.getParameter("userSelectDate"));
		
		/*
		var testObj = [
			<c:forEach var="index" begin="0" end="${fn:length(hospitalList) - 1}" varStatus="loop">
				<c:if test="${not loop.first}">,</c:if>
				{
					<c:if test="${not empty hospitalList[index].reserDate}">
						"start":"<c:out value='${hospitalList[index].reserDate}'/>T<c:out value='${hospitalList[index].reserTime}'/>",
					</c:if>
				}
			</c:forEach>
		];
		*/
		
// 		var hospitalDayOff = [
//			<c:forEach var="index" begin="0" end="${fn:length(dayOfflist) - 1}" varStatus="loop">
//				<c:if test="${not loop.first}">,</c:if>
//				{
//					  "start":"<c:out value='${dayOfflist[index].offDay}'/>",
//					, "color" : "transparent"
				
//				}
//			</c:forEach>
//		];

		
	}
	
}