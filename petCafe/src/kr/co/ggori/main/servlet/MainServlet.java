package kr.co.ggori.main.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IMainMapper;
import kr.co.ggori.repository.vo.BoardVO;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/main/Main")
public class MainServlet  extends HttpServlet{

	private IMainMapper mainMap = null;
	private SqlSession session = null;
	
	public MainServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mainMap = session.getMapper(IMainMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hSession = request.getSession();

		List<BoardVO> boardListNotice = null;
		List<BoardVO> boardListSale = null;
		List<BoardVO> boardListTip = null;
		List<BoardVO> boardListImage = null;
		
		String master = null;
		int allBoardCount = -1;
		int memberCount = -1;
		
//		String memberId = ((MemberVO)hSession.getAttribute("member")).getMemberId();
		
		int myBoardCount = -1;
		int myReplyCount = -1;
		try {
			boardListNotice = mainMap.recentBoard("test");
			boardListSale = mainMap.recentBoard("taejun");
			boardListTip = mainMap.recentBoard("tip");
			boardListImage = mainMap.recentBoard("image");
			
			master = mainMap.cafeMaster();
			allBoardCount = mainMap.cafeBoardCount();
			memberCount = mainMap.cafeMemberCount();
			
//			myBoardCount = mainMap.myMiniBoardCount( memberId );
//			myReplyCount = mainMap.myMiniReplyCount( memberId );
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("boardListNotice", boardListNotice);
		request.setAttribute("boardListSale", boardListSale);
		request.setAttribute("boardListTip", boardListTip);
		request.setAttribute("boardListImage", boardListImage);
		
		hSession.setAttribute("master", master);
		hSession.setAttribute("allBoardCount", allBoardCount);
		hSession.setAttribute("memberCount", memberCount);
		
		hSession.setAttribute("myBoardCount", myBoardCount);
		hSession.setAttribute("myReplyCount", myReplyCount);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/main/main.jsp");
		rd.forward(request, response);
	}
}
