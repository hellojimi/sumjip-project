<%@page import="board.ReplyDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<meta charset="UTF-8">
<title>섬집 관리자 페이지</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />

<!-- 한페이지에 보여줄 글 개수 -->
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			<div class="col-lg-12">
				<div class="content-main adminichi">		
					<%
					String id=(String)session.getAttribute("id");
					
					if(id==null){
						response.sendRedirect("AdminLogin.ad");
					}else if(id.equals("admin")){
					
					}else{
						%>
					<script type="text/javascript">
					alert("접근 권한이 없습니다.");
					history.back();
					</script>
					<%
					}
					
					SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
					
					ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>)request.getAttribute("boardList");
					int currentPage =(Integer)request.getAttribute("currentPage");
					int pageBlock =(Integer)request.getAttribute("pageBlock");
					int startPage =(Integer)request.getAttribute("startPage");
					int endPage =(Integer)request.getAttribute("endPage");
					int pageCount =(Integer)request.getAttribute("pageCount");
					
					String search=(String)request.getAttribute("search");
					%>
					<h1 class="taitoru">Board List</h1>
					<div>
						<!-- 게시판 글 검색부분 -->
							<form action="AdminBoardList.ad"  method="post">
								<div class="migi">
									<input type="text" name="search">
									<input type="submit" value="검색" class="kennsaku">
								</div>
							</form>
						
						<!-- 공지사항 리스트 부분 -->
						<table border="1" class="teeburu">
							<tr><th>번호</th><th>제목</th><th>작성날짜</th><th>조회수</th></tr>
								<%
								for(int i=0; i<boardList.size(); i++){
									BoardDTO dto= boardList.get(i);
									
								%>
								<tr>
									<td><%=dto.getBno() %></td>
								    <td>
								    	<a href="AdminBoardContent.ad?bno=<%=dto.getBno() %>"><%=dto.getBtitle() %></a>
								    </td>
									<td><%=dateFormat.format(dto.getBdate()) %></td>
									<td><%=dto.getBcount() %></td>
								</tr>
								<% 
								}
								%>
						</table>
					</div>
					<div class="pojisyonn">
						<!-- 페이징 처리 -->
						<% 
						
						if(search==null){
							
						if(startPage > pageBlock){
							%>
						<a href="AdminBoardList.ad?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
							<%
						}
						%>
						<div class="peigingu">
						<%
						for(int i=startPage;i<=endPage;i++){
							%>
							<a href="AdminBoardList.ad?pageNum=<%=i%>" class="pp"><%=i %></a> 
							<%
						}
						%>
						</div>
						<%
						if(endPage < pageCount){
							%>
						<a href="AdminBoardList.ad?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
							<%
						}
						
						
						}else{
							if(startPage > pageBlock){
								%>
							<a href="AdminBoardList.ad?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">[10페이지 이전]</a>
								<%
							}
							%>
							<div class="peigingu">
							<%
							for(int i=startPage;i<=endPage;i++){
								%>
								<a href="AdminBoardList.ad?pageNum=<%=i%>&search=<%=search%>" class="pp"><%=i %></a> 
								<%
							}
							%>
							</div>
							<%
							if(endPage < pageCount){
								%>
							<a href="AdminBoardList.ad?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">[10페이지 다음]</a>
								<%
							}
						}
						
						%>
						
						<div >
							<button type="button" onclick="location.href='AdminBoardWriteForm.ad'" class="botann">글쓰기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>

</body>
</html>