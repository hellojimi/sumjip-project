<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@page import="net.utility.MyAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<head>
<meta charset="UTF-8">
<title>섬집</title>
<style type="text/css">
	body {
		background-color: #f5f5f5;
		font-family: sans-serif;
	}

	#wrap {
		margin: 60px auto;
		width: 90%;
		margin-bottom: 207px;
		max-width: 600px;
		padding: 20px;
		background-color: #fff;
		font-family: 'NanumSquareNeo';
	}
	
	form {
		background-color: white;
		margin: 20px auto;
		max-width: 600px;
		padding: 20px;
		box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
		font-size: 30px;
		text-align: center;
	}
	input[type="button"],
	input[type="submit"],
	input[type="reset"] {
 			background-color: #99b19c;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-right: 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
	}

  input[type="button"]:hover,  
  input[type="submit"]:hover,  
  input[type="reset"]:hover {  
  		  background-color: #113000;  
  } 
	
</style>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");


UserDAO dao = new UserDAO();
UserDTO dto = dao.getUser(id);
	
//dto.setId(id);

String email = dao.findEmail(id);
//dto.setEmail(email);
%>
	<div id="wrap">
		<form name="passsearch" method="post">
	<%
	//전송할 이메일 보여주기
	if(dto!=null) {
	%>
		<div class="found-success">
		임시 비밀번호 발급
		<p>아래 이메일로 임시 비밀번호를 전송합니다.</p>
		<p><%=dto.getEmail() %></p>
		</div>
		<a href="MemberLogin.me"><input type="button" name=login value="로그인하기"></a>
	<%			
	} else {
	%>
		<div class="found-fail">
			회원정보가 없습니다			
	    <p><a href='javascript:history.back()'>[다시시도]</a></p>
	    </div>
		<%
	}
	%>
	</form>
	</div>
	<%
	//임시 비밀번호 생성
	String tmpPasswd = dao.tmpPasswd(dto);
	//out.print(tmpPasswd);

	//임시 비밀번호 메일로 전송
	dao.sendTmpPw(tmpPasswd, dto);	
%>
	
<jsp:include page="../inc/footer.jsp" />
</body>
</html>