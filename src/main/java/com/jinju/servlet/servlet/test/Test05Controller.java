package com.jinju.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test05")
public class Test05Controller extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 구구단을 리스트 태그로 response에 담기
		
		// int number = Integer.parseInt(request.getParameter("number"));
		String number = request.getParameter("number"); // 요청 정보에서 number라는 이름을 얻어옴
		int dan = Integer.parseInt(number);
		
		out.println("<html><head><title>구구단</title></head><body><ul>");
		for(int i = 1; i <= 9; i++) {
			out.println("<li>" + dan + "X" + i + "=" + ( dan * i ) + "</li>");
		}
		out.println("</ul></body></html>");
		
		
	}
}
