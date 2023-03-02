<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
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
<title>섬집 관리자 페이지</title>
<script type="text/javascript" src="script/jquery-3.6.3.js"></script>
</head>
<body>


<!-- 한페이지에 보여줄 글 개수 -->
<%
ArrayList<QnaDTO> qnaList = (ArrayList<QnaDTO>)request.getAttribute("qnaList");
int currentPage =(Integer)request.getAttribute("currentPage");
int pageBlock =(Integer)request.getAttribute("pageBlock");
int startPage =(Integer)request.getAttribute("startPage");
int endPage =(Integer)request.getAttribute("endPage");
int pageCount =(Integer)request.getAttribute("pageCount");

SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

String qstatus = "";
%>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더들어가는 곳 -->
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			
			<div class="col-lg-12">
				<div class="content-main adminichi">		
					<h1 class="taitoru">Q&A List</h1>
					<div>
						<table border="1" class="teeburu">
							<tr><th>번호</th><th>작성자</th><th>제목</th><th>작성날짜</th><th>답변 상태</th><th>조회수</th></tr>
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
						
						//배열접근 => for => 배열 한칸에 내용 가져오기 => qnaDTO 저장 => 출력
						for(int i=0;i<qnaList.size();i++){
							QnaDTO dto= qnaList.get(i);
							UserDAO udao = new UserDAO();
							UserDTO udto = udao.getUserNo(dto.getNo());
						
						// 답변 상태
						if(dto.getQstatus()==0){ 
							qstatus = "답변완료";
						}else{
							qstatus="답변미등록";
						}
						%>
							<tr><td><%=dto.getQno() %></td>
								<td><%=udto.getId() %></td>
								<td><a href="AdminQnaQuestion.ad?qno=<%=dto.getQno() %>"><%=dto.getQtitle() %></a></td>
								<td><%=dateFormat.format(dto.getQdate()) %></td>
								<td><%=qstatus%></td>	
								<td><%=dto.getQcount()%></td></tr>	
							<%
						}
						%>
						</table>
						</div>
						<div class="pojisyonn">
						<!-- 페이징 처리 -->
							<%
						// 10페이지 이전
						if(startPage > pageBlock){
							%>
						 	<a href="AdminQnaList.ad?pageNum=<%=currentPage-pageBlock %>">[10페이지 이전]</a>
							<%
						}
						%>
						<div class="peigingu">
						<% 
						for(int i=startPage;i<=endPage;i++){
							%>
							<a href="AdminQnaList.ad?pageNum=<%=i %>"  class="pp"><%=i %></a>
							<%
						}
						%>
						</div>
						<%
						// 10페이지 다음
						if(endPage < pageCount){
							%>
							<a href="AdminQnaList.ad?pageNum=<%=startPage+pageBlock %>">[10페이지 다음]</a>
								<%
						}
						%>
						</div>
				</div>
			</div>
		</div>
	</div>

<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
</body>
</html>