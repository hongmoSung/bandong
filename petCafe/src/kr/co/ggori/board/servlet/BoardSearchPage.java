package kr.co.ggori.board.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ggori.repository.vo.BoardVO;

@WebServlet("/board/searchPage")
public class BoardSearchPage extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		List<BoardVO> noticeList = null;
		List<BoardVO> saleList = null;
		List<BoardVO> tipList = null;
		List<BoardVO> imageList = null;
		
		request.getParameter("noticeList");
		request.getParameter("saleList");
		request.getParameter("tipList");
		request.getParameter("imageList");
		*/
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/board/searchPage.jsp");
		rd.forward(request, response);
		
	}
	
}