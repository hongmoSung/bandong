package kr.co.ggori.board.servlet;

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
import kr.co.ggori.repository.vo.BoardVO;

@WebServlet("/board/boardUpdate")
public class BoardUpdate extends HttpServlet{
	private SqlSession session;
	private IBoardMapper mapper;
	
	public BoardUpdate() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IBoardMapper.class);
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVO board = new BoardVO();
		board.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		
		try {
			mapper.updateBoard(board);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String bType = request.getParameter("boardType");
		System.out.println(bType);
		
		
		RequestDispatcher rd = null;
		switch (bType){
		case "notice" : rd = request.getRequestDispatcher("/board/noticeList");
						rd.forward(request, response);
						break;
		case "sale" :   rd = request.getRequestDispatcher("/board/saleList");
						rd.forward(request, response);
						break;
		case "tip" :  rd = request.getRequestDispatcher("/board/tipList");
					  rd.forward(request, response);
					  break;
		case "image" :  rd = request.getRequestDispatcher("/board/imageList");
						rd.forward(request, response);
						break;
		}
	}

}
