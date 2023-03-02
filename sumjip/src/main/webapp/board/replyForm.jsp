<%@page import="board.CommendDTO"%>
<%@page import="board.CommendDAO"%>
<%@page import="board.ReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.ReplyDAO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">

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
<style type="text/css">

@font-face {
    font-family: 'Dovemayo_gothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

#me{
    font-family: 'Dovemayo_gothic';
	color:white;
	font-size: 11pt;
	background-color: #96A695;

	
}
</style>



</head>
<body>
<%
// int bno = Integer.parseInt(request.getParameter("bno"));
// // int bno=1; // 임시값
// String id=(String)session.getAttribute("id");
// UserDAO dao = new UserDAO();
// UserDTO dto = dao.getUser(id);
// int no = dto.getNo();

// // int no=1; // 임시값
// // String id="hong123"; // 임시값

// ReplyDAO rdao = new ReplyDAO();

// int count = rdao.countReply(bno); // 댓글 개수 계산

// ArrayList<ReplyDTO> replylist = rdao.getReplyList(bno);

// CommendDAO cdao = new CommendDAO();
String id=(String)session.getAttribute("id");
int bno = (Integer)request.getAttribute("bno");
int no = (Integer)request.getAttribute("no");
int count = (Integer)request.getAttribute("count");
ArrayList<ReplyDTO> replylist= (ArrayList<ReplyDTO>)request.getAttribute("replylist");
UserDTO sudto =(UserDTO)request.getAttribute("udto"); // 세션에 있는 회원 정보
%>
   <section class="blog-details-section">
        <div class="conainer">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="blog-details-text">
                       <div class="leave-comment">
<!-- 댓글쓰기 폼 -->
                            <h3 class="heading-section">Comment</h3>
                            <form action="BoardReplyInsert.bo" class="comment-form">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" value="<%=id%>" readonly>
                                    </div>
                                    <input type="hidden" name="bno" value="<%=bno%>" >
                                    <input type="hidden" name="no" value="<%=no%>" >
                                    <div class="col-lg-12 text-center">
                                        <textarea placeholder="댓글을 입력하세요" name="riply"></textarea>
                                        <button type="submit" class="site-btn">댓글 쓰기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="comment-option">
<!-- 댓글 갯수 -->
                            <h4><%=count%> Comments</h4> 

<!-- 댓글 리스트 -->                       
                            <div class="single-comment-item first-comment">                             
                                <div class="sc-text">
								<% for(int i=0;i<replylist.size();i++){ 
									ReplyDTO rdto = replylist.get(i);
									UserDAO udao = new UserDAO();
									UserDTO udto = udao.getUserNo(rdto.getNo()); // 댓글 회원 정보
									%>
									<div><span><%=rdto.getRdate()%></span>
	                                <h5><%=udto.getId()%>
	                                <%if(udto.getUtype()==2){ %>
	                                <span id="me">&nbsp;사장님&nbsp;</span><%
	                                }else if(udto.getUtype()==3){ %>
	                                <span id="me">&nbsp;관리자&nbsp;</span><%} %> 
	                                </h5>
	                                <p><%=rdto.getRiply()%></p>
	                                <a href="BoardCommendForm.bo?rno=<%=rdto.getRno()%>&bno=<%=bno%>"class="comment-btn">답댓글</a>
	                                <%if(no==rdto.getNo()){ %>
	                                <a href="BoardReplyUpdateForm.bo?rno=<%=rdto.getRno()%>"class="comment-btn">수정</a><%} %>
	                                <%
	                                if(no==rdto.getNo()||sudto.getUtype()==3){
	                                %>
	                                <a href="BoardReplyDeletePro.bo?rno=<%=rdto.getRno()%>" class="comment-btn">삭제</a><%} %></div>				
<!-- 대댓글 리스트 -->
									<%	
									CommendDAO cdao = new CommendDAO();
									ArrayList<CommendDTO> commendlist = cdao.getCommendList(rdto.getRno());
									for(int j=0;j<commendlist.size();j++){
										CommendDTO cdto = commendlist.get(j);
										if(rdto.getRno()==cdto.getRno()){
											udao = new UserDAO();
											udto = udao.getUserNo(cdto.getNo());
									if(j==0){%>
								<Br><div class="single-comment-item reply-comment"><%}%>
                                <div class="sc-text">
                                    <span><%=cdto.getCdate()%></span>
                                    <h5><%=udto.getId()%>
                                    <%if(udto.getUtype()==2){ %>
	                                <span id="me">&nbsp;사장님&nbsp;</span><%
	                                }else if(udto.getUtype()==3){ %>
	                                <span id="me">&nbsp;관리자&nbsp;</span><%} %> 
	                                </h5>
                                    <p><%=cdto.getCommend()%></p>
                                    <%if(no==cdto.getNo()){ %>
                                    <a href="BoardCommendUpdateForm.bo?cno=<%=cdto.getCno()%>" class="comment-btn like-btn">수정</a><%} %>
                                    <%
	                                if(no==cdto.getNo()||sudto.getUtype()==3){
	                                %>
                                    <a href="BoardCommendDeletePro.bo?cno=<%=cdto.getCno()%>" class="comment-btn reply-btn">삭제</a><%} %>
                                </div>
                                <%if(j==commendlist.size()-1){%>
                                </div>

										<%}}}} %>
                            
						        </div>  
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>