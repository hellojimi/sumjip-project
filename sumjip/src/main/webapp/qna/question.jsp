<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>섬집</title>
<style>
article{
	font-family: 'NanumSquareNeo';
  	max-width: 300px;
 	margin: 0 auto;
 	padding: 20px;
 	margin-bottom: 70px;
}

.heading-section {
    font-size: 28px;
    color: #393939;
    line-height: 1.5;
    font-weight: 400;
    font-family: "Poppins", Arial, sans-serif;
    font-weight: bold;
    text-align: center;
    margin: 25px;      
}

.tt{
background-color: #99b19c;
text-align: center;
width: 180px;
}

.co{
 height: 300px;
}

.tt2{
text-align: center;
background-color: white;
}

.btn-group{
	float: left;
}

.btn-group2{
float: right;
}

#table_search{
	float: right;  
}
</style>
</head>


<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->
<%

// request에 저장된 qno 파라미터값 가져오기
// int qno=Integer.parseInt(request.getParameter("qno"));
// // QnaDAO 객체생성
// QnaDAO qdao=new QnaDAO();
// qdao.qCo unt(qno);

// // QnaDTO dto = dao.getQna(no) 메서드 호출
// QnaDTO qdto = qdao.getQna(qno);  
// // 세션값 가져오기
String id=(String)session.getAttribute("id");
// int no=qdto.getNo();
// UserDAO udao = new UserDAO();
// UserDTO udto = udao.getUserNo(no);
// int status=qdto.getQstatus();
QnaDTO qdto = (QnaDTO)request.getAttribute("qdto");
UserDTO udto = (UserDTO)request.getAttribute("udto");
int qno=(Integer)request.getAttribute("qno");
%>
<article>
<div class="container">
<h3 class="heading-section">question</h3>
<table class="table">

	<tr><td class="tt">글번호</td><td class="tt2"><%=qdto.getQno() %></td></tr>
	<tr><td class="tt">작성자</td><td class="tt2"><%=udto.getId() %></td></tr>
	<tr><td class="tt">글쓴날짜</td><td class="tt2"><%=qdto.getQdate() %></td></tr> 
	<tr><td class="tt">조회수</td><td class="tt2"><%=qdto.getQcount() %></td></tr>
	<tr><td class="tt">글제목</td><td class="tt2"><%=qdto.getQtitle() %></td></tr>
	<tr class="co"><td class="tt">글내용</td><td class="tt2"><%=qdto.getQcontent() %></td></tr>
	<tr><td colspan="2">
	<%
	// 로그인 => 세션값 있음
	if(id!=null){ //id!=null => 세션값이 있다는 뜻
		// 글쓴이,세션값 => 일치 => 자기자신이 쓴 글(글수정, 글삭제 보이기)
		if(id.equals(udto.getId())){
	%>

  <button type="button" class="btn btn-outline-secondary" onclick="location.href='QuestionUpdateForm.qa?qno=<%=qdto.getQno() %>'">글수정</button>
  <button type="button" class="btn btn-outline-secondary" onclick="location.href='QuestionDelete.qa?qno=<%=qdto.getQno() %>'">글삭제</button>


	<%
		}
	}
	%>

	<button type="button" class="btn btn-outline-secondary" onclick="location.href='QnaList.qa'">글목록</button>	

<!-- 답변이 있을때만 답변확인버튼 보이게 -->
	<%
	if(qdto.getQstatus()==0){
		
	%>
<div id="table_search">
	<button type="button" class="btn btn-success" onclick="location.href='QnaAnswer.qa?qno=<%=qdto.getQno() %>'">답변확인</button>
</div>	
	<%
		}	
	%>

	</td></tr>

</table>
</div>
</article>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
</body>
</html>