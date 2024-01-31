<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	Date now = new Date();// 기본 생성자를 통해서 Date 객체를 생성을 하면 이 생성한 시기의 날짜 시간 정보가 해당 객체에 저장
	// 이 Date 객체에 들어가 있는 날짜, 시간 정보를 내가 원하는 문자 형태로 만들기 위해서 SimpleDateFormat 객체를 만듬
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
	// simpleDateFormat 객체에서 format이라는 메서드를 호출해서 여기에 변환할 Date 객체를 인자로 전달하면 변환된 문자열을 리턴해줌
	String dateString = formatter.format(now);
	
%>
<div>
	<h3><%= dateString %></h3>
</div>