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
	
	
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
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
    <link rel="stylesheet" href="css/admain.css" type="text/css" >
    
	<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
    
    
    
    <link rel="stylesheet" href="css1/bootstrap.css">
    <link rel="stylesheet" href="vendors/linericon/style.css">
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="css1/font-awesome.min.css">
    <link rel="stylesheet" href="css1/styles.css">
    <link rel="stylesheet" href="css1/style.css">
    <link rel="stylesheet" href="css1/responsive.css">
    
    <script src="js1/jquery-3.2.1.min.js"></script>
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
    
     <script src="js1/jquery-3.3.1.min.js"></script>
    <script src="js1/bootstrap.min.js"></script>
    <script src="js1/jquery.magnific-popup.min.js"></script>
    <script src="js1/jquery.nice-select.min.js"></script>
    <script src="js1/jquery-ui.min.js"></script>
    <script src="js1/jquery.slicknav.js"></script>
    <script src="js1/owl.carousel.min.js"></script>
    <script src="js1/main.js"></script>
    <script src="js1/jquery-3.2.1.min.js"></script>
    <script src="js1/popper.js"></script>
    <script src="js1/bootstrap.min.js"></script>
    
<title>Insert title here</title>

<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
</script>
</head>
<body>

<header class="header-section">
         <div class="container">
             <div class="row">
                 <div class="col-lg-6">
                     <a href="AdminMain.ad"><b class="adminLogo">Admin Page</b></a>
                     
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
		                     <a style="color:black;" href="AdminLogout.ad">Logout</a> | 
		                     <a style="color:black;" href="Main.me">섬집</a>
		                  </div>
		                  <%
		                  }
		                  %>
               		</div>
                </div>
            </div>
        </div>
    <!-- Backgrounds -->
       <div class="row">
           <div class="col-lg-2">
	            <div class="sidenav">   
	               <a href="AdminUserList.ad">유저관리</a>
	               <a href="AdminAppointNow.ad">숙소예약현황</a> 
	               <a href="AdminQnaList.ad">Q&A 관리</a> 
	               <button class="dropdown-btn">공지사항
	                  <i class="fa fa-caret-down"></i>
	               </button>
	               <div class="dropdown-container">
	                  <a href="AdminBoardList.ad">공지사항 리스트</a>
	                  <a href="AdminBoardWriteForm.ad">공지사항 작성</a>
	               </div> 
	            </div>
         </div>
      </div>
      
	
	
	
	
</header>
    <!-- Header End -->
