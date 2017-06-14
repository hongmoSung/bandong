package kr.co.ggori.board.image.servlet;

import java.io.IOException;
import java.util.List;

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
import kr.co.ggori.repository.mapper.IReplyMapper;
import kr.co.ggori.repository.vo.BoardVO;
import kr.co.ggori.repository.vo.FileVO;
import kr.co.ggori.repository.vo.ReplyVO;

@WebServlet("/board/imageDetail")
public class ImageDetail extends HttpServlet{
	private SqlSession session;
	private IBoardMapper bMapper;
	private IReplyMapper rMapper;
	private IMemberMapper mMapper;
	public ImageDetail() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		bMapper = session.getMapper(IBoardMapper.class);
		rMapper = session.getMapper(IReplyMapper.class);
		mMapper = session.getMapper(IMemberMapper.class);
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardVO board;
		try {
			board = bMapper.selectOneBoard(no);
			request.setAttribute("board", board);
			
			String memberId = request.getParameter("memberId");
			request.setAttribute("member", memberId);
			
			FileVO file = bMapper.selectFile(no);
			request.setAttribute("file", file);
			
			String replyId = request.getParameter("replyId");
			if (replyId != null) {
				request.setAttribute("replyId", replyId);			
			}
			
			List<ReplyVO> replyList = rMapper.replyList(no);
			request.setAttribute("replyList", replyList);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/view/board/detail.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
