package kr.co.ggori.member.servlet;

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
import kr.co.ggori.repository.mapper.IMemberMapper;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/member/myPage")
public class MemberMyPage extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	
	public MemberMyPage() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IMemberMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		MemberVO member = (MemberVO)s.getAttribute("member");
		try {
			member = mapper.selectMemberOne(member);
			request.setAttribute("member", member);
			RequestDispatcher rd = request.getRequestDispatcher("/view/member/myPage.jsp");
			rd.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
