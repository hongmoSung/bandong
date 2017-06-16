package kr.co.ggori.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.SendMail;

@WebServlet("/member/authEmail2")
public class AauthEmail extends HttpServlet{
	private String result = "";
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		String email = request.getParameter("authMail");
		String authNum = randomNum();
		System.out.println(request.getParameter("ajax"));
		
		System.out.println(email);
		result = sendEmail(email.toString(), authNum);
		System.out.println(result);
		PrintWriter out = response.getWriter();
		String json = "{"
							+ "\"result\" : \"" + result + "\","
							+ "\"authNum\" : " + authNum + ""
									+ "}";
//		if (result.equals("성공")) {
			out.println(json);
//		} else {
//		}
		//
		out.close();
	}
	
	//
	private String sendEmail(String email, String authNum) {
		return new SendMail().sendEmail(email, authNum);
	}
	
	// 난수 발생
	public String randomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
}
