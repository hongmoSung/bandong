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

@WebServlet("/board/boardUpdateForm")
public class BoardUpdateForm extends HttpServlet{
	private SqlSession session;
	private IBoardMapper mapper;
	public BoardUpdateForm() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IBoardMapper.class);
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("boardNo"));
		BoardVO board = null;
		try {
			board = mapper.selectOneBoard(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("board", board);
		RequestDispatcher rd = request.getRequestDispatcher("/view/board/updateForm.jsp");
		rd.forward(request, response);
	}
}
