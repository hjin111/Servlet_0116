package com.jinju.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test02Controller extends HttpServlet{
	
	// 현재 시간은 14시 52분 43초 입니다.
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// response header 정보 셋팅 
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		
		// response body
		PrintWriter out = response.getWriter();
		
		Date date = new Date();
		
		SimpleDateFormat formatter = new SimpleDateFormat("HH시 mm분 ss초");
		String timeString = formatter.format(date);
		
		out.println("현재 시각은 " + timeString + " 입니다.");
	}

}
