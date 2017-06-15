package kr.co.ggori.member.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

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
import kr.co.ggori.repository.mapper.IMemberMapper;
import kr.co.ggori.repository.vo.FileVO;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/member/join")
public class MemberJoin extends HttpServlet{
		private SqlSession session;
		private IMemberMapper mapper;
		private IBoardMapper bmapper;
		
		public MemberJoin () {
			session = MyAppSqlConfig.getSqlSessionInstance();
			this.mapper = session.getMapper(IMemberMapper.class);
			this.bmapper = session.getMapper(IBoardMapper.class);
		}

		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("회원가입 서블릿");
			//
			ServletContext context = request.getServletContext();
			String uploadPath = context.getRealPath("/upload/userProfile");
			
			//
			File folder = new File(uploadPath);
			if(!folder.exists()) folder.mkdirs();
			
			//
			MultipartRequest multi = new MultipartRequest(request, uploadPath, 1024 * 1024 * 1000, "utf-8", new DefaultFileRenamePolicy());
			
			
			MemberVO member = new MemberVO();
			member.setMemberId(multi.getParameter("memberId"));
			member.setPass(multi.getParameter("pass"));
			member.setNickName(multi.getParameter("nickName"));
			member.setEmail(multi.getParameter("email"));
			member.setPhoneNum(Integer.parseInt(multi.getParameter("phoneNum")));
			System.out.println(member.toString());
			try {
				
				int result = mapper.insertMember(member);
				System.out.println("result = " + result);
				if (result != 0) {
					File file = multi.getFile("attachFile");
					if(file != null) {
						FileVO fileVO = new FileVO();
						long size = file.length();
						fileVO.setFileSize(size);
						fileVO.setOriginName(multi.getOriginalFileName("attachFile"));
						fileVO.setSystemName(multi.getFilesystemName("attachFile"));
						fileVO.setFilePath("/userProfile");
						fileVO.setMemberId(multi.getParameter("memberId"));
						int resultFile = bmapper.insertUserProfile(fileVO);
						
						if (resultFile != 0) {
							session.commit();
							RequestDispatcher rd = request.getRequestDispatcher("/main/Main");
							rd.forward(request, response);
						}
						else {
							System.out.println("프로필 등록 실패");
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
