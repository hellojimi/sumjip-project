<%@page import="java.util.Date"%>
<%@page import="products.OwnerAppointmentDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="products.SalesDTO"%>
<%@page import="products.SalesDAO"%>
<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.AppointmentDAO"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<head>
<meta charset="UTF-8">
<title>섬집</title>
<style type="text/css">
#sidebar {
	width: 250px;
	height: 500px;
	float: left;
}

.ownerart {
	font-family: 'NanumSquareNeo';
	width: 1000px;
	padding-left: 50px;
	margin-bottom: 300px;
	margin-left: 200;
}

.table thead.thead-primary {
	background: #99b19c;
	font-weight: bold;
	color: #FFFFFF;
}

.heading-section {
	font-size: 28px;
	color: #393939;
	height: 30px;
	font-weight: 400;
	font-family: "Poppins", Arial, sans-serif;
	font-weight: bold;
	text-align: center;
}

.table td.a {
	color: #22741C;
	font-weight: bold;
}

.res {
	height: 80px;
}
</style>
</head>
<body>

	<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/my_header.jsp" />
	<!-- 헤더들어가는 곳 -->


	<%
	String id = (String) session.getAttribute("id"); //id 세션값 불러오기 

	ArrayList<OwnerAppointmentDTO> OwnerAppointmentList = (ArrayList<OwnerAppointmentDTO>) request.getAttribute("OwnerAppointmentList");
	
	UserDTO udto = (UserDTO) request.getAttribute("udto"); // 로그인 한 사람 정보
	
	// 페이징
	int startPage = (Integer) request.getAttribute("startPage");
	int pageBlock = (Integer) request.getAttribute("pageBlock");
	int endPage = (Integer) request.getAttribute("endPage");
	int pageCount = (Integer) request.getAttribute("pageCount");
	%>


	<div id="wrap">
		<article class="ownerart">
			<div class="res">
				<div class="col-lg-12">
					<h3 class="heading-section">My Pension Reservation</h3>
					<br>
				</div>
			</div>
			<div>
				<table class="table">
					<thead class="thead-primary">
						<!-- 	 내 펜션 예약 리스트 -->
						<tr>
							<td>펜션명</td>
							<td>예약자명</td>
							<td>연락처</td>
							<td>예약상태</td>
							<td>입실일</td>
							<td>퇴실일</td>
							<td>총금액</td>
							<td>예약일</td>
						</tr>
					</thead>
					<%
					for (int i = 0; i < OwnerAppointmentList.size(); i++) {
						//배열 한칸에 내용 가져오기 
						OwnerAppointmentDTO oadto = OwnerAppointmentList.get(i);
						UserDAO adao = new UserDAO();
						UserDTO audto = adao.getUserNo(oadto.getAuser());

						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						Date Outdate = format.parse(oadto.getOutdate());
						String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
						Date today = new Date(formatter.parse(todayfm).getTime()); // 오늘 날짜
						int resultOut = Outdate.compareTo(today);
					%>
					<tr>
						<td><a href="ProductContent.pr?pno=<%=oadto.getPno()%>"><%=oadto.getPname()%></a></td>
						<td><%=audto.getUname()%></td>
						<td><%=audto.getTel()%></td>
						<td class="a">
							<%
							if (oadto.getAstatus() == 1) {
								out.print("입금대기");
							} else if (oadto.getAstatus() == 2) {
								out.print("입금확인");
							} else if (oadto.getAstatus() == 3) {
								if (resultOut < 0) {
									out.print("숙박완료");
								} else {
									out.print("예약완료");
								}
							}
							%>
						</td>

						<td><%=oadto.getIndate()%></td>
						<td><%=oadto.getOutdate()%></td>
						<td><script type="text/javascript">
							var num = <%=oadto.getSprice()%>;
							document.write(num.toLocaleString() + "원");
						</script></td>
						<td><%=oadto.getSdate()%></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>

			<%
			if (startPage > pageBlock) {
			%>
			<a
				href="ProductOwnerAppointManage.pr?pageNum=<%=startPage - pageBlock%>">[10페이지 이전]</a>
			<%
			}
			%>
			<div class="room-pagination">
				<%
				for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="ProductOwnerAppointManage.pr?pageNum=<%=i%>"><%=i%></a>
				<% } %>
			</div>
			<%
			// //10페이지 다음
			if (endPage < pageCount) {
			%>
			<a href="ProductAppointManage.pr?pageNum=<%=startPage + pageBlock%>">[10페이지 다음]</a>
			<%
			}
			%>
		</article>
	</div>

	<!-- <!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- <!-- 푸터 들어가는 곳 -->

</body>
</html>