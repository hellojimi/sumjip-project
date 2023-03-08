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
	height: 700px;
	float: left;
}

.art {
	font-family: 'NanumSquareNeo';
	width: 900px;
	height: 700px;
	padding-left: 100px;
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

.count {
	float: right;
}

.res {
	height: 150px;
}
</style>
</head>
<body>
	<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/my_header.jsp" />
	<!-- 헤더들어가는 곳 -->


	<%
	String id = (String) session.getAttribute("id"); //id 세션값 불러오기 

	ArrayList<AppointmentDTO> AppointmentList = (ArrayList<AppointmentDTO>) request.getAttribute("AppointmentList");

	int startPage = (Integer) request.getAttribute("startPage");
	int pageBlock = (Integer) request.getAttribute("pageBlock");
	int endPage = (Integer) request.getAttribute("endPage");
	int pageCount = (Integer) request.getAttribute("pageCount");

	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
	%>
	
	<div id="wrap">
		<article class="art">
			<div class="res">
				<div class="col-lg-12">
					<h3 class="heading-section">Reservation</h3>
					<br> <a class="count">계좌번호 : 아이티윌뱅크 72402170917<br>
						예금주 : (주)섬집
					</a>
				</div>
			</div>
			<div>
				<table class="table">
					<thead class="thead-primary">
						<!-- 	 로그인한 사용자의 예약 리스트와 예약취소 -->
						<tr>
							<td>예약번호</td>
							<td>펜션명</td>
							<td>예약상태</td>
							<td>예약일자</td>
							<td>총 금액</td>
							<td>예약취소</td>
						</tr>
					</thead>
					<%
					for (int i = 0; i < AppointmentList.size(); i++) {
						//배열 한칸에 내용 가져오기 
						AppointmentDTO adto = AppointmentList.get(i);

						ProductDAO pdao = new ProductDAO();
						ProductDTO pdto = pdao.getProduct(adto.getPno());
						SalesDAO sdao = new SalesDAO();
						SalesDTO sdto = sdao.getSalesAno(adto.getAno());
					%>
					<tr>
						<td><%=adto.getAno()%></td>
						<td><%=pdto.getPname()%></td>
						<td class="a">
							<%
							if (adto.getAstatus() == 1) {
								out.print("입금대기");
							} else if (adto.getAstatus() == 2) {
								out.print("입금확인");
							} else if (adto.getAstatus() == 3) {
								out.print("예약완료");
							}
							%>
						</td>
						<td><%=dateFormat.format(adto.getAdate())%></td>
						<td><script type="text/javascript">
							var num = <%=sdto.getSprice()%>;
							document.write(num.toLocaleString() + "원");
						</script> /<%=sdto.getSprice() / pdto.getPprice()%>박</td>
						<td><button type="button" class="btn btn-outline-secondary"
								onclick="location.href='ProductAppointManagePro.pr?ano=<%=adto.getAno()%>'">Cancel</button></td>
					</tr>
					<% } %>
				</table>
			</div>

			<%
			if (startPage > pageBlock) {
			%>
			<a href="ProductAppointManage.pr?pageNum=<%=startPage - pageBlock%>">[10페이지 이전]</a>
			<%
			}
			%>
			<div class="room-pagination">
				<%
				for (int i = startPage; i <= endPage; i++) {
				%>

				<a href="ProductAppointManage.pr?pageNum=<%=i%>"><%=i%></a>
				<%
				}
				%>
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