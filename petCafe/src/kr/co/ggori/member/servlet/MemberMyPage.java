package kr.co.ggori.member.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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

@WebServlet("/member/myPage")
public class MemberMyPage extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	private IBoardMapper bmapper;
	
	public MemberMyPage() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IMemberMapper.class);
		this.bmapper = session.getMapper(IBoardMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		MemberVO member = (MemberVO)s.getAttribute("member");
		FileVO file = new FileVO();
		try {
			member = mapper.selectMemberOne(member);
			if(file != null) {
				file = bmapper.selectUserProfile(member.getMemberId());
				String imgSrc = "/upload/userProfile/" + file.getSystemName();
				System.out.println(imgSrc);
				request.setAttribute("file", file);
				request.setAttribute("imgSrc", imgSrc);
			}
			request.setAttribute("member", member);
			RequestDispatcher rd = request.getRequestDispatcher("/view/member/myPage.jsp");
			rd.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
