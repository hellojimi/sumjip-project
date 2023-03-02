<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>섬집 관리자 페이지</title>
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
</head>
<body>
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
					BoardDTO dto=(BoardDTO)request.getAttribute("dto");
					%>
					<h1 class="taitoru">Board Update</h1>
				
					<form action="AdminBoardUpdatePro.ad" method="post">
					<input type="hidden" name="bno" value="<%=dto.getBno()%>">
						<div>
							<table class="teeburu">
							<div class="iro">
								<div class="mb-3 ">
									<label for="exampleFormControlInput1" class="form-label">작성자</label>
									<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="관리자" name="no" readonly>
								</div>
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">글제목</label>
									<input type="text" class="form-control" id="exampleFormControlInput1" name="btitle" value="<%=dto.getBtitle() %>">
								</div>
								<div class="mb-3">
									<label for="exampleFormControlTextarea1" class="form-label">글내용</label>
									<textarea type="text" class="form-control" id="exampleFormControlTextarea1" style="height: 300px;" rows="3" name="bcontent"><%=dto.getBcontent() %></textarea>
								</div>
							</div>
							</table>
							<input type="submit" class="botann" style="right: 55px; bottom: -35px;" value="글수정">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>