package kr.co.ggori.member.servlet;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/member/memberControl")
public class MemberControl extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	public MemberControl() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IMemberMapper.class);
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = request.getSession();
		MemberVO member = (MemberVO)s.getAttribute("member");
		System.out.println(member);
		
		String memberId = member.getMemberId();
		member.setMemberId(memberId);
		System.out.println(member.getMemberId());
		
		List<MemberVO> memberList = null;
		try {
			memberList = mapper.selectMemberAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("memberList", memberList);
		RequestDispatcher rd = request.getRequestDispatcher("/view/member/memberControl.jsp");
		rd.forward(request, response);
	}

}
