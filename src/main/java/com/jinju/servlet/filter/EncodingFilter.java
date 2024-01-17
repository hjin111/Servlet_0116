package com.jinju.servlet.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// 해당 필터를 거쳐갈 요청 주소 형식 / 정해진 규격의 주소만 이 필터 거쳐가기 
@WebFilter("/*") // /servlet/* - servlet으로 시작할 페이지만 거쳐갈 때 저런 표현 씀
public class EncodingFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain ) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 여러개 겹쳐서 만들어진 필터들의 연결성
		chain.doFilter(request, response);
		
	}

}
