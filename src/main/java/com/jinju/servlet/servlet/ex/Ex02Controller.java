package com.jinju.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex02")
public class Ex02Controller extends HttpServlet{
	
	@Override // doGet 메서드가 부모 클래스에 있는 메서드를 재정의 한다라고 하는 것을 명확히 해주는 annotation
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// response header라는 곳에 셋팅
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html"); // 우리가 담은 response body의 내용을 태그로 인식해서 보여주게 하기 위해서는 text/html 타입으로 지정
		
		// response body에 값 채워주기
		PrintWriter out = response.getWriter();
		
		// 원하는 데이터를 만들어서 response 객체에 담기
		// 1 ~ 10 까지의 합을 구하고 그 결과를 html 형태로 response에 담는다.
		
		int sum = 0;
		for(int i = 1; i <= 10; i++) {
			sum += i;
		}
		
		out.println("<html><head><title>합계</title></head> <body>");
		out.println("<h2>합계 : " + sum + "</h2></body></html>");
		
	}
}
