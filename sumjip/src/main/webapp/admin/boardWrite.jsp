<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>섬집 관리자 페이지</title>
</head>
<!-- 부트스트랩 사용하기 위해 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
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
					%>
					<h1 class="taitoru">Board Write</h1>
					<!-- 게시판 글쓰기 부분 -->
					<form action="AdminBoardWritePro.ad" method="post" >
						<div>
							<table class="teeburu">
							<div class="iro">
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">작성자</label>
									<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="관리자" name="id" readonly>
								</div>
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">글제목</label>
									<input type="text" class="form-control" id="exampleFormControlInput1" name="btitle">
								</div>
								<div class="mb-3">
									<label for="exampleFormControlTextarea1" class="form-label">글내용</label>
									<textarea type="text" class="form-control" id="exampleFormControlTextarea1" style="height: 300px;" rows="3" name="bcontent" placeholder="글 내용을 작성하세요"></textarea>
								</div>
							</div>
							</table>
							<input type="submit" class="botann" style="right: 55px; bottom: 15px;" value="글쓰기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>