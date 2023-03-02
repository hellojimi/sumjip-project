<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>

<%@page import="java.util.ArrayList"%>
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
<style>
#sidebar{
   width: 250px; 
   height: 500px;   
   float: left;
}
.prolist{
	font-family: 'NanumSquareNeo';
  	width:850px;
 	margin-left: 650px;
 	margin-top: 30px;
 	margin-bottom: 250px;
}

.table thead.thead-pri{
	background: #99b19c;
	font-weight: bold;
	color: #FFFFFF;	
	width: 500px;

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
#table_search{
	float: right;  
}
</style>
</head> 


<body>


<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/my_header.jsp" />
<!-- 헤더들어가는 곳 -->		

	
<!--  한페이지에 보여줄 글 개수 -->
<%

String id=(String)session.getAttribute("id");

ArrayList<ProductDTO> productList1 = (ArrayList<ProductDTO>)request.getAttribute("productList1");
int currentPage =(Integer)request.getAttribute("currentPage");
int pageBlock =(Integer)request.getAttribute("pageBlock");
int startPage =(Integer)request.getAttribute("startPage");
int endPage =(Integer)request.getAttribute("endPage");
int pageCount =(Integer)request.getAttribute("pageCount");

%>
<article class="prolist">
<div class="qnalistContainer">
<!-- 글쓰기 버튼 부분 -->
<h3 class="heading-section">My Pension List</h3>
</div>
<!-- 펜션리스트 부분 -->
<table class="table">
<thead class="thead-pri">
<tr><td>상품번호</td>
	<td>펜션이름</td>
	<td>펜션주소</td>
	<td>상세주소</td>
    <td>가격</td>
    <td>펜션설명</td>
    </tr></thead>
   
<%
for(int i=0; i<productList1.size(); i++){
	ProductDTO dto=productList1.get(i);
%>
    <tr><td><%=dto.getPno() %></td>
    <td>
    <a href="ProductContent.pr?pno=<%=dto.getPno()%>">
    <%=dto.getPname() %>
    </a></td>
    <td><%=dto.getPaddress() %></td>
    <td><%=dto.getPaddress2() %></td>
    <td><%=dto.getPprice() %></td>
	<td><%=dto.getPexplain() %></td></tr>

	<%
}
%>    
</table>



<% 
UserDAO dao = new UserDAO();
UserDTO udto = dao.getUser(id);
if(id!=null){
	if(udto.getUtype()==2){
%>
 <div id="table_search">

<button type="button" class="btn btn-outline-success" onclick="location.href='ProductWriteForm.pr'">
상품등록</button>
</div>

<%
	}
}
%>

<div class="room-pagination">
<!-- 페이징 부분 -->
<% 

if(startPage > pageBlock){
	%>
<a href="ProductList.pr?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]
<i class="fa fa-long-arrow-right"></i></a>
	<%
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="ProductList.pr?pageNum=<%=i%>"><%=i %></a> 
	<%
}

if(endPage < pageCount){
	%>
<a href="ProductList.pr?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]
<i class="fa fa-long-arrow-right"></i></a>
	<%
}
%>
</div>
<!-- 푸터 들어가는 곳 -->

</article>
<jsp:include page="../inc/footer.jsp" />
</body>
</html>