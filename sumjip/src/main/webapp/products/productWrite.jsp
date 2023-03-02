
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
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
#rap{
  width: 600px;
  margin: 30px auto;
  background-color: #fff;
  padding: 20px;
  padding-bottom: 60px;
  border-radius: 10px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
  font-family: 'NanumSquareNeo';
}
.thead {
	background: #99b19c;
	color: #FFFFFF;
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
<jsp:include page="../inc/my_header.jsp" />


<!-- 상품등록 하기 -->
<%

ProductDTO dto=new ProductDTO();

String id=(String)session.getAttribute("id");
// String utype=(String)session.getAttribute("utype");


UserDAO dao = new UserDAO();
UserDTO udto = dao.getUser(id);

if(id==null){
	response.sendRedirect("MemberLogin.me");	
}else if(udto.getUtype()==2){
	
}else{
	%>
	<script type="text/javascript">
	alert("글쓰기 권한이 없습니다.");
	history.back();
	</script>
	<%
}
%>
<article>
<div id="rap">
<h3 class="heading-section">상품등록</h3>

<form action="ProductWritePro.pr" method="post" class="produpdate" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%=udto.getNo()%>">
	<table class="table">
		<tr><td class="thead">아이디</td> 
			<td class="tcontent"><input type="text" name="id" value="<%=id%>" readonly></td></tr>	
		<tr><td class="thead">펜션이름</td>
			<td class="tcontent"><input type="text" name="pname"></td></tr>
		<tr><td class="thead">펜션주소</td> 
		<td class="tcontent"><label>우편번호</label> <input type="text" name="ppostnum"><br>
							 <label>주소</label> <input type="text" name="paddress" ><br>
							 <label>상세주소</label> <input type="text" name="paddress2"></td></tr>

						
		<tr><td class="thead">전화번호</td> 
		<td class="tcontent"><input type="tel" name="ptel"></td></tr> 

		<tr><td class="thead">체크인<br>시간</td> 
			<td class="tcontent"><input type="time" name="checkin" ></td></tr> 
						
		<tr><td class="thead">체크아웃<br>시간</td> 
			<td class="tcontent"><input type="time" name="checkout" ></td></tr> 

		<tr><td class="thead">가격</td> 
		<td class="tcontent"><input type="text" name="pprice" ></td></tr> 

		<tr><td class="thead">최대숙박<br>인원</td> 
			<td class="tcontent"><input type="text" name="max_men" ></td></tr> 

		<tr><td class="thead">펜션사진1</td> 
			<td class="tcontent"><input type="file" name="ppic1" ></td></tr> 

		<tr><td class="thead">펜션사진2</td> 
			<td class="tcontent"><input type="file" name="ppic2" ></td></tr> 

		<tr><td class="thead">펜션사진3</td> 
			<td class="tcontent"><input type="file" name="ppic3" ></td></tr> 

		<tr><td class="thead">주의사항</td> 
			<td class="tcontent"><input type="text" name="caution" ></td></tr> 
			
		<tr><td class="thead">펜션 설명</td> 
			<td class="tcontent"><input type="text" name="pexplain" ></td></tr> 
		</table>
		<div id="table_search">								
			<input type="submit" class="btn btn-outline-success" value="상품등록">
		</div>											
<!-- 						<div class="btnChange"> -->
<!-- 							<a href="ProductWritePro.pr"><input type="button"  -->
<!-- 								value="상품등록"></a>  -->
<!-- 						</div> -->
</form>
</div>
</article>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />

</body>
</html>