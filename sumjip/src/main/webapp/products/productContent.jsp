<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<head>
<meta charset="UTF-8">
<title>섬집</title>
</head>
<style>
	article{
		font-family: 'NanumSquareNeo';
	  	max-width: 1000px;
	 	margin: 0 auto;
	 	padding: 50px;
	}
	
	.heading-section {
	    font-size: 28px;
	    color: #393939;
	    line-height: 1.5;
	    font-weight: 400;
	    font-family: "Poppins", Arial, sans-serif;
	    font-weight: bold;
	    text-align: center;
	    margin: 25px;      
	}
	
	.tt{
	background-color: #99b19c;
	text-align: center;
	}
	
	.tt2{
	text-align: center;
	background-color: white;
	}
	
	#table_search{
		float: right;  
	}
	
	.heart{
		float: right;	
	}
</style>

<body>
<%
	// int pno=Integer.parseInt(request.getParameter("pno"));
	
	// ProductDAO dao=new ProductDAO();
	// ProductDTO dto=dao.getProduct(pno);
	// UserDTO udto=new UserDTO();
	
	String id=(String)session.getAttribute("id");
	
	// int pno = (Integer)request.getAttribute("pno");
	
	ProductDTO dto=(ProductDTO)request.getAttribute("dto");
	UserDTO udto=(UserDTO)request.getAttribute("udto");
%>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />

<!-- 상품리스트 부분 -->

<article>
<form action="MemberWishListPro.me" class="heart">
<input type="image" src="upload/green.jpg" alt="submit" width="30" height="30">
<input type="hidden" name="pno" value=<%=dto.getPno() %>>
<input type="hidden" name="button" value="찜">
</form>
<div class="container"></div>
<h3 class="heading-section"><%=dto.getPname() %> 펜션</h3>
 <div id="demo" class="carousel slide" data-ride="carousel">
   <div class="carousel-inner">
     <!-- 슬라이드 쇼 -->
     <div class="carousel-item active">
       <!--가로-->
       <img class="d-block w-100" src="upload/<%=dto.getPpic1() %>" alt="First slide">
     </div>
	<div class="carousel-item">
        <img class="d-block w-100" src="upload/<%=dto.getPpic2() %>" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="upload/<%=dto.getPpic3() %>" alt="Third slide">
    </div>
    <!-- / 슬라이드 쇼 끝 -->

    <!-- 왼쪽 오른쪽 화살표 버튼 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <!-- <span>Previous</span> -->
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <!-- <span>Next</span> -->
    </a>
    <!-- / 화살표 버튼 끝 -->
    
    <!-- 인디케이터 -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <!-- 인디케이터 끝 -->
  </div>
</div>

<%-- <img src="upload/<%=dto.getPpic1() %>" width="200" height="200"> --%>
<%-- <img src="upload/<%=dto.getPpic2() %>" width="200" height="200"> --%>
<%-- <img src="upload/<%=dto.getPpic3() %>" width="200" height="200"> --%>

<table class="table">
<tr><td class="tt">상품번호</td><td class="tt2"><%=dto.getPno() %></td></tr>
<tr><td class="tt">펜션이름</td><td class="tt2"><%=dto.getPname() %></td></tr>
<tr><td class="tt">펜션주소</td><td class="tt2"><%=dto.getPaddress() %></td></tr>
<tr><td class="tt">우편번호</td><td class="tt2"><%=dto.getPpostnum() %></td></tr>
<tr><td class="tt">상세주소</td><td class="tt2"><%=dto.getPaddress2() %></td></tr>
<tr><td class="tt">전화번호</td><td class="tt2"><%=dto.getPtel() %></td></tr>
<tr><td class="tt">체크인시간</td><td class="tt2"><%=dto.getCheckin() %></td></tr>
<tr><td class="tt">체크아웃시간</td><td class="tt2"><%=dto.getCheckout() %></td></tr>
<tr><td class="tt">가격</td><td class="tt2"><%=dto.getPprice() %></td></tr>
<tr><td class="tt">최대숙박인원</td><td class="tt2"><%=dto.getMax_men() %></td></tr>
<tr><td class="tt">숙소등록일</td><td class="tt2"><%=dto.getReser_date() %></td></tr>
<tr><td class="tt">주의사항</td><td class="tt2"><%=dto.getCaution() %></td></tr>
<tr><td class="tt">펜션설명</td><td class="tt2"><%=dto.getPexplain() %></td></tr>
<tr><td colspan="2">

<%
// 로그인 => 세션값 있음
UserDAO pudao = new UserDAO();
UserDTO pudto = pudao.getUserNo(dto.getNo()); // 상품 올린 user 정보 가져오기
if(id != null){
	// 세션값  , 글쓴이  => 일치 => 자기자신 쓴 글(글수정, 글삭제 보이기)
	if(id.equals(pudto.getId())){
		%>
		 <button type="button" class="btn btn-outline-secondary" 
		 		onclick="location.href='ProductUpdateForm.pr?pno=<%=dto.getPno() %>'">상품수정</button>	
		 <button type="button" class="btn btn-outline-secondary" 
		 		onclick="location.href='ProductDeletePro.pr?pno=<%=dto.getPno() %>'">상품삭제</button>
		<%
	}
}
%>
<button type="button" class="btn btn-outline-success" onclick="history.back()">상품목록</button>

<div id="table_search">
	<button type="button" class="btn btn-success" onclick="location.href='ProductAppointment.pr?pno=<%=dto.getPno() %>'">숙소예약</button>
</div>	


</td></tr>
</table>
</article>

<!-- 하단 리뷰 출력 -->
<jsp:include page="productReviewList.jsp" />
 
 <!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
</body>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
  <script>
    $('.carousel').carousel({
      interval: 2000 //기본 5초
    })
  </script>
  
</html>