<%@page import="java.time.LocalDate"%>
<%@page import="products.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Sona Template">
<meta name="keywords" content="Sona, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>섬집</title>

<!-- main css -->
<link rel="stylesheet" href="css1/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/flaticon.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/list.css" type="text/css">
<link rel="stylesheet" href="css/insert.css" type="text/css">
<link rel="stylesheet" href="css/mainList.css" type="text/css">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css1/bootstrap.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="css1/font-awesome.min.css">
<link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="css1/style.css">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">

<style type="text/css">
.container div .ri-text {
	width: 360px;
	height: 345px;
}

.container div .tableDetail {
	width: 306px;
	height: 150px;
}
</style>
</head>

<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 (오류때문에 헤더에 있는거 직접 가져와서 수정함.) -->
		<%
		String Date = (String) request.getAttribute("Date");
		LocalDate NDate = (LocalDate) request.getAttribute("NDate");
		%>
		<header class="header-section">
			<div class="top-nav">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<ul class="tn-left">
							</ul>
						</div>
						<div class="col-lg-6">
							<div class="tn-right">
								<%
								String id = (String) session.getAttribute("id");
								UserDAO dao = new UserDAO();
								UserDTO dto = dao.getUser(id);

								if (id != null) {
									%>
									<div id="login">
										♥<%=id%>님♥ | <a href="MemberLogout.me">Logout</a> | <a href="MemberMyPage_user.me">Mypage</a>
									</div>
									<%
								} else {
									%>
									<div id="login">
										<a href="MemberLogin.me">Login</a> | <a href="../member/agree.jsp">Join</a>
									</div>
									<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="menu-item">
				<div class="container">
					<div class="row">
						<div class="col-lg-2">
							<div class="logo">
								<a href="Main.me"> <img src="img/islandzip3.png" alt="">
								</a>
							</div>
						</div>
						<div class="col-lg-10">
							<div class="nav-menu">
								<nav class="mainmenu">
									<ul>
										<li><a href="Region1.me">제주시 펜션</a></li>
										<li><a href="Region2.me">서귀포시 펜션</a></li>
										<li><a href="Recommend.me">추천 펜션</a></li>
										<li><a href="BoardList.bo">공지사항</a></li>
										<li><a href="QnaList.qa">Q&A</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- Header End -->

		<!-- Breadcrumb Section Begin -->
		<div class="productsearch-section">
			<h3 class="search_name">추천 펜션</h3>
			<br>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb-text">
							<!-- 						검색기능                         -->
							<!--    ================Banner Area =================      -->

							<div class="hotel_booking_area position">
								<div class="container">
									<div class="hotel_booking-table">
										<div class="col-md-3"></div>
										<div class="col-md-9">
											<div class="boking-table">
												<div class="row">
													<div class="col-md-4">
														<form action="Result.me" method="post">
															<div class="book_tabel_item">
																<div class="form-group">
																	<input type='date' name="indate" class="form-control" value="<%=Date%>" />
																</div>
																<h5>~</h5>
																<div class="form-group">
																	<input type='date' name="outdate" class="form-control" value="<%=NDate%>" />
																</div>
															</div>
													</div>
													<div class="col-md-4">
														<div class="input-group">
															<select class="wide" name="guest">
																<option value="0">인원수</option>
																<option value="1">1명</option>
																<option value="2">2명</option>
																<option value="3">3명</option>
																<option value="4">4명</option>
																<option value="5">5명</option>
																<option value="6">6명</option>
																<option value="7">7명</option>
																<option value="8">8명</option>
																<option value="9">9명</option>
															</select>
														</div>
														<br>
														<div class="input-group">
															<select class="wide" name="region">
																<option value="시">지역 선택</option>
																<option value="서귀포시">서귀포시</option>
																<option value="제주시">제주시</option>
															</select>
														</div>
													</div>
													<div class="col-md-4">
														<br> <input type="submit" class="mainsearch_button"
															value="검색">
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%
		ArrayList<ProductDTO> ProductList = (ArrayList<ProductDTO>) request.getAttribute("ProductList");
		int currentPage = (Integer) request.getAttribute("currentPage");
		int startPage = (Integer) request.getAttribute("startPage");
		int pageBlock = (Integer) request.getAttribute("pageBlock");
		int endPage = (Integer) request.getAttribute("endPage");
		int pageCount = (Integer) request.getAttribute("pageCount");
		%>
		
		<section class="rooms-section spad">
			<div class="container">
				<div class="row">
					<%
					for (int i = 0; i < ProductList.size(); i++) {
						//배열 한칸에 내용 가져오기 
						ProductDTO dto2 = ProductList.get(i);
					%>
					<div class="col-lg-4 col-md-6">
						<div class="room-item">
							<!--  펜션 사진들어 가는 곳 -->
							<!-- 사진없으면 샘플사진 뜨게 설정 -->
							<%
							if (dto2.getPpic1() == null) {
								%>
								<a href="ProductContent.pr?pno=<%=dto2.getPno()%>"><img src="upload/noimg.jpg" width="370px" height="240px"></a>
								<%
							} else {
								%>
								<a href="ProductContent.pr?pno=<%=dto2.getPno()%>"><img src="upload/<%=dto2.getPpic1()%>" width="370px" height="240px"></a>
								<%
							}
							%>
							<div class="ri-text">
								<a href="ProductContent.pr?pno=<%=dto2.getPno()%>"><h4><%=dto2.getPname()%></h4></a>
								<a href="ProductContent.pr?pno=<%=dto2.getPno()%>"><h3>
										<script type="text/javascript">
											var num = <%=dto2.getPprice()%>;
											document.write(num.toLocaleString() + "원");
										</script>
										<span>/1박</span>
									</h3></a>
								<table class="tableDetail">
									<tbody>
										<tr>
											<td class="r-o">주소 :</td>
											<td><%=dto2.getPaddress()%></td>
										</tr>
										<tr>
											<td class="r-o">체크인 :</td>
											<td><%=dto2.getCheckin().substring(0, 2)%>시 <%=dto2.getCheckin().substring(3)%>분</td>
										</tr>
										<tr>
											<td class="r-o">체크아웃:</td>
											<td><%=dto2.getCheckout().substring(0, 2)%>시 <%=dto2.getCheckout().substring(3)%>분</td>
										</tr>
									</tbody>
								</table>
								<!-- 	펜션 상세 정보 페이지로 이동   -->
								<a href="ProductContent.pr?pno=<%=dto2.getPno()%>" class="primary-btn">More Details</a>
							</div>
						</div>
					</div>
					<% } %>
					<div class="col-lg-12">
						<div class="room-pagination">
							<%
							if (startPage > pageBlock) {
								%>
								<a href="Recommend.me?pageNum=<%=startPage - pageBlock%>">[10페이지 이전]<i class="fa fa-long-arrow-right"></i>
								</a>
								<%
							}

							for (int i = startPage; i <= endPage; i++) {
								%>
								<a href="Recommend.me?pageNum=<%=i%>"><%=i%></a>
								<%
							}

							//10페이지 다음
							if (endPage < pageCount) {
								%>
								<a href="Recommend.me?pageNum=<%=startPage + pageBlock%>">[10페이지 다음] <i class="fa fa-long-arrow-right"></i>
								</a>
								<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</section>

		<div class=topBtn onclick="window.scrollTo(0,0);">TOP ⇡</div>
		<jsp:include page="../inc/footer.jsp" />

		<!-- Optional JavaScript -->

		<!-- Js Plugins -->
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/jquery.magnific-popup.min.js"></script>
		<script src="js/jquery.nice-select.min.js"></script>
		<script src="js/jquery-ui.min.js"></script>
		<script src="js/jquery.slicknav.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/main.js"></script>
		<script src="js1/popper.js"></script>
		<script src="js1/bootstrap.min.js"></script>
		<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
		<script src="js1/jquery.ajaxchimp.min.js"></script>
		<script src="js1/mail-script.js"></script>
		<script src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
		<script src="vendors/nice-select/js/jquery.nice-select.js"></script>
		<script src="js1/mail-script.js"></script>
		<script src="js1/stellar.js"></script>
		<script src="vendors/lightbox/simpleLightbox.min.js"></script>
		<script src="js1/custom.js"></script>
	</div>
</body>
</html>