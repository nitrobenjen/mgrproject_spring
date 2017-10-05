package com.mgr.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mgr.dto.LoginVO;


public class LoginCheckFilter implements Filter {
	
	// 필터 클래스 초기 실행시 호출되는 메소드
		@Override
		public void init(FilterConfig config) throws ServletException {
		}

		// doFilter() 메소드는 request, response 요청시마다 매번 호출되는 메소드
		@Override
		public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
				throws IOException, ServletException {

			// 세션 객체 확보
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			
		
			
			HttpSession session = httpRequest.getSession(false);

			// 로그인 여부 확인을 위한 임시 변수
			boolean login = false;

			// 로그인 페이지 유효화
			String command = httpRequest.getRequestURI();
			command = command.substring(httpRequest.getContextPath().length());
		
			
			
			command = command.substring(1);
		
			// 세션 객체의 정보 확인
			if (command.startsWith("login")) {
				// 로그인 사용자 인증을 위한 값 저장
				login = true;

			}

			// LoginInfo세션 객체 존재 여부 확인
			if (session != null) {
				if (session.getAttribute("logininfo") != null) {
					// 관리자 확인
					if (command.startsWith("admin") && ((LoginVO) session.getAttribute("logininfo")).getGrade() == 0) {
						// 로그인 사용자 인증을 위한 값 저장
						login = true;
						// 강사 확인
					} else if (command.startsWith("teach")
							&& ((LoginVO) session.getAttribute("logininfo")).getGrade() == 1) {
						login = true;
						// 학생확인
					} else if (command.startsWith("student")
							&& ((LoginVO) session.getAttribute("logininfo")).getGrade() == 2) {
						login = true;
					}
				}
			}
			// 로그인 사용자 인증 값 검사
			if (login) {
				// 로그인 사용자인 경우 다음 단계 실행
				chain.doFilter(request, response);
			} else {
				// 로그인하지 않은 사용자인 경우 강제 페이지 전환
				RequestDispatcher dispatcher = request.getRequestDispatcher("/login/loginfail");
				dispatcher.forward(request, response);
			}
		}

		@Override
		public void destroy() {
		}

}
