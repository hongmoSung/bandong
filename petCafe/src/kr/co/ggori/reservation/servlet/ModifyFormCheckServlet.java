package kr.co.ggori.reservation.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reservation/modifyFormCheck")
public class ModifyFormCheckServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		Pattern koPattern = Pattern.compile("(^[가-힣]*$)");
		Pattern enPattern = Pattern.compile("(^[a-zA-Z]*$)");
		
		String name = request.getParameter("name");
		
		Matcher koMatcher = koPattern.matcher(name);
		Matcher enMatcher = enPattern.matcher(name);

		boolean check = false;
		String resultStyle = "color: blue;";
		String comment = "수정 또는 삭제 버튼을 누르세요";
		
		if(name == "") {
			check = true;
			comment = "예약자 이름을 입력해 주세요!";
		}
		else if( !koMatcher.find() && !enMatcher.find() ) {
			check = true;
			comment = "예약자 이름은 한글 또는 영문자만 입력 가능합니다";
		}
		
		if(check) {
			resultStyle = "color: red;";
		}
		
		PrintWriter out = response.getWriter();
		out.println("<p style='" + resultStyle + "'>" + comment + "</p>");
		out.close();
	}
	
}