<%@page import="board.ReplyDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
<script type="text/javascript" src="script/jquery-3.6.3.js"></script>
<style>
article{
	font-family: 'NanumSquareNeo';
  	max-width: 1000px;
 	margin: 0 auto;
 	padding: 70px;
}
.table thead.thead-primary{
	background: #99b19c;
	font-weight: bold;
	color: #FFFFFF;	
	text-align: center;
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

#table_search{
	padding: 10px;
 	width:350px;
	margin:auto;
	text-align: center;
}
.table tr.boa{
    text-align: center;
}
.table tr.boa:hover{
	background: #E1E1E1;
}

span{
font-size : 11px;
color : red;
}
</style>

</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />

<!-- 한페이지에 보여줄 글 개수 -->
<%
// BoardDAO dao= new BoardDAO();

// // 한페이지에 보여줄 글 개수
// int pageSize=10;

// String pageNum=request.getParameter("pageNum");
// if(pageNum==null){
// 	 pageNum="1";
// 	}

// int currentPage=Integer.parseInt(pageNum);

// int startRow=(currentPage-1)*pageSize+1;

// int endRow= startRow+pageSize-1;

// ArrayList<BoardDTO> boardList=dao.getBoardList(startRow, pageSize);

SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>)request.getAttribute("boardList");

int currentPage =(Integer)request.getAttribute("currentPage");
int pageBlock =(Integer)request.getAttribute("pageBlock");
int startPage =(Integer)request.getAttribute("startPage");
int endPage =(Integer)request.getAttribute("endPage");
int pageCount =(Integer)request.getAttribute("pageCount");

String search=(String)request.getAttribute("search");




%>

<!-- 공지사항 리스트 부분 -->
<article>
	<div class="qnalistContainer">
		<h3 class="heading-section">Board List</h3>
	</div>
	<table class="table">
		<thead class="thead-primary">
			<tr>
				<td>번호</td>
				<td>제목</td><td>작성일자</td>
				<td>조회수</td>
			</tr>
		</thead>

<%
for(int i=0; i<boardList.size(); i++){
	BoardDTO dto= boardList.get(i);

ReplyDAO rdao = new ReplyDAO();
int Rcount = rdao.countReply(dto.getBno());
%>
<tr class="boa">
	<td><%=dto.getBno() %></td>

    <td>
    <a href="BoardContent.bo?bno=<%=dto.getBno() %>">
    <%=dto.getBtitle() %>   <span>&nbsp;댓글 <%=Rcount%></span>
    </a></td>
<td><%=dateFormat.format(dto.getBdate()) %></td>
<td><%=dto.getBcount() %></td></tr>

<% 
}
%>
</tbody>
</table>

<!-- 글쓰기 버튼 부분 -->

<!-- <div id="table_search">
<button type="button" class="btn btn-outline-success" value="글쓰기" onclick="location.href='BoardWriteForm.bo'">글쓰기</button><br>
</div>
 -->
<!-- 게시판 글 검색부분 -->
<div id="table_search">
<form action="BoardList.bo"  method="post">
<input type="text" name="search">
<button type="submit" class="btn btn-outline-success">검색</button>
</form>
</div>

<!-- 페이징 처리 -->
<% 
// // 한 화면에 보여줄 페이지개수
// int pageBlock=10;

// // 시작하는 페이지 번호
// int startPage=(currentPage-1)/pageBlock*pageBlock+1;

// // 끝나는 페이지 번호
// int endPage=startPage+pageBlock-1;

// // 전체글 개수를 정의한 getBoardCount()메서드 호출
// int count= dao.getBoardCount();

// // 전체페이지
// int pageCount=count/pageSize+(count%pageSize==0?0:1);
// if(endPage > pageCount){
// 	endPage = pageCount;
// }

if(search==null){
%>
<!-- 페이징 -->
 <div class="col-lg-12">
 <div class="room-pagination">
<%
if(startPage > pageBlock){
	%>
<a href="BoardList.bo?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]
<i class="fa fa-long-arrow-right"></i></a>
	<%
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="BoardList.bo?pageNum=<%=i%>"><%=i %></a> 
	<%
}

if(endPage < pageCount){
	%>
<a href="BoardList.bo?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]
<i class="fa fa-long-arrow-right"></i></a>
	<%
}
%>
</div>
</div>
<%
}else{
%>
 <div class="col-lg-12">
 <div class="room-pagination">
<%
	if(startPage > pageBlock){
		%>
	<a href="BoardList.bo?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">[10페이지 이전]
	<i class="fa fa-long-arrow-right"></i></a>
		<%
	}

	for(int i=startPage;i<=endPage;i++){
		%>
		<a href="BoardList.bo?pageNum=<%=i%>&search=<%=search%>"><%=i %></a> 
		<%
	}

	if(endPage < pageCount){
		%>
	<a href="BoardList.bo?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">[10페이지 다음]
	<i class="fa fa-long-arrow-right"></i></a>
		<%
	}
	%>
	</div>
	</div>
	<%
}
%>

</article>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />

</body>
</html>