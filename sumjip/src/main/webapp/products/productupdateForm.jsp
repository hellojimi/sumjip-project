<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
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
article{
	font-family: 'NanumSquareNeo';
  	max-width: 1000px;
 	margin: 0 auto;
 	margin-bottom: 50px;
}
 #wrap{  
 	max-width: 800px; 
 	margin: 0 auto; 
 	margin-bottom: 50px; 

 } 

.thead {
	background: #99b19c;
	color: #FFFFFF;
	text-align: center;
	
}
.tcontent{
	text-align: center;
}

.heading-section {
    font-size: 30px;
    color: #393939;
    line-height: 1.5;
    font-weight: 400;
    font-family: 'NanumSquareNeo';
    font-weight: bold;
    text-align: center;
    margin: 10px; 
     
}

#table_search{
	float: right;
   
}

input[type="text"],
input[type="time"],
input[type="file"],
input[type="tel"],  
select {
          width: 100%;
          padding: 15px;
          font-size: 16px;
          border: 1px solid #ccc;
          border-radius: 5px;
        }

</style>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<%
// int pno=Integer.parseInt(request.getParameter("pno"));

// ProductDAO dao=new ProductDAO();

// ProductDTO dto=dao.getProduct(pno);

ProductDTO dto=(ProductDTO)request.getAttribute("dto");
%>
<article>
<div id="wrap">
<h2 class="heading-section">등록펜션 수정</h2>

<form action="ProductUpdatePro.pr" method="post" class="produpdate" enctype="multipart/form-data">
<input type="hidden" name="pno" value="<%=dto.getPno()%>">
<table class="table">
<%--     <td><input type="text" name="no" value="<%=dto.getNo()%>" readonly></td></tr> --%>
<tr><td class="thead">펜션이름</td>
    <td class="tcontent"><input type="text" name="pname" value="<%=dto.getPname() %>"></td></tr>
<tr><td class="thead">체크인</td>
    <td class="tcontent"><input type="time" name="checkin" value="<%=dto.getCheckin()%>"></td></tr>
<tr><td class="thead">체크아웃</td>
    <td class="tcontent"><input type="time" name="checkout" value="<%=dto.getCheckout()%>"></td></tr>
<tr><td class="thead">가격</td>
    <td class="tcontent"><input type="text" name="pprice" value="<%=dto.getPprice() %>"></td></tr>   
<tr><td class="thead">최대숙박인원</td>
    <td class="tcontent"><input type="text" name="max_men" value="<%=dto.getMax_men() %>"></td></tr>    
<tr><td class="thead">펜션사진1</td>
    <td class="tcontent"><input type="file" name="ppic1" value="<%=dto.getPpic1()%>">
    <input type="hidden" name="oldppic1" value="<%=dto.getPpic1()%>">
    </td></tr>
<tr><td class="thead">펜션사진2</td>
    <td class="tcontent"><input type="file" name="ppic2" value="<%=dto.getPpic2() %>">
    <input type="hidden" name="oldppic2" value="<%=dto.getPpic2()%>">    
    </td></tr>
<tr><td class="thead">펜션사진3</td>
    <td class="tcontent"><input type="file" name="ppic3" value="<%=dto.getPpic3() %>">
        <input type="hidden" name="oldppic3" value="<%=dto.getPpic3()%>">
        </td></tr>
<tr><td class="thead">주의사항</td>
    <td class="tcontent"><textarea name="caution" rows="10" cols="70"><%=dto.getCaution() %></textarea></td></tr>                      
<tr><td class="thead">펜션설명</td>
    <td class="tcontent"><textarea name="pexplain" rows="10" cols="70"><%=dto.getPexplain()%></textarea></td></tr>
<!-- <tr><td colspan="2"><input type="submit" value="상품등록 수정"></td></tr> -->   
<!-- </thead> -->
</table>
<div id="table_search">
<input type="submit" class="btn btn-outline-success" value="수정하기"> 
</div>

</form>
</div>
</article>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
</body>
</html>