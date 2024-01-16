package com.jinju.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex03")
public class Ex03Controller extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
		response.setContentType("application/json"); // json이라는 형태의 MIME 규격의 타입 이름은 application/json
		
		PrintWriter out = response.getWriter();
		
		// 이름과 생년월일을 전달 받고, 
		// 이름과 나이를 html 정돈해서 response에 담는다.
		
		// 요청하는 쪽에서 전달하는 데이터를 기반으로 결과물이 달라지는 페이지를 만들 것이다.
		// 파라미터를 전달 받아야 한다 -> 파라미터는 request객체(요청에 대한 정보가 들어 있는 request 객체) 안에 들어 있다
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday"); // request 안에 들어 있는 요청하는 쪽에서 전달하는 그 정보 안에 birthday라는 이름의 파라미터가 있는지를 확인해서 그걸 얻어와서 return하는 것
															// 파라미터는 항상 문자열로 리턴해줍니다
															// 20011012
		String yearString = birthday.substring(0,4);
		int year = Integer.parseInt(yearString);
		
		// 한국나이
		int age = 2024 - year + 1;
		
//		out.println("<html><head><title>이름 나이</title></head><body>");
//		out.println("<h2>이름 : " + name + "</h2>");
//		out.println("<h2>나이 : " + age + "</h2>");
//		out.println("</body></html>");
		
		// 이 페이지는 그냥 요청할 수 있는 페이지가 아니라 파라미터 name과 birthday라는 파라미터를 
		// 필수로 추가해서 요청을 해야 되는 웹 페이지가 된 것이다 
		
		// json 형태로 담아보기 
		// json - 문자열로 데이터를 표현하는 규격
		// 웹 에서는 클라이언트와 서버가 데이터를 주고 받는 형식이 문자열이다 ( 네트워크를 통해서 데이터를 전달 할 때는 객체나 이런걸로 전달 못하고 무조건 문자열로 전달 가능 )
		// 문자열을 통해서 여러 개의 데이터를 리스트와 같은 데이터를 전달 할 방법이 없을까 라고 해서 그 규격을 만들어냄 
		// [10, 20, 30]
		// {"name":"김인규", "age":"24"} 
		
		out.println("{\"name\":\"" + name + "\", \"age\":" + age + "}");
		
		
	}
}
