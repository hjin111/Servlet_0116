package com.jinju.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex01Controller extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// response 용기 그릇에 데이터를 담을 수도 있지만 response header라고 해서 돌려 줄 데이터 정보를 바꿀 수도 있다
		
		// response header - response에 대한 정보 / 내가 전달할 데이터에 대한 정보
		// response에 담길 데이터 정보
		// 캐릭터 셋, 캐릭터 인코딩 UTF-8
		// 내가 만든 이 데이터는 UTF-8 인코딩으로 만든거야 라는걸 정확히 알려주는거임 
		// 내가 만든 결과물은 UTF-8로 만들어진거야 라는 정보를 response에다가 채워 넣을건데 
		// 그걸 tomcat이 객체로 만들어놨기 떄문에 그 객체를 대상으로 메소드를 통해 값을 세팅해주면 됨 
		response.setCharacterEncoding("UTF-8");
		// 데이터 타입 - 내가 전달하는 데이터는 어떤 타입의 데이터다 라는걸 알려줘야 함
		// response header에다가 내가 전달할 데이터 타입을 적어줘야 한다
		// html, png, jpeg, mp4, pdf
		// MIME 규격 - 파일의 타입을 특정한 형태의 문자열로 만들어서 규격을 정해놨어 그래서 그걸 response header에다가 세팅해주면 그 규격에 맞춰서 판단함
		// text/plain : 그냥 문자열 ( 아무런 규격이 없는 문자열 )
		response.setContentType("text/plain");
		
		// Response Body - response에 들어가는 데이터
		// PrintWriter : Response Body를 채우기 위한 객체 이 객체는 response 객체로 부터 얻어와서 사용한다
		// 여기까지 response에 필요한 내용들 셋팅했고 용기 안에 커피를 채워보자 
		// 커피를 채우기 위해서는 커피를 채우기 위한 기능을 하는 객체를 먼저 얻어와야함 ( PrintWriter라는 객체 )
		PrintWriter out = response.getWriter();
		// response에 채우고 싶은 내용을 문자열로 넣어주면 됨 println이라는 놈이 response 용기에다가 내용물을 채워줄거임
		out.println("URL Mapping 예제");
		
		// doGet 메서드가 호출 되면 request와 response가 전달이 되고 response에다가 필요한 header 정보들 채워넣고 그 header 정보에 맞는 데이터를 PrintWriter를 통해서 채워 넣어주면 이 내용이 요걸 요청한 쪽에 그대로 response 규격에 맞는 문자열로 전달이 됨 
		// doGet 메소드를 호출하게 할 경로를 매칭시켜 줄 것이다 -> web.xml에서 url mapping하기!!
		
		// response에다가 현재 날짜 시간을 추가 
		// 2024년 01월 14일 22:51:24
		// Date라는 클래스로 객체를 하나 생성
		Date now = new Date();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		String dateTimeString = formatter.format(now);
		
		out.println(dateTimeString);
		
	}
}
