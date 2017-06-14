package kr.co.ggori.board.image.servlet;

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
import kr.co.ggori.repository.mapper.IBoardMapper;
import kr.co.ggori.repository.mapper.IMainMapper;
import kr.co.ggori.repository.vo.BoardVO;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/board/imageList")
public class ImageList extends HttpServlet{
	
	public ImageList() {
		
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}