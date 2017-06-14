package kr.co.ggori.member.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IBoardMapper;
import kr.co.ggori.repository.mapper.IMemberMapper;
import kr.co.ggori.repository.vo.FileVO;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/member/updateForm")
public class MemberUpdateForm extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	private IBoardMapper bmapper;
	
	public MemberUpdateForm() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IMemberMapper.class);
		this.bmapper = session.getMapper(IBoardMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO member = new MemberVO();
		member.setPass(request.getParameter("pass"));
		member.setMemberId(request.getParameter("memberId"));
		try {
			member = mapper.selectMemberOne(member);
			FileVO file = bmapper.selectUserProfile(member.getMemberId());
			String imgSrc = "/upload/userProfile/" + file.getSystemName();
			if (member != null) {
				request.setAttribute("imgSrc", imgSrc);
				request.setAttribute("member", member);
				RequestDispatcher rd = request.getRequestDispatcher("/view/member/updateForm.jsp");
				rd.forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
