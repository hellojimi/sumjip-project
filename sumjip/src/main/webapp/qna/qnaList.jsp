<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<head>
<meta charset="UTF-8">
<title>섬집</title>

<script type="text/javascript" src="script/jquery-3.6.3.js"></script>

<style>
article {
	font-family: 'NanumSquareNeo';
	max-width: 1000px;
	margin: 0 auto;
	padding: 50px;
}

.table thead.thead-primary {
	background: #99b19c;
	font-weight: bold;
	color: #FFFFFF;
}

.heading-section {
	font-size: 28px;
	color: #393939;
	line-height: 1.5;
	font-weight: 400;
	font-family: "Poppins", Arial, sans-serif;
	font-weight: bold;
	text-align: center;
	margin: 10px;
}

#table_search {
	float: right;
}

.table tr.qna:hover {
	background: #E1E1E1;
}
</style>

</head>
<body>

	<!-- 한페이지에 보여줄 글 개수 -->
	<%
	ArrayList<QnaDTO> qnaList = (ArrayList<QnaDTO>) request.getAttribute("qnaList");
	int currentPage = (Integer) request.getAttribute("currentPage");
	int pageBlock = (Integer) request.getAttribute("pageBlock");
	int startPage = (Integer) request.getAttribute("startPage");
	int endPage = (Integer) request.getAttribute("endPage");
	int pageCount = (Integer) request.getAttribute("pageCount");

	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");

	String qstatus = "";
	%>

	<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/header.jsp" />
	<!-- 헤더들어가는 곳 -->

	<article>
		<div class="qnalistContainer">
			<h3 class="heading-section">Q&A</h3>
		</div>
		<table class="table">
			<thead class="thead-primary">
				<tr>
					<td>번호</td>
					<td>작성자</td>
					<td>제목</td>
					<td>질문일자</td>
					<td>답변상태</td>
					<td>조회수</td>
				</tr>
			</thead>

			<%
			//배열접근 => for => 배열 한칸에 내용 가져오기 => qnaDTO 저장 => 출력
			for (int i = 0; i < qnaList.size(); i++) {
				QnaDTO dto = qnaList.get(i);

				// 답변 상태
				if (dto.getQstatus() == 0) {
					qstatus = "답변완료";
				} else {
					qstatus = "답변미등록";
				}
			%>
			<tr class="qna">
				<td><%=dto.getQno()%></td>
				<%
				// id값 받아오기
				UserDAO qudao = new UserDAO();
				UserDTO qudto = qudao.getUserNo(dto.getNo());
				%>
				<td><%=qudto.getId()%></td>
				<td><a href="QnaQuestion.qa?qno=<%=dto.getQno()%>"><%=dto.getQtitle()%></a></td>
				<td><%=dateFormat.format(dto.getQdate())%></td>
				<td><%=qstatus%></td>
				<td><%=dto.getQcount()%></td>
			</tr>
			<%
			}
			%>
		</table>

		<!-- 페이징 -->
		<div class="col-lg-12">
			<div class="room-pagination">
				<div id="table_search">
					<button type="button" class="btn btn-outline-success" value="글쓰기"
						onclick="location.href='QuestionWriteForm.qa'">글쓰기</button>
					<br>
				</div>
				<%
				// 10페이지 이전
				if (startPage > pageBlock) {
					%>
					<a href="QnaList.qa?pageNum=<%=currentPage - pageBlock%>">[10페이지 이전] <i class="fa fa-long-arrow-right"></i>
					</a>
					<%
				}

				for (int i = startPage; i <= endPage; i++) {
					%>
					<a href="QnaList.qa?pageNum=<%=i%>"><%=i%></a>
					<%
				}

				// 10페이지 다음
				if (endPage < pageCount) {
					%>
					<a href="QnaList.qa?pageNum=<%=startPage + pageBlock%>">[10페이지 다음] <i class="fa fa-long-arrow-right"></i>
					</a>
					<%
				}
				%>
			</div>
		</div>
	</article>

	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/footer.jsp" />
	
</body>
</html>