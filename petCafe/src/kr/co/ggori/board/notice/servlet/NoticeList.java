package kr.co.ggori.board.notice.servlet;

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
import kr.co.ggori.repository.vo.BoardVO;

@WebServlet("/servlet/NoticeList")
public class NoticeList extends HttpServlet{
	private SqlSession session;
	private IBoardMapper mapper;
	public NoticeList() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IBoardMapper.class);
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<BoardVO> list = null;
		try {
			list = mapper.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		RequestDispatcher rd = request.getRequestDispatcher("/view/board/list.jsp");
		rd.forward(request, response);
	
	}
}
