package com.jinju.servlet.database.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jinju.servlet.common.MysqlService;

@WebServlet("/database/ex01")
public class Ex01Controller extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		
		// 이 mysqlService라는 객체를 생성하는 형태를 좀 다르게 만들어 볼 것이다
		// 왜그러냐면 클래스를 만들면서 이 클래스를 기반으로 생성하는 객체가 너무 무분별하게 만들어지는걸 방지해야 되는 경우가 있을 수 있다
		// 클래스를 만드는 사람이 이거를 객체로 만들어서 쓰는 과정에서 그냥 필요할 떄 만큼 객체 만들어서 써라는 구조로 클래스를 만들 수도 있지만
		// 이 클래스는 너무 많은 객체들이 만들어지면 좋지 않은 문제가 발생 될 수 있을거 같다라는 판단이 들어서 객체 생성 하는걸 제약하도록 클래스를 설계할 수 있다
		// 어딘가에 접속을 해서 처리가 되는 기능은 네트워크와 관련된 기능은 굉장히 복잡하다
		// 지금 이놈도 서버에 접속하는거기 때문에 그 과정이 굉장히 복잡함 리소스를 많이 사용하게 된다 그런 기능을 하는 객체가 너무 무분별하게 많이 만들어지면 부하를 만들어낼 수 있다
		// 그래서 클래스를 설계하는 사람이 이건 객체가 많이 만들어지면 부하가 많이 발생될거 같아 아무래도 객체 생성이 좀 제한되었으면 좋겠다라고 판단이 되서
		// 객체를 가져다가 사용하는 쪽에서 직접 객체를 생성하지 못하도록 하고 클래스 내부에서 객체를 생성 관리하도록 만들어낼 수 있다.
		// 그런 방법중에 대표적인 방법이 싱글톤이라는 패턴이 있다
