<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
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
				SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
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
				
				QnaDTO qdto = (QnaDTO)request.getAttribute("qdto");
				UserDTO udto = (UserDTO)request.getAttribute("udto");
				int qno=(Integer)request.getAttribute("qno");
				%>
				<h1 class="taitoru">Question</h1>
					<div class="iro">
						<div class="row">
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-2 col-form-label">글번호</label>
						    <input type="text" class="form-control" placeholder="<%=qdto.getQno() %>" aria-label="First name">
						  </div>
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-2 col-form-label">조회수</label>
						    <input type="text" class="form-control" placeholder="<%=qdto.getQcount() %>" aria-label="Last name">
						  </div>
						</div>
						<div class="row" style="margin-top: 5px; margin-bottom: 20px;">
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-2 col-form-label">작성자</label>
						    <input type="text" class="form-control" placeholder="<%=udto.getId() %>" aria-label="First name">
						  </div>
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-3 col-form-label">글쓴날짜</label>
						    <input type="text" class="form-control" placeholder="<%=dateFormat.format(qdto.getQdate()) %>" aria-label="Last name">
						  </div>
						</div>
					
						<div class="row mb-3">
							<label for="colFormLabel" class="col-sm-2 col-form-label">글제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="colFormLabel" placeholder="<%=qdto.getQtitle() %>">
							</div>
						</div>
						<div class="row mb-3">
							<label for="colFormLabel" class="col-sm-2 col-form-label">글내용</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="colFormLabel" placeholder="<%=qdto.getQcontent() %>">
							</div>
						</div>
					</div>
					<div class="peigingu" role="group" aria-label="Basic example">
						<button type="button" class="ppp"onclick="location.href='AdminQnaList.ad'">글목록</button>
						<input type="button" value="글전체삭제" class="ppp" onclick="location.href='AdminQuestionDelete.ad?qno=<%=qdto.getQno() %>'">
						<!-- 답변이 있을때만 답변확인버튼 보이게 -->
						<%
						if(qdto.getAnswer() != null){ 
							
							 %>
							<button type="button" class="ppp" onclick="location.href='AdminQnaAnswer.ad?qno=<%=qdto.getQno() %>'">답변확인</button>
							<%
						}else{
						 %>
							<button type="button" class="ppp" onclick="location.href='AdminAnswerWriteForm.ad?qno=<%=qdto.getQno() %>'">답변쓰기</button>
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