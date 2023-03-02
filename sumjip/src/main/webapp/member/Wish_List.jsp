<%@page import="products.ProductDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.WishListDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">  
    <head>
    <meta charset="UTF-8">
    <title>섬집</title>
    </head>

<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/my_header.jsp" />
<!-- 헤더들어가는 곳 -->
		


<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("id");
System.out.println("id="+id);
//int pno = 7;
if(id!=null){
	UserDAO udao=new UserDAO();
	WishListDAO dao= new WishListDAO();
	UserDTO dto=udao.getUser(id); //no
	int no=dto.getNo();
	System.out.println("no="+no);
	ArrayList<ProductDTO> list=dao.getWishArrayList(no);
	%>

    <style>

article{
	font-family: 'NanumSquareNeo';
  	width: 850px;
  	height: 700px;
 	margin-left: 650px;
 	margin-top: 40px;
 	margin-bottom: 300px;
}


 .table thead.thead-primary{
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

  
  #table_search{
	float: right;  
}
  
  #sidebar{
 	width: 250px; 
   	height: 700px;   
	float: left;
}
a.tablelink:link {
  color : black;
}
a.tablelink:visited {
  color : black;
}
a.tablelink:hover {
  color : black;
}
a.tablelink:active {
  color : black;
}
    </style>
  
  <article>
<div class="wishlistContainer">
	<h3 class="heading-section">Wish List</h3>
	</div>

    <table class="wish table">
      <thead class="thead-primary">
        <tr>
          <th>숙소이름</th><th>숙박가격</th><th>주소</th><th>찜해제</th>
        </tr>
      </thead>
      <tbody>
        
        <%                   	
	for(int i=list.size()-1; i>=0; i--){
		ProductDTO d=list.get(i);
		System.out.println("i="+i);
		int ppno=d.getPno();
	%>
		<tr>
          <td><a href="ProductContent.pr?pno=<%=d.getPno()%>" class="tablelink"><%=d.getPname()%></a></td><td><a href="ProductContent.pr?pno=<%=d.getPno()%>" class="tablelink"><%=d.getPprice()%></a></td><td><a href="ProductContent.pr?pno=<%=d.getPno()%>" class="tablelink"><%=d.getPaddress()%></a></td>

<td id="button"><form action="MemberWishListPro.me">
<input type="hidden" name="pno" value=<%=ppno%>>
<input type="submit" name="button" class="btn btn-outline-secondary" value="찜해제">
</form></td>
		<%System.out.println("ppno="+ppno);%>
        </tr><%} %>
      </tbody>
    </table>
    <div id="table_search">
    <button type="button" class="btn btn-outline-success" onclick="location.href='MemberMyPage_user.me'">마이페이지로 돌아가기</button><br>
</div>
<%
        }else {
	response.sendRedirect("MemberLogin.me");
}
%>



</article>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
