<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<head>
<title>섬집</title>
<style type="text/css">
	body {
		background-color: #f5f5f5;
		font-family: sans-serif;
	}

	#wrap {
		margin: 60px auto;
		width: 90%;
		max-width: 600px;
		padding: 20px;
		padding-bottom: 50px;
		background-color: #fff;
		font-family: 'NanumSquareNeo';
 		font-size: 30px; 
		text-align: center;
	}
	
	.result {
		font-family: "Poppins", Arial, sans-serif;
		font-size: 40px;
		line-height: 1.5;     	
    	font-weight: 400;
		
	}
	
	#found-success{
		font-size: 30px;
	}
	
	form {
		background-color: white;
		margin: 20px auto;
		max-width: 600px;
		padding: 20px;
		padding-bottom: 60px;
		box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
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
            float: right;
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
String uname = request.getParameter("uname");
String email = request.getParameter("email");
     
UserDAO dao = new UserDAO();
UserDTO dto = dao.findId(uname, email);  
%>

	<div id="wrap">
<!-- 		<div class="result"> -->
		<h2 class="result">아이디 찾기 결과</h2>
<!-- 		</div> -->
		<form name="idsearch" method="post">
      		<%
       			if (dto != null) {
      		%>
      			<div class="found-success">
	      			회원님의 아이디는 <b><%=dto.getId()%></b>입니다.
	      			<div class="login-btn">
	 		    		<a href="MemberLogin.me"><input type="button" id="btnLogin" value="로그인"></a>
	       			</div>
	      		</div>
	      		<%
		  		} else {
		 		%>
		        <div class="found-fail">
		      		등록된 정보가 없습니다.
		    	</div>
		    	<div class="login-btn">
		     		<input type="button" id="btnback" class="btn btn-outline-success" value="다시 찾기" onClick="history.back()"/>
		     		<a href="MemberAgree.me"><input type="button" id="btnjoin" class="btn btn-outline-success" value="회원가입"></a>
		    	</div> 
		    	<%
		  		}
		 		%> 
	 		</form>
	</div>

<jsp:include page="../inc/footer.jsp" />
</body>
</html>
      