package com.jinju.servlet.database.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jinju.servlet.common.MysqlService;

@WebServlet("/database/user/insert")
public class UserInsertController extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// response.setContentType("text/plain");
		
		// PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		// 요청이 전달된 name, birthday, email 이 세개의 값을 insert 쿼리를 완성시키는데 사용할 것이다.
		// 요청하는 쪽에서 전달된 값에 따라서 실제 insert 쿼리가 수행될 수 있도록 해야 한다.
		// insert 쿼리를 만들어내는데 파라미터로 전달된 값을 기반으로 결과가 만들어지므로써 
		// 이 쿼리는 이제 전달한 값을 기반으로 데이터가 테이블에 insert 될겁니다.
		String query = "INSERT INTO `new_user`\r\n"
				+ "(`name`, `yyyymmdd`, `email`)\r\n"
				+ "VALUE\r\n"
				+ "('" + name + "', " + birthday + ", '" + email + "');";
		
		int count = mysqlService.update(query);
		
		// response에다가 수행된 결과를 담아가지고 요청한 결과가 기능 수행이 잘됐는지 간단히 확인해볼 수 있게 한다
		// out.println("수행결과 : " + count);
		
//		이 페이지에 대한 요청이 들어오면 name, birthday, email이라는 파라미터 이름으로 
//		전달된 값을 변수에 저장하고 그 변수 값을 기반으로 insert 쿼리를 완성 시킨 다음에 
//		그렇게 만들어진 insert 쿼리 문자열이 mysql 서버로 전달되면서 자연스럽게 해당하는 테이블에 한 행이 저장이
//		될겁니다. 그 결과로 실행된 행의 갯수가 리턴이 되고 그게 response에 담겨서 전달이 되니깐 response 내용을 기반으로 잘 insert가 되었는지를 확이해볼수가 있다.
		
		// list 페이지로 이동
		// response에 list 페이지로 이동하는 정보를 담는다.
		// 이 기능을 "리다이렉트"라고 부른다. redirect
		// response에다가 실제 바로 요청한 쪽에 정보를 전달하는게 아니라 그 데이터를 담는게 아니라
		// 다른 페이지로 이동하라고 하는 정보를 담는 거를 리다이렉트라고 부른다.
		response.sendRedirect("/database/user-list.jsp"); // 여기 인자로 이동할 페이지의 주소 넣기
		
//		이 페이지에 요청을 하면 기능이 수행이 되고 , insert 과정이 수행이 되고  response에 먼가 담겨져서 응답이 오는게 아니라 담을 데이터가 없으니깐 그냥 list 페이지로 이동해주세요 라는 응답을 돌려줌으로써 브라우저가 
//		그 응답에 대응해서 실제 해당하는 그 페이지로 새롭게 요청을 통해 이동하는 형태로 마무리가 됨 
	}
}
