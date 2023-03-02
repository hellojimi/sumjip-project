<%@page import="board.CommendDTO"%>
<%@page import="board.CommendDAO"%>
<%@page import="board.ReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<title>섬집 관리자 페이지</title>
<link rel="stylesheet" href="css/list.css" type="text/css">
<link rel="stylesheet" href="css/insert.css" type="text/css">
<link rel="stylesheet" href="css/mainList.css" type="text/css">
</head>
<body>
<!-- 헤더 들어가는 곳 -->
 	<jsp:include page="../inc/ad_header.jsp" />
 <!-- Backgrounds -->
	<div class="container">
    	<div class="row">	
			<div class="col-lg-12">
				<div class="content-main adminichi">			
					<%
					SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
					String id=(String)session.getAttribute("id");
					
					if(id==null){
						response.sendRedirect("AdminLogin.ad");
					}else if(id.equals("admin")){
					
					}else{
						%>
					<script type="text/javascript">
					alert("접근 권한이 없습니다.");
					history.back();
					</script>
					<%
					}
					int bno = (Integer)request.getAttribute("bno");
					int no = (Integer)request.getAttribute("no");
					int count = (Integer)request.getAttribute("count");
					ArrayList<ReplyDTO> replylist= (ArrayList<ReplyDTO>)request.getAttribute("replylist");
					BoardDTO dto=(BoardDTO)request.getAttribute("dto");
					%>
					<!-- 공지사항 내용 -->
					<h1 class="taitoru">Board Detail</h1>
					<div class="iro">
						<div class="row">
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-6 col-form-label">공지사항 번호</label>
						    <input type="text" class="form-control" placeholder="<%=dto.getBno() %>" aria-label="First name">
						  </div>
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-2 col-form-label">조회수</label>
						    <input type="text" class="form-control" placeholder="<%=dto.getBcount() %>" aria-label="Last name">
						  </div>
						</div>
						<div class="row" style="margin-top: 5px; margin-bottom: 20px;">
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-2 col-form-label">작성자</label>
						    <input type="text" class="form-control" placeholder="관리자" aria-label="First name">
						  </div>
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-3 col-form-label">작성날짜</label>
						    <input type="text" class="form-control" placeholder="<%=dateFormat.format(dto.getBdate()) %>" aria-label="Last name">
						  </div>
						</div>
					
						<div class="row mb-3">
							<label for="colFormLabel" class="col-sm-2 col-form-label">글제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="colFormLabel" placeholder="<%=dto.getBtitle() %>">
							</div>
						</div>
						<div class="row mb-3">
							<label for="colFormLabel" class="col-sm-2 col-form-label">글내용</label>
							<div class="col-sm-10">
								<textarea type="text" class="form-control" id="exampleFormControlTextarea1" style="height: 150px;" rows="3" placeholder="<%=dto.getBcontent() %>"></textarea>
							</div>
						</div>
					</div>
					<div class="peigingu">
						<input type="button" value="글목록"onclick="location.href='AdminBoardList.ad'" class="ppp">
						<% 
						// 로그인 => 세션값 있음
						if(id != null){
							// 세션값  , 글쓴이  => 일치 => 자기자신 쓴 글(글수정, 글삭제 보이기)
							if(id.equals("admin")){
								%>
						<input type="button" value="글수정" onclick="location.href='AdminBoardUpdateForm.ad?bno=<%=dto.getBno()%>'" class="ppp">
						<input type="button" value="글삭제" onclick="location.href='AdminBoardDeletePro.ad?bno=<%=dto.getBno()%>'" class="ppp">
						<%
							}
						}
						%>
					</div>
				<!-- 댓글 영역 들어가는 곳 -->
							
				<section class="blog-details-section">
        <div class="conainer">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="blog-details-text">
                       <div class="leave-comment">
<!-- 댓글쓰기 폼 -->
                            <h3 class="heading-section" style="padding-top: 45px;">Comment</h3>
                            <form action="AdminBoardReplyInsert.ad" class="comment-form">
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
									UserDTO udto = udao.getUserNo(rdto.getNo());
									%>
									<div><span><%=rdto.getRdate()%></span>
	                                <h5><%=udto.getId()%></h5>
	                                <p><%=rdto.getRiply()%></p>
	                                <a href="BoardCommendForm.bo?rno=<%=rdto.getRno()%>&bno=<%=bno%>"class="comment-btn">답댓글</a>
	                                <%if(no==rdto.getNo()){ %>
	                                <a href="BoardReplyUpdateForm.bo?rno=<%=rdto.getRno()%>"class="comment-btn">수정</a><%} %>
	                                <a href="AdminBoardReplyDeletePro.ad?rno=<%=rdto.getRno()%>" class="comment-btn">삭제</a></div>				
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
                                    <h5><%=udto.getId()%></h5>
                                    <p><%=cdto.getCommend()%></p>
                                    <%if(no==cdto.getNo()){ %>
                                    <a href="BoardCommendUpdateForm.bo?cno=<%=cdto.getCno()%>" class="comment-btn like-btn">수정</a><%} %>
                                    <a href="AdminBoardCommendDeletePro.ad?cno=<%=cdto.getCno()%>" class="comment-btn reply-btn">삭제</a>
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
				</div>
			</div>
		</div>
	</div>
 
<!--  푸터 들어가는 곳 -->
<%--  <jsp:include page="../inc/footer.jsp" /> --%>
 
</body>
</html>