<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
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
article{
	font-family: 'NanumSquareNeo';
  	max-width: 300px;
 	margin: 0 auto;
 	padding: 20px;
 	margin-bottom: 70px;
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
.tt{
background-color: #99b19c;
text-align: center;
}

.co{
 height: 300px;
}

.tt2{
text-align: center;
background-color: white;
}

.btn-group{
	float: left;
}

.ans{
float: right;
}
#table_search{
	float: right;  
}
</style>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->
<%
//request에 저장된 qno 파라미터값 가져오기
// int qno=Integer.parseInt(request.getParameter("qno"));

//QnaDAO 객체생성
// QnaDAO dao=new QnaDAO();

// QnaDTO dto = dao.getQna(qno);  

//id 세션값 가져오기
String id=(String)session.getAttribute("id");
// int no=dto.getNo();
// UserDAO udao = new UserDAO();
// UserDTO udto = udao.getUserNo(no);
QnaDTO qdto = (QnaDTO)request.getAttribute("qdto");
UserDTO udto = (UserDTO)request.getAttribute("udto");
int qno=(Integer)request.getAttribute("qno");


//로그인 되어있지 않으면 로그인화면으로
if(id==null){
	response.sendRedirect("AdminLogin.ad");
}
%>
<article>
<div class="container">
<h3 class="heading-section">answer</h3>

<table class="table table">
	<tr><td class="tt">글번호</td><td class="tt2"><%=qdto.getQno() %></td></tr>
	<tr><td class="tt">글쓴날짜</td><td class="tt2"><%=qdto.getQadate() %></td></tr> 
	<tr class="co"><td class="tt">글내용</td><td class="tt2"><%=qdto.getAnswer() %></td></tr>
	</table>
<div id="table_search">
<button type="button" class="btn btn-outline-success" value="글목록" onclick="location.href='QnaList.qa'">글목록</button><br>
</div>	

</div>
</article>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
</body>
</html>