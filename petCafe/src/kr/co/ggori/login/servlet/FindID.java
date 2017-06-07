package kr.co.ggori.login.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import common.db.SendMail;
import kr.co.ggori.repository.mapper.IMemberMapper;

@WebServlet("/login/findId")
public class FindID extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	
	public FindID() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IMemberMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		try {
			String email = request.getParameter("email");
			String userId = mapper.selectMemberByEmail(email);
			
			if (userId != "") {
				String result = new SendMail().sendEmailForID(email, userId);
				rd = request.getRequestDispatcher("/view/member/loginForm.jsp");
				request.setAttribute("result", result);
				System.out.println("메일보내기 성공");
			} else {
				System.out.println("해당하는 이메일로 등록된 아이디가 없습니다.");
				rd = request.getRequestDispatcher("/view/member/findForm.jsp");
			}
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("여기여긴");
		}
	}
}
