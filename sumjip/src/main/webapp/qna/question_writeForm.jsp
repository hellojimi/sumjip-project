<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>섬집</title>
<style>
#wrap{
	font-family: 'NanumSquareNeo';
  	max-width: 1000px;
 	margin: 0 auto;
 	padding: 20px;
 	margin-bottom: 70px;
}

.table thead.thead-primary{
	background: #99b19c;
	font-weight: bold;
	color: #FFFFFF;
	
}

.heading-section {
    font-size: 28px;
    color: #393939;
    line-height: 1.5;
    font-weight: 400;
    font-family: "Poppins", Arial, sans-serif;
    font-weight: bold;
    text-align: center;
    margin: 10px; 
     
}

.form-control {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #99b19c;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

input.form-control[readonly]{
	background-color: #99b19c;
	opacity: 1;
    color: #fff;
    font-weight: bold;
}

#table_search{
	float: right;
   
}
textarea.form-control{
	resize: none;
}

</style>
</head>
<body>

<!-- 부트스트랩 사용하기 위해 -->

<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />

<div id="wrap">
<%
// id값 받아오기
String id=(String)session.getAttribute("id");

int no = 0;
//로그인 되어있지 않으면 로그인화면으로
if(id==null){
	response.sendRedirect("MemberLogin.me");
}else{

UserDAO rdao=new UserDAO();
UserDTO rdto=rdao.getUser(id);
no = rdto.getNo();
}

%>

<div class="qna_writeContainer">
<!-- 게시판 글쓰기 부분 -->
<form action="QuestionWritePro.qa" method="post"> 
<div class="container">
<h3 class="heading-section">Question</h3>

<input type="hidden" name="no" value="<%=no%>">
 <table class="table table-hover">
	 <tbody>
<!-- 	<table border="1"> -->
		<tr><td><input type="text" name="name" class="form-control" maxlength="40" value="<%=id %>" readonly></td></tr>
		<tr><td><input type="text" name="qtitle" class="form-control" maxlength="40" placeholder="제목을 작성하세요"></td></tr>
		<tr><td><textarea name="qcontent" class="form-control" maxlength="1024" style="height: 400px;" placeholder="글 내용을 작성하세요"></textarea></td></tr>
		</tbody>
	</table>
	<div id="table_search">
	<button type="submit" value="글쓰기" class="btn btn-outline-success">글쓰기</button><br>
	</div>
</div>
</form>
</div>
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
	

</body>
</html>