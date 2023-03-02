<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>섬집</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/table.css" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
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
    
    
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    
</head>

<body>
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
                                <img src="img/islandzip3.png" alt="">
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

