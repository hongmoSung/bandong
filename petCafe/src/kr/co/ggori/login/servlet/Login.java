package kr.co.ggori.login.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IBoardMapper;
import kr.co.ggori.repository.mapper.IMemberMapper;
import kr.co.ggori.repository.vo.FileVO;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/login/login")
public class Login extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	private IBoardMapper bmapper;
	
	public Login () {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IMemberMapper.class);
		this.bmapper = session.getMapper(IBoardMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO member = new MemberVO();
		member.setMemberId(request.getParameter("memberId"));
		member.setPass(request.getParameter("pass"));
		RequestDispatcher rd = null;
		try {
			member = mapper.selectMemberOne(member);
			if (member != null) {
				HttpSession s = request.getSession();
				s.setAttribute("member", member);
				FileVO file = bmapper.selectUserProfile(member.getMemberId());
				if(file != null) {
					s.setAttribute("profileImg", file.getSystemName());
				}
				request.setAttribute("loginSuccess", "로그인 성공");
				rd = request.getRequestDispatcher("/main/Main");
			} else {
				request.setAttribute("loginError", "로그인 실패");
				rd = request.getRequestDispatcher("/login/loginForm");
			}
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
