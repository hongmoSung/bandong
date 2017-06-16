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

@WebServlet("/member/rankChange")
public class RankChange extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	
	public RankChange() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IMemberMapper.class);
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO member = new MemberVO();
		System.out.println(request.getParameter("memId"));
		member.setMemberId(request.getParameter("memId"));
		member.setRank(request.getParameter("rank"));
		System.out.println(request.getParameter("rank"));
		
		try {
			mapper.updateMemberRank(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/member/memberControl");
		rd.forward(request, response);
	}
}
