package kr.co.ggori.board.image.servlet;

import java.io.IOException;
import java.util.ArrayList;
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
import kr.co.ggori.repository.mapper.IMemberMapper;
import kr.co.ggori.repository.vo.BoardVO;
import kr.co.ggori.repository.vo.FileVO;

@WebServlet("/board/imageList")
public class ImageList extends HttpServlet{
	private SqlSession session;
	private IBoardMapper bMapper;
	private IMemberMapper mMapper;
	private IMainMapper mainMapper;
	
	public ImageList() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		bMapper = session.getMapper(IBoardMapper.class);
		mMapper = session.getMapper(IMemberMapper.class);
		mainMapper = session.getMapper(IMainMapper.class);
		
		
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<BoardVO> boardList = null;
		List<FileVO> fileList = null;
		String uploadPath = null;
		
		try {
			boardList = bMapper.selectAll("image");
			fileList = getFileList(boardList);
			
			setNickName(boardList);
			
			uploadPath = request.getContextPath() + "/upload";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("boardList", boardList);
		request.setAttribute("fileList", fileList);
		request.setAttribute("uploadPath", uploadPath);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/board/imageList.jsp");
		rd.forward(request, response);
		
	}
	
	public void setNickName(List<BoardVO> member) throws Exception {
		for(int i = 0; i < member.size(); i++) {
			member.get(i).setNickName( 
					mainMapper.myNickName( member.get(i).getMemberId() ) 
					);
		}
	}
	
	public List<FileVO> getFileList(List<BoardVO> list) throws Exception {
		List<FileVO> fileList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			fileList.add( bMapper.selectFile(list.get(i).getBoardNo()) );
		}
		return fileList;
	}
}