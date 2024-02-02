package com.jinju.servlet.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// Mysql jdbc의 사용 과정에 복잡한 코드를 간결하게 사용하도록 
// 메소드로 정리하는 역할
public class MysqlService {
	
	// 객체를 관리하는 변수를 여기서 직접 멤버변수로 만든다
	private static MysqlService mysqlService = null; // 기본 값은 일단 null을 셋팅

	// 멤버변수 - 데이터 베이스 접속하기 위한 기능 만들 떄 두 가지 객체가 있다 그놈들을 멤버변수로 먼저 설정한다
	private Connection connection;
	private Statement statement;
	
	// 디자인 패턴 ( 코드를 만드는 것도 디자인이라고 부른다 / 코드의 구조를 만드는 것도 디자인이라고 부르는데 코드의 구조를 만들어가는 패턴들을 개발자들끼리 정의를 해서 사용하기도 함 )
	// singleton 패턴 ( 디자인 패턴 중에 대표적인 것 )
	// 클래스를 설계하는 사람이 객체를 딱 하나만 직접 만들어서 사용할 수 있도록 관리하도록 하는 방법이다 
	// 객체를 생성하고 관리하는 걸 여기서 직접 한다
	// 객체 관리 메소드 ( 일반적으로 getInstance라는 이름의 메소드로 많이 만듬 )
	public static MysqlService getInstance() { // 이 메소드는 관리하는 그 객체를 리턴한다.
		// return 타입 앞에 static이라는 키워드를 붙여주면 해당하는 메소드는 객체 생성 없이 호출해서 사용할 수가 있다.
		
		// 여기 안에는 객체 생성 없이 사용할 수 있는 값들만 들어 갈수 있다 그래서 이 안에서 만든 지역 변수는 사용이 가능하지만 멤버변수들은 객체가 생성이 되어야만 쓸 수 있다
		// 멤버 변수 자체가 객체가 생성이 되면서 멤버변수가 만들어지는거에요 
		if(mysqlService == null) {
			// 딱 하나만 만든다 했으니 mysqlService가 null이면 처음 사용하는 최초의 한번만 객체를 생성합니다.
			// 그리고 그 다음에 필요할 떄는 null이 아님으로 그래서 만들어 놓은 그 객체를 그대로 또 쓴다.
			// 그래서 멤버변수에다가도 static을 붙여준다
			mysqlService = new MysqlService();
		}
		
		return mysqlService; // 이 클래스 안에서 관리하고 있는 이 클래스 자체의 객체를 리턴해준다
	}
	
	// 접속기능
	// 데이터베이스에 접속하기 위한 과정을 코드로 작성 할거다
	// 메소드 이름 : connect 파라미터 : x 리턴 타입 : void
	public void connect() {
		
		// 드라이버 셋팅
		try {
			
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());// mysql의 jdbc라는 드라이버를 등록하겠다
			
			// 접속에 필요한 정보들 : 주소, 아이디, 패스워드
			// 데이터베이스를 접속하기 위한 주소가 필요함 
			String url = "jdbc:mysql://localhost:3306/dulumary_0102";
			// 접속할려면 아이디 패스워드가 필요함
			String userId = "root";
			String password = "root";

			// 접속을 위한 메소드 호출
			// 접속을 하고 나면 Connection을 리턴해줌
			// Connection 이라고 하는 접속 관련 정보를 관리하는 객체가 리턴이 된다, 이게 있어야 쿼리를 수행 시킬 수 있기 떄문에 리턴 받은 값을 저장 해놓기 
			connection = DriverManager.getConnection(url, userId, password); 
			// 커넥션으로부터 쿼리를 수행시킬수 있도록 하는 객체를 하나 얻어낸다 / 접속 정보를 통해서 쿼리를 수행시킬 수 있는 객체를 얻어옴
			// 이 메소드가 Statement라는 객체를 리턴해준다
			// 이 객체를 통해서 쿼리를 수행시킬 수 있다 ( java.sql.Statement 임포트 )
			statement = connection.createStatement();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// select 쿼리 수행기능
	public ResultSet select(String query) {
		ResultSet resultSet;
		try {
			resultSet = statement.executeQuery(query);
			return resultSet;
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		}
		
		// 일반적으로 메서드에 수행 결과가 정상적일때는 그에 대응되는 정상적인 객체가 리턴이 되는거고 
		// 혹시 객체를 리턴하는 메서드가 정상적으로 수행되지 않은 경우에는 null을 리턴함으로써 문제가 있다는걸 알려주게 됩니다
	}
	
	// insert, update, delete 쿼리 수행기능
	public int update(String query){
		
		try {
			// 실행된 행의 개수 ( insert 쿼리에 실행된 행의 갯수는 몇 행이 insert 됬는지를 리턴해줌, update는 몇 개의 행이 수정됐는지를 리턴해준다, delete는 몇 개의 행이 삭제됐는지를 리턴해준다 )
			int count = statement.executeUpdate(query);
			return count;
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			return -1; //음수 값을 리턴해서 잘못 수행 되었다는걸 알려줌
		}
		
	}
	
	// 데이터베이스 접속 끊기
	public void disconnect(){
		try {
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
