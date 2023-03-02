<%@page import="board.CommendDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="board.ReplyDTO"%>
<%@page import="board.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글수정</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
	<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
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
    <link rel="stylesheet" href="css/insert.css" type="text/css" >
 

</head>
<body>
<%

//UserDAO dao = new UserDAO();
//UserDTO dto = dao.getUser(id);
//int no = dto.getNo();

// int bno=1; // 임시값
// int no=1; // 임시값
// UserDAO dao = new UserDAO();
// UserDTO dto = dao.getUserNo(no);
// String id = dto.getId();

// int rno=Integer.parseInt(request.getParameter("rno"));

String id=(String)session.getAttribute("id");
int no =(Integer)request.getAttribute("no");
int bno =(Integer)request.getAttribute("bno");
int rno =(Integer)request.getAttribute("rno");

%>

<!-- 헤더 들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />


<!-- 답댓글 작성 폼 -->
<article>
   <section class="blog-details-section">
        <div class="conainer">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="blog-details-text">
                       <div class="leave-comment">
                            <h4>답댓글 작성</h4>
                            <form action="BoardCommentInsert.bo" method ="post" class="comment-form">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" value="<%=id%>" readonly>
                                        <input type="hidden" name="no" value="<%=no%>">
										<input type="hidden" name="bno" value="<%=bno%>">
										<input type="hidden" name="rno" value="<%=rno%>">
                                    </div>
                                    <div class="col-lg-12 text-center">
                                        <textarea name="commend" placeholder="답댓글을 입력하세요"></textarea>
                                        <button type="submit" class="site-btn">답댓글 쓰기</button>
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

