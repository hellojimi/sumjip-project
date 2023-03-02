<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="member.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>섬집</title>
<style>
  	article {
  		font-family: 'NanumSquareNeo';
  		max-width: 750px;
 		margin: 0 auto;
 		padding: 20px;
  		box-sizing: border-box;
 	}
 	.heading {
	    font-size: 28px;
	    color: #393939;
	    line-height: 1.5;
	    font-weight: 400;
	    font-family: "Poppins", Arial, sans-serif;
	    font-weight: bold;
	    text-align: center;
	    margin: 10px; 
	     
	}
 	#reviewList {
 		padding: 20px;
 	}
 	
	#reviewList li {
		list-style: none;
	}
	article h4 {
		font-family: 'NanumSquareNeo';
		margin: 20px;
		display: inline-block;
		font-style: normal;
		color: #10620A;
		font-weight: bold;
	}
	#reviewList #stars {
		float: right;
		margin: 20px;
	}
	#reviewList .img {
 		margin: 20px 20px 10px 0px;
 		color : black;
        display: inline-block;
        
	}	
	#reviewList .hiddenImg {
 		margin: 0px 20px 10px 0px;
 		display: inline-block;
 		display: none;
	}	
	
	footer {
		padding-top: 50px;
	}
</style>
</head>

<body>
<%
	String id = (String)session.getAttribute("id");

	// 	해당 펜션 리뷰 리스트 출력
	ArrayList<ReviewDTO> reviewList = (ArrayList<ReviewDTO>)request.getAttribute("reviewList");
	
	int pno = Integer.parseInt(request.getParameter("pno"));
	
	ReviewDAO dao = new ReviewDAO();
	int getSumStar = dao.sumStar(pno);

	int currentPage = (Integer)request.getAttribute("currentPage");
	int startPage = (Integer)request.getAttribute("startPage");
	int pageBlock = (Integer)request.getAttribute("pageBlock");
	int endPage = (Integer)request.getAttribute("endPage");
	int pageCount = (Integer)request.getAttribute("pageCount");
%>
<div class="wrap">
	<article>
		<h2 class="heading">Reviews</h2>
<%
		// 작성된 리뷰 확인 
		if(reviewList.size() == 0) {
			%>
			<h4>작성된 리뷰가 없습니다.</h4>
			<%
		} else {
			
		for(int i = 0; i < reviewList.size(); i++) {
			ReviewDTO rdto = reviewList.get(i);
			
			double getAvgStar = getSumStar / reviewList.size(); 
			
			// 작성일자 포맷 변경
			Timestamp getDate = rdto.getRdate();
			LocalDate getDateFm =  getDate.toLocalDateTime().toLocalDate();

%>
		총 후기 개수 <%=reviewList.size() %> / 
		평균평점 <%=getAvgStar %> <img src="img/review/yellowStar.png" width="25" height="25">
		<!-- 후기 리스트  -->
		<ul id="reviewList">
			<img src="img/review/quote-left.png"> <h4><%=rdto.getRtitle() %></h4> <img src="img/review/get-quote.png">
			<li id="stars"><%=rdto.getRstar() %> 점
			<%
				String star = rdto.getRstar();
				int getStar = Integer.parseInt(star);
				for(int j = 1; j <= getStar; j++) {
					%>
					<img src="img/review/yellowStar.png" width="25" height="25">
					<%
				}
			%>
			</li>
			<%
			UserDAO rudao = new UserDAO();
			UserDTO rudto = rudao.getUserNo(rdto.getNo());
			String writer = rudto.getId();
			%>
			<li>작성자 : <%=writer %></li>
			<li>작성일자 : <%=getDateFm %></li>
			<li id="contents"><%=rdto.getRcontent() %></li>
			
			<!-- 사진 1이 없을 때 안보이게 하기 -->
			<% if(rdto.getRpic1() == null || rdto.getRpic1().equals("null") || rdto.getRpic1().equals("noimg.jpg")) { %>
				<li class="hiddenImg"><img src="upload/<%=rdto.getRpic1()%>" width="200" height="200"></li>
			<% } else { %>
				<li class="img"><img src="upload/<%=rdto.getRpic1()%>" width="200" height="200"></li>
			<% } %> 
			
			<!-- 사진 2가 없을 때 안보이게 하기 -->
			<% if(rdto.getRpic2() == null || rdto.getRpic2().equals("null") || rdto.getRpic2().equals("noimg.jpg")) { %>
				<li class="hiddenImg"><img src="upload/<%=rdto.getRpic2()%>" width="200" height="200"></li>
			<% } else { %>
				<li class="img"><img src="upload/<%=rdto.getRpic2()%>" width="200" height="200"></li>
			<% } %>
			
			<!-- 사진 3이 없을 때 안보이게 하기 -->
			<% if(rdto.getRpic3() == null || rdto.getRpic3().equals("null") || rdto.getRpic3().equals("noimg.jpg")) { %>
				<li class="hiddenImg"><img src="upload/<%=rdto.getRpic3()%>" width="200" height="200"></li>
			<% } else { %>
				<li class="img"><img src="upload/<%=rdto.getRpic3()%>" width="200" height="200"></li>
			<% } %>
		
		<% 
		try {
			if(id.equals(writer)) { %>
			<li><button type="button" id="btns" class="btn btn-outline-success" onclick="location.href='MemberReviewModifyForm.me?ano=<%=rdto.getAno()%>'">후기 수정하기</button>
				<button type="button" id="btns" class="btn btn-outline-secondary" onclick="location.href='MemberReviewDelete.me?ano=<%=rdto.getAno()%>'">후기 삭제하기</button></li>
		<% }
		} catch (Exception e) {
			e.printStackTrace();
		}%>
		
			</ul>
			<%
		} // for
		
		} // 작성리뷰 확인 if
		%>
	</article>

	<div class="room-pagination">
<%
	//페이징
	if(startPage > pageBlock) {
		%>
		<a href="ProductContent.pr?pageNum=<%=startPage-pageBlock%>&pno=<%=pno %>">[5 페이지 이전]<i class="fa fa-long-arrow-right"></i></a>
		<%
	}
	
	for(int i = startPage; i <= endPage; i++) {
		%>
		<a href="ProductContent.pr?pageNum=<%=i%>&pno=<%=pno %>"><%=i %></a>
		<%
	}
	
	if(endPage < pageCount) {
		%>
		<a href="ProductContent.pr?pageNum=<%=startPage+pageBlock%>&pno=<%=pno %>">[5 페이지 다음]<i class="fa fa-long-arrow-right"></i></a>
		<%
	}
%>
	</div>
	
</div>

<footer></footer>
	
</body>
</html>