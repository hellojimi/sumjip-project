<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
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
<link rel="stylesheet" href="css/insert.css" type="text/css" >
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
    margin: 25px;      
}

.tt2{
text-align: center;
background-color: white;
} 

.co{
 height: 300px;
}

.tt{
background-color: #99b19c;
text-align: center;
width: 100px;
}
#table_search{
	float: right;  
}

.b_content{
	border: none;
	resize:none;
	text-align: center;
}
</style>
</head>


<body>
<!-- 헤더 들어가는 곳 -->
 	<jsp:include page="../inc/header.jsp" />
 	
 	
<%
// int bno = Integer.parseInt(request.getParameter("bno"));

// BoardDAO dao=new BoardDAO();
// BoardDTO dto=dao.getBoard(bno);

String id=(String)session.getAttribute("id");

BoardDTO dto=(BoardDTO)request.getAttribute("dto");

%>
<article>
<!-- 공지사항 내용 -->
<h3 class="heading-section">Notice</h3>
<table class="table">
<thead class="thead-primary">
<tr><td class="tt">공지사항 번호</td><td class="tt2"><%=dto.getBno() %></td></tr>
<tr><td class="tt">작성날짜</td><td class="tt2"><%=dto.getBdate() %></td></tr>
<tr><td class="tt">조회수</td><td class="tt2"><%=dto.getBcount() %></td></tr>
<tr><td class="tt">제목</td><td class="tt2"><%=dto.getBtitle() %></td></tr>
<tr class="co"><td class="tt">내용</td>
<td class="tt2"><textarea type="text" class="b_content" style="height: 250px; width: 800px;" rows="3" placeholder="<%=dto.getBcontent() %>" readonly></textarea></td></tr>
<tr><td colspan="2">
<% 
// 로그인 => 세션값 있음
if(id != null){
	// 세션값  , 글쓴이  => 일치 => 자기자신 쓴 글(글수정, 글삭제 보이기)

}
%>
<div id="table_search">
<button type="button" class="btn btn-outline-success" value="글목록" onclick="location.href='BoardList.bo'">글목록</button><br>
</div>

	
 
 </td></tr>
 </thead>
 </table>
 
<!-- 댓글 영역 들어가는 곳 -->
 <jsp:include page="replyForm.jsp" />
 </article>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
 
</body>
</html>