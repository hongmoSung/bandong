package kr.co.ggori.reservation.servlet;

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
import kr.co.ggori.repository.mapper.ICareTypeMapper;
import kr.co.ggori.repository.mapper.IReservationMapper;
import kr.co.ggori.repository.vo.CareTypeVO;

@WebServlet("/reservation/detailInfoForm")
public class DetailInfoFormServlet extends HttpServlet {

	private IReservationMapper reserMap = null;
	private ICareTypeMapper careMap = null;
	private SqlSession session = null;
	
	public DetailInfoFormServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reserMap = session.getMapper(IReservationMapper.class);
		careMap = session.getMapper(ICareTypeMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println( request.getParameter("userSelectDate") );
		List<CareTypeVO> careTypeList = null;
		
		try {
//			careTypeList = careMap.SearchCare( Integer.parseInt(request.getParameter("hospitalId")) );
			careTypeList = careMap.SearchCare( 1 );
			
			if(careTypeList == null) {
				System.out.println("비어있음");
			}
			else {
				for(int i = 0; i < careTypeList.size(); i++) {
					System.out.println( careTypeList.get(i).getCareTypeId() );
				}
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("userSelectDate", request.getParameter("userSelectDate"));
		request.setAttribute("careTypeList", careTypeList);
//		request.setAttribute("hospitalId", request.getParameter("hospitalId"));
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/detailInfoForm.jsp");
		rd.forward(request, response);
		
	}
	
}