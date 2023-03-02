<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.SalesDTO"%>
<%@page import="products.SalesDAO"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.AppointmentDAO"%>
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
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			<div class="col-lg-12">
				<div class="content-main adminichi">		
                    <h1 class="taitoru">Appointment List</h1>
					                    
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
					ArrayList<AppointmentDTO> AppointmentList=(ArrayList<AppointmentDTO>)request.getAttribute("AppointmentList");
					
					int startPage=(Integer)request.getAttribute("startPage");
					int pageBlock=(Integer)request.getAttribute("pageBlock");
					int endPage=(Integer)request.getAttribute("endPage");
					int pageCount=(Integer)request.getAttribute("pageCount");
					
					
					
					
					%>
					<form action="AdminAppointNowUpdate.ad" method="post">
						<div>
							<table border="1" class="teeburu">
							<tr><th>예약번호</th><th>작성자</th><th>예약상태</th><th>예약상태 변경</th><th>예약일자</th><th>예약취소</th></tr>
							<%
							 for(int i=0;i<AppointmentList.size();i++){
							 	//배열 한칸에 내용 가져오기
							 	AppointmentDTO dto=AppointmentList.get(i);
							 	UserDAO udao = new UserDAO();
								UserDTO udto = udao.getUserNo(dto.getNo());
							%>
							<tr><td><%=dto.getAno()%></td>
							    <td><%=udto.getId() %></td>
							    <td><%
							    if(dto.getAstatus()==1){
							    	out.print("입금대기");
							    }else if(dto.getAstatus()==2){
							    	out.print("입금완료");
							    }else if(dto.getAstatus()==3){
							    	out.print("예약완료");
							    }	    
							    %>
							    </td>
							   	<%
							    if(dto.getAstatus()!=3){
							   	%>
							    	<td><a href="AdminAppointNowUpdate.ad?Astatus=<%=dto.getAstatus()%>&ano=<%=dto.getAno()%>">다음 예약단계로 변경</a></td>
							    <%
							    }else if(dto.getAstatus()==3){
							    %>
							    	<td>이미 최종단계입니다.</td>
							    <%
							    }
							   	%>	    
							    <td><%=dateFormat.format(dto.getAdate())%></td>
							    <td><a href="AdminAppointNowDelete.ad?num=<%=dto.getAno()%>">예약취소</a></td></tr>    
							   <%
							   }
								%>
							</table>
						</div>
					</form>
					<div class="pojisyonn">
					<%
										//10페이지 이전
					if(startPage > pageBlock){
					%>
						<a href="AdminAppointNow.ad?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
					<%
					}
					%>
					<div class="peigingu">
					<%
					for(int i=startPage;i<=endPage;i++){
					%>
						
						<a href="AdminAppointNow.ad?pageNum=<%=i%>" class="pp"><%=i%></a>
					<%
					}
					%>
					</div>
					<%
					//10페이지 다음
					if(endPage < pageCount){
					%>
						<a href="AdminAppointNow.ad?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
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