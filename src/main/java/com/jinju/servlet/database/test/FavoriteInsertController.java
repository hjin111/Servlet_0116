package com.jinju.servlet.database.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jinju.servlet.common.MysqlService;

@WebServlet("/database/favorite/insert")
public class FavoriteInsertController extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 바로 리다이렉트 적용하지 말고 기능 수행 적절히 잘 수행되는지를 확인한 이후에 리다이렉트를 적용해서 결과를 만들어간다
		// response에 뭔갈 담기 위해 셋팅해 놓은 코드는 필요 없어짐
		// response.setContentType("text/plain");
		// PrintWriter out = response.getWriter();
		
		String site = request.getParameter("site");
		String url = request.getParameter("url");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect(); // DB 접속
		
		mysqlService.update("INSERT INTO `favorite` (`name`,`url`)\r\n"
				+ "VALUES\r\n"
				+ "('" + site + "', '" + url + "');"); // 정한 값이 아니라 전달 받은 값으로 세팅이 되야 함
		
		//out.println("수행 결과 : " + count);
		// list 페이지로 이동 ( 다른 페이지에 이동시키는 내용을 response에 담기 / list 페이지로 이동하라는 정보를 response로 전달해주면 브라우저는 보내준 주소로 다시 요청할게 라고 브라우저가 판단해서 다시 list 페이지로 요청을 하고 list 페이지에 대한 응답을 전달 받는 것이다)
		response.sendRedirect("/database/favorite-list.jsp");
	}

}
