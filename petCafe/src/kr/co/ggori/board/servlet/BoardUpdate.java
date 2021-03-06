package kr.co.ggori.board.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IBoardMapper;
import kr.co.ggori.repository.vo.BoardVO;
import kr.co.ggori.repository.vo.FileVO;

@WebServlet("/board/boardUpdate")
public class BoardUpdate extends HttpServlet{
	private SqlSession session;
	private IBoardMapper mapper;
	
	public BoardUpdate() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		mapper = session.getMapper(IBoardMapper.class);
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		realPath += datePath;
		
		File f = new File(realPath);
		
		if (!f.exists()) {
			f.mkdirs();
		}
		
		MultipartRequest multi = new MultipartRequest(request, realPath, 1024*1024*30, "utf-8", new DefaultFileRenamePolicy());
		BoardVO board = new BoardVO();
		System.out.println(multi.getParameter("boardNo"));
		board.setBoardNo(Integer.parseInt(multi.getParameter("boardNo")));
		board.setTitle(multi.getParameter("title"));
		board.setContent(multi.getParameter("content"));
		
		try {
			File files = multi.getFile("attachFile");
			
			if(files != null){
				
				String originFile = multi.getOriginalFileName("attachFile");
				String sysFile = multi.getFilesystemName("attachFile");
				long size = files.length();
				
				FileVO file = new FileVO();
				file.setBoardNo(board.getBoardNo());
				file.setFilePath(datePath);
				file.setFileSize(size);
				file.setOriginName(originFile);
				file.setSystemName(sysFile);
				
				
				mapper.updateFile(file);
			}
			
			mapper.updateBoard(board);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String bType = multi.getParameter("boardType");
		
		
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
