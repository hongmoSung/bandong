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
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/login/findPass")
public class FindPass extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	
	public FindPass() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IMemberMapper.class);
	}
	
	
	public String getRamdomPassword(int len) { 
		char[] charSet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' 
				}; 
		int idx = 0; StringBuffer sb = new StringBuffer(); 
		for (int i = 0; i < len; i++) { 
			idx = (int) (charSet.length * Math.random()); 
			sb.append(charSet[idx]); 
			} 
		return sb.toString(); 
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tempPass = getRamdomPassword(10);
		String email = request.getParameter("email");
		String memberId = request.getParameter("memberId");
		
		MemberVO member = new MemberVO();
		member.setPass(tempPass);
		member.setEmail(email);
		member.setMemberId(memberId);
		
		RequestDispatcher rd = null;
		
		try {
			int result = mapper.updateMemberPass(member);
			if (result != 0) {
				session.commit();
				new SendMail().requestTempPass(email, memberId, tempPass);
				request.setAttribute("memberId", memberId);
				request.setAttribute("email", email);
				rd = request.getRequestDispatcher("changePassForm");
			} else {
				rd = request.getRequestDispatcher("findPass");
			}
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
