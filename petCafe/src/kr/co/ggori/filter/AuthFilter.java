package kr.co.ggori.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class AuthFilter implements Filter {

	private List<String> pageList;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		String pages = config.getInitParameter("pages");
//		System.out.println("pages");
//		System.out.println(pages);
		
		// 로그인이 필요없는 페이지 정보 관리 리스트
		String[] arr = pages.split(";");
		pageList = new ArrayList<>();
		for (String page : arr) {
			pageList.add(page.trim());
		}
		System.out.println(pageList);
		
	}

	@Override
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hRequest = (HttpServletRequest)request;
		// 사용자 호출 URI 가져오기
		// /00_board/login/LoginForm
		String uri = hRequest.getRequestURI();
		
		// 현재 호출된 웹 프로젝트의 path 경로 가져오기
		// /00_board
		String contextPath = hRequest.getContextPath();
		
		// 호출된 uri 에서 프로젝트 path 경로 제거
		// /login/LoginForm
		uri = uri.substring(contextPath.length());
		
		// pageList에 uri 가 존재한다면 요소의 index를 반환
		// 포함되어 있지 않다면 -1이 반환
		int index = pageList.indexOf(uri);
		
		// 로그인이 필요한 페이지
		boolean isRedirect = false;
		if (index == -1) {
			/*
			 *  세션을 얻은 다음 user란 이름의 속성이 존재하는지 체크한다.
			 *  존재하면(null 이 아닌경우) 사용자 호출 페이지로 이동
			 *  존재하지 않는다면(null인 경우) 로그인폼 페이지로 이동시킨다.
			 */
			HttpSession session = hRequest.getSession();
			Object user = session.getAttribute("member");
			if (user == null) {
				isRedirect = true;
			}
		}
		
		// 로그인 폼으로 이동
		if (isRedirect) {
			HttpServletResponse hResponse = 
					(HttpServletResponse)response;
			hResponse.sendRedirect(
					contextPath + "/login/loginForm");
		}
		// 호출한 페이지로 이동
		else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
