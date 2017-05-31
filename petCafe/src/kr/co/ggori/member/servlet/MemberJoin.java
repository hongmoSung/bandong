package kr.co.ggori.member.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IMemberMapper;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/member/join")
public class MemberJoin extends HttpServlet{
		private SqlSession session;
		private IMemberMapper mapper;
		
		public MemberJoin () {
			session = MyAppSqlConfig.getSqlSessionInstance();
			this.mapper = session.getMapper(IMemberMapper.class);
		}

		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			MemberVO member = new MemberVO();
			member.setMemberId(request.getParameter("memberId"));
			member.setPass(request.getParameter("pass"));
			member.setNickName(request.getParameter("nickName"));
			member.setEmail(request.getParameter("email"));
			member.setPhoneNum(Integer.parseInt(request.getParameter("phoneNum")));
			try {
				int result = mapper.insertMember(member);
				if (result != 0) {
					session.commit();
					RequestDispatcher rd = request.getRequestDispatcher("/main/Main");
					rd.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
