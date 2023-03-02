<%@page import="products.SalesDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="products.SalesDTO"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>
<%@page import="member.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="products.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<head>
<meta charset="UTF-8">
<title>섬집</title>
<style type="text/css">
	.wrap {
		font-family: 'NanumSquareNeo';
		max-width: 800px;
		height: 800px;
		margin: 0 auto;
		padding: 20px;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		box-sizing: border-box;
	}
	
	#myList {
		margin-left: 130px;
	}
 	
 	#myList h3 {
 		font-family: 'NanumSquareNeoBold';
		margin: 10px;
 	}
 	
 	#myList h5 {
 		font-family: 'NanumSquareNeoBold';
		margin: 10px;
		text-align: center;
 	}
 	
 	#myList ul {
 		margin: 50px 0px 40px 0px;
 	}
 	
 	#myList ul li {
 		list-style: none;
 		text-align: center;
 	}

	#myList #hrefImg {
		float: left;
		opacity: 1;
		-webkit-transition: .3s ease-in-out;
		transition: .3s ease-in-out;
	}
	#myList #hrefImg:hover {
	  	opacity: .5;
	}
	
 	#myList #timecheck {
 		margin: 10px 20px 15px 10px;
 	}
 	
 	#myList ul button {
 		margin-top: 10px;
 	}
 	
 	#myList ul #btns {
 		width: 150px;
        margin: 0 auto;
 	}
 	
 	footer {
 		padding-top: 50px;
 	}
 	
</style>
</head>

<body>
<%
	// 아이디 세션 값
	String id = (String)session.getAttribute("id");
	
	// 예약정보
	ArrayList<AppointmentDTO> userappointmentlist = (ArrayList<AppointmentDTO>)request.getAttribute("userappointmentlist");
	
	// 페이징
	int currentPage = (Integer)request.getAttribute("currentPage");
	int startPage = (Integer)request.getAttribute("startPage");
	int pageBlock = (Integer)request.getAttribute("pageBlock");
	int endPage = (Integer)request.getAttribute("endPage");
	int pageCount = (Integer)request.getAttribute("pageCount");
%>
<!-- header -->
<header>
	<jsp:include page="../inc/my_header.jsp" />
</header>

<div class="wrap">
	<form name="myListForm.me" id="myList" method="get">
	<h3>내 이용 내역</h3>
