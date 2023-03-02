<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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

<!--         main css -->
        <link rel="stylesheet" href="css1/style.css">
<!--    	 	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"> -->
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
<!--         Bootstrap CSS -->
        <link rel="stylesheet" href="css1/bootstrap.css">
        <link rel="stylesheet" href="vendors/linericon/style.css">
        <link rel="stylesheet" href="css1/font-awesome.min.css">
        <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="css1/style.css">
        
        <link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">

</head>

<body>
<div id="wrap">
<!-- 헤더들어가는 곳 (오류때문에 헤더에 있는거 직접 가져와서 수정함.) -->
<%
String Date=(String)request.getAttribute("Date");
LocalDate NDate =(LocalDate)request.getAttribute("NDate");
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
								String id=(String)session.getAttribute("id");
                            	UserDAO dao = new UserDAO();
                        		// MemberDTO dto = getMember(id) 메서드호출
                        		UserDTO dto = dao.getUser(id);

								if(id!=null){
									%>
										<div id="login">♥ <%=id %> 님 ♥ |
										<a href="MemberLogout.me">Logout</a>	|
										<a href="MemberMyPage_user.me">Mypage</a></div>
								 <%
								}else{
									%>
									<div id="login"><a href="MemberLogin.me">Login</a> |
													<a href="MemberAgree.me">Join</a></div>	
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
                            <a href="Main.me">
                                <img src="img/islandzip3.png"; alt="">
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
    <h3 class="search_name">언제, 어디로 떠날까요 ?</h3><br>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        
<!-- 						검색기능                         -->
<!--                          ================Banner Area ================= -->
       
            <div class="hotel_booking_area position">
                <div class="container">
                    <div class="hotel_booking-table">
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-9">
                            <div class="boking-table">
                                <div class="row">
                                    <div class="col-md-4">
                                    	<form action="Result.me" method="post">
                                    	<div class="book_tabel_item">
                                            <div class="form-group">  
                                                    <input type='date' name="indate" class="form-control" value="<%=Date%>"/>
                                            </div>
                                             <h5>∼</h5> 
                                            <div class="form-group">                                                                       
                                                    <input type='date' name="outdate" class="form-control" value="<%=NDate%>"/>
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
                                    <br>
                                      <input type="submit" class="mainsearch_button" value="검색">
                                     </form>
                                    </div>
                                   
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!--         ================Banner Area =================      -->
       
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 펜션 정보 리스트 -->
<jsp:include page="maindetail.jsp" />
    
<div class=topBtn onclick="window.scrollTo(0,0);">TOP ⇡</div>    
    
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
<!--     <section class="blog-section spad"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="section-title"> -->
<!--                         <span>Hotel News</span> -->
<!--                         <h2>Our Blog & Event</h2> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-4"> -->
<!--                     <div class="blog-item set-bg" data-setbg="../img/blog/blog-1.jpg"> -->
<!--                         <div class="bi-text"> -->
<!--                             <span class="b-tag">Travel Trip</span> -->
<!--                             <h4><a href="#">Tremblant In Canada</a></h4> -->
<!--                             <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!-- 			</div> -->
<!--       	</div> -->
<!--     </section>           -->
                
    <!-- Blog Section End -->

    
     
<!-- Optional JavaScript -->

        <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
<!--     <script src="js/bootstrap.min.js"></script> -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <!--         jQuery first, then Popper.js, then Bootstrap JS -->
<!--         <script src="js1/jquery-3.2.1.min.js"></script> -->
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
<jsp:include page="../inc/footer.jsp" />
</div>
</body>
</html>