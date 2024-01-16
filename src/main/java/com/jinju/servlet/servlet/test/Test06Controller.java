package com.jinju.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test06")
public class Test06Controller extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json"); // json 형태의 문자열
		
		PrintWriter out = response.getWriter();
		
		// 두 수를 전달 받는다. ( request로부터 전달 받는다 )
		String number1String = request.getParameter("number1"); // number1이라는 값을 꺼내 쓸 거니깐 이 이름으로 파라미터 전달해 
		String number2String = request.getParameter("number2");
		
		int number1 = Integer.parseInt(number1String);
		int number2 = Integer.parseInt(number2String);
		
		int plus = number1 + number2;
		int minus = number1 - number2;
		int multi = number1 * number2;
		int div = number1 / number2;
		
		// json 형태로 response에 담기 
		// {"addtion":10, "substraction":5, "multiplication":25, "division":2}
		// 아래와 같은 문자열을 response에 담는다 
		out.println("{\"addtion\" : " + plus + ", \"substraction\" : " + minus 
				+ ", \"multiplication\" : " + multi + ", \"division\" : " + div + "}");
		
		
	}

}
