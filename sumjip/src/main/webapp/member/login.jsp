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
<style>
	body {
		background-color: #f5f5f5;
	}

	#wrap {
		margin: 30px auto;
		margin-bottom: 50px;
		width: 90%;
		max-width: 600px;
		padding: 20px;
		background-color: #fff;
		font-family: 'NanumSquareNeo';
	}

	h1 {
		font-size: 24px;
		margin-bottom: 20px;
		text-align: center;
	}

	form {
		background-color: white;
		padding: 30px;
		padding-bottom: 0;
		box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
		border-radius: 5px; 
	}

	label {
		display: block;
		margin-bottom: 5px;
	}

	input[type="text"],
	input[type="password"] {
		display: block;
		width: 100%;
		padding: 10px;
		margin-bottom: 20px;
		border: none;
		border-radius: 5px;
		background-color: #fff;
		box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
	}

	input[type="submit"] {
		display: block;
		width: 100%;
		padding: 10px;
		margin-top: 10px;
		background-color: #99b19c;
		color: #fff;
		font-weight: bold;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}

	#sub_menu {
		margin-top: 20px;
		text-align: center;
	}

	#sub_menu a {
		color:  #113000;
		text-decoration: none;
	}

	#sub_menu span {
		color: #777;
	}
	.heading-section {
    font-size: 30px;
    color: #393939;
    line-height: 1.5;
    font-weight: 400;
    font-family: "Poppins", Arial, sans-serif;
    font-weight: bold;
    text-align: center;
    margin: 10px;     
}
</style>
</head>
<body>
	
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->

<div id="wrap">
		<h1 class="heading-section">Login</h1>
		<form action="MemberLoginPro.me" id="join" method="post">
			<fieldset>
				
				<input type="text" name="id" placeholder="아이디를 입력하세요"><br> 
				<input type="password" name="pass" placeholder="비밀번호를 입력하세요"><br>
				<input type="submit" value="로그인" class="submit"><br>
				

				<br>
			</fieldset>

		</form>

		<nav id="sub_menu">
			<a href="MemberAgree.me">회원가입</a><span class="p-2"> | </span> 
			<a href="MemberFindId.me">ID찾기</a><span class="p-2"> | </span> 
			<a href="MemberFindPass.me">비밀번호찾기</a>
		</nav>
		
		
	</div>
	
<jsp:include page="../inc/footer.jsp" />
</body>
</html>