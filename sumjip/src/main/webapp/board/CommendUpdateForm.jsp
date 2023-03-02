<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="board.CommendDTO"%>
<%@page import="board.CommendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대댓글 수정</title>
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
    <link rel="stylesheet" href="css/list.css" type="text/css">
    <link rel="stylesheet" href="css/insert.css" type="text/css">
    <link rel="stylesheet" href="css/mainList.css" type="text/css">
    <link rel="stylesheet" href="css/admain.css" type="text/css" >
    
</head>
<body>
<%
//String id=(String)session.getAttribute("id");
//UserDAO dao = new UserDAO();
//UserDTO dto = dao.getUser(id);
//int no = dto.getNo();

// int bno=1; // 임시값
// int no=1; // 임시값


// int cno=Integer.parseInt(request.getParameter("cno"));
// CommendDAO cdao=new CommendDAO();
// CommendDTO cdto=cdao.getCommend(cno);

// int cuno=Integer.parseInt(request.getParameter("no"));

// UserDAO dao = new UserDAO();
// UserDTO dto = dao.getUserNo(cuno);
// String id = dto.getId();

String id=(String)session.getAttribute("id");
CommendDTO cdto = (CommendDTO)request.getAttribute("cdto");
%>

<!-- 헤더 들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />


<!-- 답댓글 수정 폼 -->
<article>
   <section class="blog-details-section">
        <div class="conainer">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="blog-details-text">
                       <div class="leave-comment">
                            <h4>답댓글 수정</h4>
                            <form action="BoardCommendUpdatePro.bo" method ="post" class="comment-form">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" value="<%=id%>" readonly>
										<input type="hidden" name="bno" value="<%=cdto.getBno()%>">
										<input type="hidden" name="cno" value="<%=cdto.getCno()%>">
                                    </div>
                                    <div class="col-lg-12 text-center">
                                        <textarea name="commend"><%=cdto.getCommend() %></textarea>
                                        <button type="submit" class="site-btn">답댓글 수정</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
             </section>
		</article>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
</body>
</html>