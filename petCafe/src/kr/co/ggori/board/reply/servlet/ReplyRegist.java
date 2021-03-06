package kr.co.ggori.board.reply.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IReplyMapper;
import kr.co.ggori.repository.vo.MemberVO;
import kr.co.ggori.repository.vo.ReplyVO;

@WebServlet("/board/replyRegist")
public class ReplyRegist extends HttpServlet {

	private SqlSession session = null;
	private IReplyMapper mapper = null;
	
	public ReplyRegist() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IReplyMapper.class);
	}
	
	@Override
	public void service(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int no = Integer.parseInt(request.getParameter("boardNo"));
			HttpSession s = request.getSession();
			MemberVO member = (MemberVO)s.getAttribute("member");
			String memberId = member.getMemberId();
			System.out.println(no);
			
			ReplyVO reply = new ReplyVO();
			reply.setBoardNo(no);
			reply.setContent(request.getParameter("content"));
			System.out.println(member.getNickName());
			reply.setNickName(member.getNickName());
			reply.setMemberId(memberId);
			System.out.println(reply.getNickName());
			
			mapper.insertReply(reply);
			session.commit();
			
			
			String bType = request.getParameter("boardType");
			System.out.println(bType);
			
			
			switch (bType){
			case "notice" : response.sendRedirect("noticeDetail?boardNo=" + no);
							break;
			case "sale" :   response.sendRedirect("saleDetail?boardNo=" + no);
							break;
			case "tip" :  response.sendRedirect("tipDetail?boardNo=" + no);
						  break;
			case "image" :  response.sendRedirect("imageDetail?boardNo=" + no);
							break;
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}











