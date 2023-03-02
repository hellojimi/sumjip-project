<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.awt.desktop.UserSessionListener"%>
<%@page import="member.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<title>섬집 관리자 페이지</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더들어가는 곳 -->
		
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
				ArrayList<UserDTO> userList =(ArrayList<UserDTO>)request.getAttribute("userList");
				
				int startPage=(Integer)request.getAttribute("startPage");
				int pageBlock=(Integer)request.getAttribute("pageBlock");
				int endPage=(Integer)request.getAttribute("endPage");
				int pageCount=(Integer)request.getAttribute("pageCount");
				
				%>
				<h1 class="taitoru">User List</h1>
				<form action="AdminUserDelete.ad" id="user_delete" method="post">
					<div>
						<table border="1" class="teeburu">
						<tr><th>이름</th><th>아이디</th><th>생일</th><th>이메일</th><th>가입날짜</th><th>회원유형</th><th>회원삭제</th></tr>
						<%
						//배열 접근 = for
						for(int i=0;i<userList.size();i++){
							// 배열 한 칸에 내용 가져오기
							UserDTO dto=userList.get(i);
						%>
						<tr>
							<td> <%=dto.getUname() %> </td>
							<td> <%=dto.getId() %> </td>
							<td> <%=dto.getBirth() %> </td>
							<td> <%=dto.getEmail() %></td>
							<td><%=dateFormat.format(dto.getJoindate()) %></td>
							<td>
								<% if (dto.getUtype() == 1) { %>
							        일반회원 
							    <% } else if (dto.getUtype() == 2) { %>
							        사장님 
							    <% } else {%>
							    	 관리자 
							    <% } %>
							</td>
							<td>
								<a href="AdminUserDelete.ad?id=<%=dto.getId()%>" onclick="return confirm('회원을 삭제하시겠습니까?')">회원삭제</a>
							</td>
						</tr>
						<%
						}
						%>
						</table>
					</div>
				</form>
				<div class="pojisyonn">
				<%
				// 10페이지 이전
				if(startPage > pageBlock){
					%>
					<a href="AdminUserList.ad?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
					<%
				}
				%>
				<div class="peigingu">
				<%
				for(int i=startPage;i<=endPage;i++){
					%>
					<a href="AdminUserList.ad?pageNum=<%=i%>" class="pp"><%=i %></a>
					<%
				}
				%>
				</div>
				<%
				//10페이지 다음
				if(endPage < pageCount){
					%>
					<a href="AdminUserList.ad?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
					<%
				}
				%>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>