<% 
	// 예약 내역 확인
	if(userappointmentlist.size() == 0) {
		%>
		<p>예약된 내역이 없습니다.</p>
		<%
	} else {
		
	for(int i = 0 ; i < userappointmentlist.size(); i++){
		
		// 예약정보 - 펜션이름, 체크인 / 체크아웃 시간
		AppointmentDTO adto = userappointmentlist.get(i);
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(adto.getPno());
		
		String housePic = pdto.getPpic1();	// 펜션 대표 이미지
		String houseName = pdto.getPname(); // 펜션 이름
		String houseInTime = pdto.getCheckin(); // 체크인 시간
		String houseOutTime = pdto.getCheckout(); // 체크아웃 시간
		
		// 체크인 / 체크아웃 날짜
		SalesDAO salesdao = new SalesDAO();
		SalesDTO salesdto = salesdao.getSalesAno(adto.getAno());
		
		String appointIndateSt = salesdto.getIndate(); // 체크인 날짜
		String appointOutdateSt = salesdto.getOutdate(); // 체크아웃 날짜

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date appointIndate = format.parse(appointIndateSt);
		Date appointOutdate = format.parse(appointOutdateSt);
		
		
		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date(formatter.parse(todayfm).getTime()); // 오늘 날짜
		
		// 예약일자 포맷 변경
		Date date = adto.getAdate();
		LocalDate appointdate = LocalDate.ofInstant(date.toInstant(), ZoneId.systemDefault()); // 예약일자
		
	%>
	<ul>
		<hr>
		<li id="hrefImg"><a href="ProductContent.pr?pno=<%=adto.getPno() %>" data-toggle="tooltip" title="후기 보러가기">
			<img src="upload/<%=housePic %>" width="150" height="150"></a></li>
		<li>예약일자 : <%=appointdate %></li>
		<h5><%=houseName %></h5>
		<li id="timecheck">체크인 <%=format.format(appointIndate) %> <%=houseInTime.substring(0, 2) %>시 <%=houseInTime.substring(3) %>분</li>
		<li id="timecheck">체크아웃 <%=format.format(appointOutdate) %> <%=houseOutTime.substring(0, 2) %>시 <%=houseOutTime.substring(3) %>분</li>
		
		
		<!-- 후기 작성 여부 확인 후 버튼 활성화 -->
		<%			
		ReviewDAO rdao = new ReviewDAO();
		
		int resultIn = appointIndate.compareTo(today);
		int resultOut = appointOutdate.compareTo(today);
		
		if(id != null) {
			// 후기 작성 여부 확인, true = 후기 작성 O
			if(rdao.checkReview(adto.getAno()) == true) {
				// 입실일이 지나면 예약완료 상태로 갈음
				if(resultIn < 0) {
					System.out.println("appointIndate is before today");
					
					if(resultOut > 0) {
						// 퇴실일 지나기전 후기 작성 불가
						System.out.println("appointOutdate is after today");
					} else if(resultOut <= 0){
						// 후기를 작성하였으므로 수정, 삭제만 가능
						System.out.println("appointOutdate is before today");
						%>
						<li><button type="button" id="btns" class="btn btn-outline-success" onclick="location.href='MemberReviewModifyForm.me?ano=<%=adto.getAno()%>'">후기 수정하기</button>
							<button type="button" id="btns" class="btn btn-outline-secondary" onclick="location.href='MemberReviewDelete.me?ano=<%=adto.getAno()%>'">후기 삭제하기</button></li>
						<%
					}
				}
			} else {
				// rdao.checkReview(no, adto.getPno()) == false
				// false = 후기 작성 X
				if(resultIn < 0) {
					System.out.println("appointIndate is before today");
					
					if(resultOut > 0) {
						// 퇴실일 지나기전 후기 작성 불가
						System.out.println("appointOutdate is after today");
					} else if(resultOut <= 0){
						// 후기 작성 가능
						System.out.println("appointOutdate is before today");
						%>
						<li><button type="button" id="reviewBtn" class="btn btn-outline-success" onclick="location.href='MemberReview.me?ano=<%=adto.getAno()%>&pno=<%=adto.getPno()%>'">이용 후기 작성하기</button></li>
						<%
					}
				}
			} // rdao.checkReview(no, adto.getPno()) 
		} else {
			%>
 			<script type="text/javascript">
   				alert("로그인을 해주세요");
 			</script>
			<%
			response.sendRedirect("MemberLogin.me");
		} %>
	</ul> <% // id 확인 메서드
	
	} // userappointmentlist
	
	} // 예약 내역 확인 if 문
%>

	<div class="room-pagination">
<% 
	// 페이징
	if(startPage > pageBlock) {
		%>
		<a href="MemberMyList.me?pageNum=<%=startPage-pageBlock%>">[5 페이지 이전]<i class="fa fa-long-arrow-right"></i></a>
		<%
	}
	
	for(int i = startPage; i <= endPage; i++) {
		%>
		<a href="MemberMyList.me?pageNum=<%=i%>"><%=i %></a>
		<%
	}
	
	if(endPage < pageCount) {
		%>
		<a href="MemberMyList.me?pageNum=<%=startPage+pageBlock%>">[5 페이지 다음]<i class="fa fa-long-arrow-right"></i></a>
		<%
	}
%>
	</div>
	</form>
</div>


<!-- footer -->
<footer>
	<jsp:include page="../inc/footer.jsp" />
</footer>

</body>
</html>