//		MysqlService mysqlService = new MysqlService();
		MysqlService mysqlService = MysqlService.getInstance(); 
		mysqlService.connect();
		
		// 객체 생성 없이 쓸 수 있는 static 메소드 우리가 써 본적 있음 - Math.round(3.5);
		ResultSet resultSet = mysqlService.select("SELECT * FROM `used_goods`;");
		
		out.println("<html><head><title>중고 매물 목록</title></head><body>");
		// <div>제목 : 플스 팝니다. 가격 : 30000원 </div>

		// 이 반복문을 통해서 resultSet으로 조회된 모든 행들을 처리할 수 있음
		try {
			while( resultSet.next()) { // 이 코드가 다음 것을 가르키도록 한다 그리고나서 다음 것이 있는지 없는지를 true/false로 알려준다
				// 처음에는 가상의 공간을 가르키다가 다음 것을 가르키면 일단 첫 번째 행을 가르키게 되겠죠 그 상태에서 resultSet으로부터 
				// title 컬럼의 값을 갖고 오고 싶으면 메소드를 호출하는데 get하고 가져올값의 타입으로 메소드이름 호출하기 그 다음 인자로 해당 하는 컬럼 이름 넣기
				String title = resultSet.getString("title"); // resultSet안에 타입별로 메소드가 다 만들어져 있습니다. / 지금 가르키고 있는 행의 특정 컬럼의 값을 리턴해준다.
				int price = resultSet.getInt("price");

				out.println("<div>제목 : " + title + "가격 : " + price + "원</div>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String insertQuery ="INSERT INTO `used_goods`\r\n"
				+ "(`sellerId`, `title`, `price`, `description`)\r\n"
				+ "VALUE\r\n"
				+ "(3, '고양이 간식 팝니다', 2000, '저희 고양이가 안먹어서 팔아요');";
		
		int count = mysqlService.update(insertQuery);
		out.print("<div>실행결과 : " + count + "</div>");
		
		out.println("</body></html>");
		
		// 데이터베이스 접속
//		try {
//			// 드라이버 셋팅
//			DriverManager.registerDriver(new com.mysql.jdbc.Driver());// mysql의 jdbc라는 드라이버를 등록하겠다
//
//			// 접속에 필요한 정보들 : 주소, 아이디, 패스워드
//			// 데이터베이스를 접속하기 위한 주소가 필요함 
//			String url = "jdbc:mysql://localhost:3306/dulumary_0102";
//			// 접속할려면 아이디 패스워드가 필요함
//			String userId = "root";
//			String password = "root";
//
//			// 접속을 위한 메소드 호출
//			// 접속을 하고 나면 Connection을 리턴해줌
//			// Connection 이라고 하는 접속 관련 정보를 관리하는 객체가 리턴이 된다, 이게 있어야 쿼리를 수행 시킬 수 있기 떄문에 리턴 받은 값을 저장 해놓기 
//			Connection connection = DriverManager.getConnection(url, userId, password); 
//			// 커넥션으로부터 쿼리를 수행시킬수 있도록 하는 객체를 하나 얻어낸다 / 접속 정보를 통해서 쿼리를 수행시킬 수 있는 객체를 얻어옴
//			// 이 메소드가 Statement라는 객체를 리턴해준다
//			// 이 객체를 통해서 쿼리를 수행시킬 수 있다 ( java.sql.Statement 임포트 )
//			Statement statement = connection.createStatement();
//
//			String selectQuery = "SELECT * FROM `used_goods`;";
//
//			ResultSet resultSet = statement.executeQuery(selectQuery);// 서버에 selectQuery가 전달되면서 쿼리가 수행이 됩니다.
//			// selectQuery가 수행되면 조회결과가 나와야 한다 
//			// selectQuery를 수행시키는 executeQuery라는 이 메소드는 조회결과를 리턴시켜준다 
//			// 어떤 형태냐면 ResultSet이라는 형태이다
//			// resultSet이라는 객체 안에 조회된 결과가 저장이 되어 있다.
//
//			// resultSet에 있는 데이터를 html 구성하는데에서 활용할 것이다.	
//			// resultSet이 어떻게 동작하냐면 Iterator랑 비슷하다. 
//			// ( Iterator가 머냐?? 리스트에 들어 있는 객체를 가르키는 놈이다 그래서 가르키고 있다가 그 다음 것이 있냐 확인해서 그 다음 가르키고 이런 형태이다.)
//			// resultSet은 머다?? 한 행을 가르키는 것이다. 
//			// 최초의 첫번째 보다 하나 더 앞의 가상의 공간을 가르키고 있다가 다음꺼 가르켜 라고 하면 하나의 행을 딱 가르키게 된다. 그러면 현재 가르키고 있는 그 행에서 컬럼 이름으로 그에 대응되는 값을 얻어올 수 있다
//			out.println("<html><head><title>중고 매물 목록</title></head><body>");
//			// <div>제목 : 플스 팝니다. 가격 : 30000원 </div>
//
//			// 이 반복문을 통해서 resultSet으로 조회된 모든 행들을 처리할 수 있음
//			while( resultSet.next()) { // 이 코드가 다음 것을 가르키도록 한다 그리고나서 다음 것이 있는지 없는지를 true/false로 알려준다
//				// 처음에는 가상의 공간을 가르키다가 다음 것을 가르키면 일단 첫 번째 행을 가르키게 되겠죠 그 상태에서 resultSet으로부터 
//				// title 컬럼의 값을 갖고 오고 싶으면 메소드를 호출하는데 get하고 가져올값의 타입으로 메소드이름 호출하기 그 다음 인자로 해당 하는 컬럼 이름 넣기
//				String title = resultSet.getString("title"); // resultSet안에 타입별로 메소드가 다 만들어져 있습니다. / 지금 가르키고 있는 행의 특정 컬럼의 값을 리턴해준다.
//				int price = resultSet.getInt("price");
//
//				out.println("<div>제목 : " + title + "가격 : " + price + "원</div>");
//			}
//			
//			out.println("</body></html>");
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} 

		// resultSet은 어떻게 테이블을 관리한다??
		// 조회된 결과의 첫 번째 행보다 더 앞쪽을 가르키고 있는 상태고 next 메소드를 호출하면 다음행을 가르키게 된다.
		// 그래서 최최의 next() 메소드를 호출하면 첫 번째 행을 가르키게 되고 그 상태에서 resultSet 객체로부터 get하고 얻어 올 컬럼의 타입에 맞는 메소드로 호출해준 다음에 인자로 컬럼 이름을 넣어주면 값이 나옴
		// resultSet.next()가 다음꺼를 가르키는데 다음 것이 있어서 가르키게 되면 true를 리턴하고 다음 것을 가르키려다가 다음 것이 없으면 false를 리턴한다
		// 그래서 resultSet.next() 가 true일 동안 반복문을 반복시키면 된다.
	}

}
