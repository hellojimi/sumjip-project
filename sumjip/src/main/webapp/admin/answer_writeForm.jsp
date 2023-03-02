<%@page import="member.UserDTO"%>
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
<%
//id값 받아오기
String id=(String)session.getAttribute("id");
int qno=Integer.parseInt(request.getParameter("qno"));
UserDAO rdao=new UserDAO();
UserDTO rdto=rdao.getUser(id);
int no = rdto.getNo();

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
%>
<jsp:include page="../inc/ad_header.jsp" />
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			
			<div class="col-lg-12">
				<div class="content-main adminichi">		
					<h1 class="taitoru">Answer Write</h1>
					<form action="AdminAnswerWritePro.ad" method="post"> 
						<input type="hidden" name="no" value="<%=no%>">
						<input type="hidden" name="qno" value="<%=qno%>">
						<div class="iro">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">작성자</label>
								<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="관리자" name="name" readonly>
							</div>
							<div class="mb-3">
								<label for="exampleFormControlTextarea1" class="form-label">글내용</label>
								<textarea type="text" class="form-control" id="exampleFormControlTextarea1" style="height: 300px;" rows="3" name="answer" placeholder="글 내용을 작성하세요"></textarea>
							</div>
							<input type="submit" class="botann" style="bottom: 50px; right: 56px;" value="글쓰기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>