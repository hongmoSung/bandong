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

@WebServlet("/member/update")
public class MemberUpdate extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	
	public MemberUpdate() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IMemberMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			MemberVO member = new MemberVO();
			member.setPass(request.getParameter("pass"));
			member.setMemberId(request.getParameter("memberId"));
			member = mapper.selectMemberOne(member);
			
			if (member != null) {
				member.setNickName(request.getParameter("nickName"));
				member.setEmail(request.getParameter("email"));
				member.setPhoneNum(Integer.parseInt(request.getParameter("phoneNum")));
				
				int result = mapper.updateMember(member);
				RequestDispatcher rd = null;
				if (result != 0) {
					session.commit();
					rd = request.getRequestDispatcher("updateForm");
					rd.forward(request, response);
				} else {
					rd = request.getRequestDispatcher("updateForm");
					rd.forward(request, response);
				}
			} else {
				System.out.println("error");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
