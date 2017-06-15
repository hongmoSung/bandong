package kr.co.ggori.board.sale.servlet;

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
import kr.co.ggori.repository.mapper.IMainMapper;
import kr.co.ggori.repository.mapper.IReplyMapper;
import kr.co.ggori.repository.vo.BoardVO;
import kr.co.ggori.repository.vo.ReplyVO;

@WebServlet("/board/saleDetail")
public class SaleDetail extends HttpServlet{

	private SqlSession session;
	private IBoardMapper bMapper;
	private IReplyMapper rMapper;
	private IMainMapper iMapper;
	
	public SaleDetail() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		bMapper = session.getMapper(IBoardMapper.class);
		rMapper = session.getMapper(IReplyMapper.class);
		iMapper = session.getMapper(IMainMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("boardNo"));
		List<BoardVO> boardList = null;

		try {
		boardList = bMapper.selectAll("sale"); 
		request.setAttribute("boardList", boardList);
		
		BoardVO board = bMapper.selectOneBoard(no);
		request.setAttribute("board", board);
		
		String memberId = request.getParameter("memberId");
		request.setAttribute("member", memberId);
		
		String replyId = request.getParameter("replyId");
		if (replyId != null) {
			request.setAttribute("replyId", replyId);			
		}
		
		List<ReplyVO> replyList = rMapper.replyList(no);
		setNickName(replyList);
		request.setAttribute("replyList", replyList);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/board/detail.jsp");
		rd.forward(request, response);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	public void setNickName(List<ReplyVO> member) throws Exception {
		for(int i = 0; i < member.size(); i++) {
			member.get(i).setNickName( 
					iMapper.myNickName( member.get(i).getMemberId() ) 
					);
		}
	}
}
