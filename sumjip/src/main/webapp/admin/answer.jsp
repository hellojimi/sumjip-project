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
<%
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
String id=(String)session.getAttribute("id");
QnaDTO qdto = (QnaDTO)request.getAttribute("qdto");
UserDTO udto = (UserDTO)request.getAttribute("udto");
int qno=(Integer)request.getAttribute("qno");

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
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더들어가는 곳 -->
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			<div class="col-lg-12">
				<div class="content-main adminichi">		
					<h1 class="taitoru">Answer Detail</h1>
					<div class="iro">
						<div class="row mb-3">
							<label for="colFormLabel" class="col-sm-2 col-form-label">글번호</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="colFormLabel" placeholder="<%=qdto.getQno() %>">
							</div>
						</div>
						<div class="row mb-3">
							<label for="colFormLabel" class="col-sm-2 col-form-label">글쓴날짜</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="colFormLabel" placeholder="<%=dateFormat.format(qdto.getQadate()) %>">
							</div>
						</div>
						<div class="row mb-3">
							<label for="colFormLabel" class="col-sm-2 col-form-label">글내용</label>
							<div class="col-sm-10">
								<textarea type="text" class="form-control" id="colFormLabel" style="height: 300px;" rows="3" placeholder="<%=qdto.getAnswer() %>" readonly></textarea>
							</div>
						</div>
					</div>
					<div class="peigingu">
						<input type="button" value="글목록" class="ppp" onclick="location.href='AdminQnaList.ad'"> 	
						<input type="button" value="글수정" class="ppp" onclick="location.href='AdminAnswerUpdateForm.ad?qno=<%=qdto.getQno() %>'">
						<input type="button" value="답변삭제" class="ppp" onclick="location.href='AdminAnswerDelete.ad?qno=<%=qdto.getQno() %>'">
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>