package kr.co.ggori.board.reply.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IReplyMapper;
import kr.co.ggori.repository.vo.ReplyVO;

@WebServlet("/board/replyUpdate")
public class ReplyUpdate extends HttpServlet {

	private SqlSession session = null;
	private IReplyMapper mapper = null;
	
	public ReplyUpdate() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IReplyMapper.class);
	}
	
	@Override
	public void service(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int no = Integer.parseInt(request.getParameter("boardNo"));
			int replyId = Integer.parseInt(request.getParameter("replyId"));
			System.out.println("댓글번호" + replyId);
			
			
			ReplyVO reply = new ReplyVO();
			reply.setContent(request.getParameter("content"));
			System.out.println(request.getParameter("content"));
			reply.setBoardNo(no);
			reply.setReplyId(replyId);
			System.out.println(reply);
			
			mapper.updateReply(reply);
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











