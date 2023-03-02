<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
// UserDAO 객체생성
UserDAO dao=new UserDAO();
//UserDTO dto = getUser(id)메서드 호출 
UserDTO dto = dao.getUser(id);

String result="";
//dto null 아니면 아이디 있음, 아이디 중복
//dto null 이면  아이디 없음, 아이디 사용가능
if(dto!=null){
	// 아이디 있음, 아이디 중복
	result="중복";
}else{
	// 아이디 없음, 아이디 사용가능
	result="중복아님";
}
%>
<%=result%>