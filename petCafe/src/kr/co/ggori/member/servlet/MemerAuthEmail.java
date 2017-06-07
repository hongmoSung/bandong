package kr.co.ggori.member.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.db.SendMail;

@WebServlet("/member/authEmail")
public class MemerAuthEmail extends HttpServlet {
	private String result = "";
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("authMail");
		String authNum = randomNum();
		System.out.println(email);
		result = sendEmail(email.toString(), authNum);
		
		if (result.equals("성공")) {
			request.setAttribute("authNum", authNum);
			request.setAttribute("authEmail", email);
		} else {
			System.out.println("인증전송 실패...");
		}
		request.setAttribute("result", result);
		
		// 메일인증을 위해 주소바꿈
//		RequestDispatcher rd = r	quest.getRequestDispatcher("/view/member/join.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("/view/member/authForm.jsp");
		rd.forward(request, response);
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
