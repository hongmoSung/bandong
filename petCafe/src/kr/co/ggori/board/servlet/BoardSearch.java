package kr.co.ggori.board.servlet;

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

@WebServlet("/board/search")
public class BoardSearch extends HttpServlet {
	
	private SqlSession session = null;
	private IBoardMapper boardMap = null;
	
	public BoardSearch() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		boardMap = session.getMapper(IBoardMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardVO board = new BoardVO();
		String searchTxt = request.getParameter("searchTxt");
		
		board.setContent( searchTxt );
		
		List<BoardVO> noticeList = null;
		List<BoardVO> saleList = null;
		List<BoardVO> tipList = null;
		List<BoardVO> imageList = null;
		
		try {
			board.setBoardType( "notice" );
			noticeList = boardMap.searchByContent(board);
			setNickName(noticeList);
			
			board.setBoardType( "sale" );
			saleList = boardMap.searchByContent(board);
			setNickName(saleList);

			board.setBoardType( "tip" );
			tipList = boardMap.searchByContent(board);
			setNickName(tipList);
			
			board.setBoardType( "image" );
			imageList = boardMap.searchByContent(board);
			setNickName(imageList);
			
			request.setAttribute( "noticeList", noticeList );
			request.setAttribute( "saleList", saleList );
			request.setAttribute( "tipList", tipList );
			request.setAttribute( "imageList", imageList );
			
			request.setAttribute("searchTxt", searchTxt);
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("searchPage");
		rd.forward(request, response);
		
	}
	
	public void setNickName (List<BoardVO> boardList) {
		for(int i = 0, len = boardList.size(); i < len; i++) {
			try {
				boardList.get(i).setNickName( boardMap.myNickName(boardList.get(i).getMemberId()) );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}