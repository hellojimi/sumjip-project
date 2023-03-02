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
<%
int qno=Integer.parseInt(request.getParameter("qno"));

QnaDAO dao=new QnaDAO();
QnaDTO dto = dao.getQna(qno); 

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
%>
<jsp:include page="../inc/ad_header.jsp" />
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			<div class="col-lg-12">
				<div class="content-main adminichi">		
				<h1 class="taitoru">Answer Update</h1>
				<form action="AdminAnswerUpdatePro.ad" method="post"> 
					<input type="hidden" name="qno" value="<%=qno %>">
						<div class="form-check">
							<input class="form-check-input" name="qstate" type="checkbox" value="0" id="flexCheckDefault" checked>
							<label class="form-check-label" for="flexCheckDefault" style="font-size:16px;">
							 답변완료
							</label>
						</div>
					<div class="iro">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">작성자</label>
							<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="관리자" name="no" readonly>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">글내용</label>
							<textarea type="text" class="form-control" id="exampleFormControlTextarea1" style="height: 300px;" rows="3" name="answer"><%=dto.getAnswer() %></textarea>
						</div>
						<input type="submit" class="botann" value="글수정">
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>