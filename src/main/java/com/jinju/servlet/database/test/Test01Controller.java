package com.jinju.servlet.database.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jinju.servlet.common.MysqlService;

@WebServlet("/database/test01")
public class Test01Controller extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter(); // response 채우기 위해 PrintWriter 준비하기
		
		// 객체 생성 방식을 일반적인 형태로 직접 객체를 생성하는게 아니라 싱글톤이라는 디자인 패턴 활용
		// 싱글톤이 머였지? - 객체 생성이 무분별하게 발생 되는 걸 방지하고 딱 하나의 객체만으로 기능이 사용될 수 있도록 하기 위해서 클래스 내부에서 직접 객체를 생성하고 관리하도록 하는 형태
		MysqlService mysqlService = MysqlService.getInstance();
		// 직접 new가 아닌 해당하는 클래스에 들어있는 static 메소드입니다 ( static 메소드는 객체 생성 없이 호출 가능 )
		// getInstance라는 메소드가 해당하는 객체를 직접 생성해서 혹은 이미 생성되어 있으면 그 생성되어 있는 객체를 리턴함으로써 객체를 얻어다가 쓸 수 있음
		mysqlService.connect(); // 접속
		
//		String insertQuery = "INSERT INTO `real_estate`\r\n"
//				+ "(`realtorId`, `address`, `area`, `type`, `price`)\r\n"
//				+ "VALUES\r\n"
//				+ "(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000);";
//		
//		int count = mysqlService.update(insertQuery);
//		
//		out.println("수행 결과 : " + count);
		
		String selectQuery = "SELECT `address`, `area`, `type` FROM `real_estate`\r\n"
				+ "ORDER BY `id` DESC LIMIT 10;";
		
		// 쿼리 수행 
		ResultSet resultSet = mysqlService.select(selectQuery);
		// resultSet도 조회된 결과를 한 행씩 가르킴
		try {
			while(resultSet.next()) { // resultSet이 next()메소드를 호출해서 이 메소드가 다음 것을 가르키면서 다음 것이 있으면 true, 다음 것이 없으면 false 리턴 해줌 
				String address = resultSet.getString("address"); // 지금 가르키는 그 행에 address라는 컬럼의 값을 문자열 형태로 가지고 와라
				int area = resultSet.getInt("area");
				String type = resultSet.getString("type");
				
				// 반복문 안에서 response에다가 해당하는 문자열을 출력
				out.println("매몰 주소 : " + address + ", 면적 : " + area + ", 타입 : " + type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
}
