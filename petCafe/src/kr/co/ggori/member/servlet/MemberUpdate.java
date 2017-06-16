package kr.co.ggori.member.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IBoardMapper;
import kr.co.ggori.repository.mapper.IMemberMapper;
import kr.co.ggori.repository.vo.FileVO;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/member/update")
public class MemberUpdate extends HttpServlet{
	private SqlSession session;
	private IMemberMapper mapper;
	private IBoardMapper bmapper;
	
	public MemberUpdate() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IMemberMapper.class);
		this.bmapper = session.getMapper(IBoardMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("/upload/userProfile");
		//
		File folder = new File(uploadPath);
		if(!folder.exists()) folder.mkdirs();
		//
		MultipartRequest multi = new MultipartRequest(request, uploadPath, 1024 * 1024 * 1000, "utf-8", new DefaultFileRenamePolicy());
		
		try {
			MemberVO member = new MemberVO();
			member.setPass(multi.getParameter("pass"));
			member.setMemberId(multi.getParameter("memberId"));
			member = mapper.selectMemberOne(member);
			if (member != null) {
				member.setNickName(multi.getParameter("nickName"));
				member.setEmail(multi.getParameter("email"));
				member.setPhoneNum(Integer.parseInt(multi.getParameter("phoneNum")));
				
				int result = mapper.updateMember(member);
				RequestDispatcher rd = null;
				boolean check = false;
				if (result != 0) {
					File file = multi.getFile("attachFile");
					if(file != null) {
						FileVO fileVO = bmapper.selectUserProfile(multi.getParameter("memberId"));
						if( fileVO != null ) {
							System.out.println(fileVO.toString());
						}
						else {
							fileVO = new FileVO();
							check = true;
						}
						long size = file.length();
						fileVO.setFileSize(size);
						fileVO.setOriginName(multi.getOriginalFileName("attachFile"));
						fileVO.setSystemName(multi.getFilesystemName("attachFile"));
						fileVO.setMemberId(multi.getParameter("memberId"));
						
						int resultFile = 0;
						
						if(check) {
							fileVO.setFilePath("/userProfile");
							resultFile = bmapper.insertUserProfile(fileVO);
						}
						else {
							resultFile = bmapper.updateUserProfile(fileVO);
							HttpSession s = request.getSession();
							s.setAttribute("profileImg", multi.getFilesystemName("attachFile"));
						}
						
						if (resultFile != 0) {
							session.commit();
							rd = request.getRequestDispatcher("myPage");
						}
						else {
							System.out.println("프로필 등록 실패");
						}
					}
					session.commit();
					request.setAttribute("updateSuccess", "성공");
					rd = request.getRequestDispatcher("myPage");
				} else {
					rd = request.getRequestDispatcher("myPage");
				}
				rd.forward(request, response);
			} else {
				System.out.println("error");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
