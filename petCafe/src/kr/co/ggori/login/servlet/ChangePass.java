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
import kr.co.ggori.repository.mapper.IMemberMapper;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/login/changePass")
public class ChangePass extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	
	public ChangePass() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IMemberMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO member = new MemberVO();
		
		String tempPass = request.getParameter("tempPass");
		String memberId = request.getParameter("memberId");
		member.setPass(tempPass);
		member.setMemberId(memberId);
		String newPass = request.getParameter("pass");
		
		try {
			member = mapper.selectMemberOne(member);
			member.setPass(newPass);
			
			if (member != null) {
				int result = mapper.updateMemberPass(member);
				if (result == 1) {
					session.commit();
					request.setAttribute("loginSuccess", "비밀번호 변경이 완료되었습니다.");
					RequestDispatcher rd = request.getRequestDispatcher("/main/Main");
					rd.forward(request, response);
				}
			} else {
				// 없는 아이디
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
