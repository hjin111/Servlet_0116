package com.jinju.servlet.database.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jinju.servlet.common.MysqlService;

@WebServlet("/database/favorite/delete")
public class FavoriteDeleteController extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String id = request.getParameter("id");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect(); // DB 접속
		
		mysqlService.update("DELETE FROM `favorite` WHERE `id` = " + id + ";");
		
		// out.println("수행 결과 : " + count);
		// 딱히 보여줄 결과가 없는 페이지이기 때문에 response에 리다이렉트를 세팅해준다
		response.sendRedirect("/database/favorite-list.jsp");
		
	}
}
