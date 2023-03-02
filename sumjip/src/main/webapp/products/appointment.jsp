
<%@page import="member.UserDTO"%>
<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<meta charset="UTF-8">
<title>섬집</title>

<link rel="stylesheet" href="css/insert.css" type="text/css" >
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style>
.heading-section{
	font-size: 45px;
    color: #393939;
    line-height: 1.5;
    font-weight: 400;
    font-family: 'NanumSquareNeo';
/*     font-family: "Poppins", Arial, sans-serif; */
    font-weight: bold;
    text-align: center;
    margin: 25px;
}
#wrap {
  width: 700px;
  margin: 30px auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
  font-family: 'NanumSquareNeo';
}
legend {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 20px;
}
.menu-section{
	font-size: 25px;
    color: #393939;
/*     line-height: 1.5; */
/*     font-weight: 400; */
/*     font-family: "Poppins", Arial, sans-serif; */
	font-family: 'NanumSquareNeo';
    font-weight: bold;
    text-align: center;
    margin: 25px;
}

fieldset {
  border: none;
  margin: 0;
  padding: 0;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="email"],
select {
  display: block;
  width: 100%;
  margin-bottom: 5px;
  padding: 10px;
  font-size: 1rem;
  border-radius: 5px;
  border: 1px solid #99b19c;
}

select option {
  font-size: 1rem;
}

input[type="button"],
input[type="submit"],
input[type="reset"] {
  display: inline-block;
  padding: 10px;
  font-size: 1rem;
  color: #fff;
  background-color: #99b19c;
  border-radius: 5px;
  border: none;
  cursor: pointer;
  float : right;
}

input[type="button"]:hover,
input[type="submit"]:hover,
input[type="reset"]:hover {
  background-color: #113000;
}
label {
  display: block;
  font-size: 1rem;
  margin-bottom: 5px;
  font-weight: bold;
}

.clear {
  clear: both;
}

#error-msg {
  color: red;
  font-weight: bold;
  margin-top: 10px;
}

.divresult {
  margin-bottom: 10px;
  font-size: 1rem;
  font-weight: bold;
}

.address-wrap {
  display: flex;
  flex-wrap: wrap;
}

#sample4_postcode {
  width: 150px;
  margin-right: 10px;
}

#sample4_roadAddress {
  flex: 1;
  margin-right: 10px;
}

#sample4_detailAddress {
  flex: 1;
}
</style>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<%
String id=(String)session.getAttribute("id"); 
ProductDTO pdto = (ProductDTO)request.getAttribute("pdto");
UserDTO udto = (UserDTO)request.getAttribute("udto");
	
	%>
<article>
<!-- 	<h2 class="heading-section">예약</h2> -->
	<div id="wrap">              
  		<form action="ProductAppointmentPro.pr" name="appointmentform" id="appointment" method="post">
          <fieldset>                  
               <h3 class="menu-section">예약자 정보확인</h3>
                 <div class="ap-services">
                    예약자명 : <input type="text" name="uname" value="<%=udto.getUname()%>" readonly><br>
                    전화번호 : <input type="text" name="tel" value="<%=udto.getTel()%>" readonly><br>
                    이메일 : <input type="text" name="email" value="<%=udto.getEmail()%>" readonly>
				 </div>
							
                <h3 class="menu-section">예약정보 입력</h3>
				  <div class="ap-services">	
					펜션이름 : <input type="text" name="pname" value="<%=pdto.getPname()%>" readonly><br>
					숙박료 : <input type="text" name="price" value="<%=pdto.getPprice()%>원 /1박" readonly><br>
					입실일 : <input type="date" name="indate" id="inDate"><br>
					퇴실일 : <input type="date" name="outdate"><br>
					인원수 : <select name="guest">
                                                    <option value="1">1명</option>
                                                    <option value="2">2명</option>
                                                    <option value="3">3명</option>
                                                    <option value="4">4명</option>
                                                    <option value="5">5명</option>
                                                    <option value="6">6명</option>
                                                    <option value="7">7명</option>
                                                    <option value="8">8명</option>
                                                    <option value="9">9명</option></select><br>
				</div>
					<input type="submit" value="예약하기">
					<input type="hidden" name="no" value="<%=udto.getNo()%>">
					<input type="hidden" name="pno" value="<%=pdto.getPno()%>">
					</fieldset>
				</form>
               </div>  
                  
</article>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>