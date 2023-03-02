<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
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
<style type="text/css">
 #rap {
  width: 600px;
  height: 700px;
  margin: 50px auto;
  margin-bottom: 70px;
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
  font-family: 'NanumSquareNeo';
}

legend {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 20px;
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
</style>
</head>
<body>
	<%
	// 회원정보 기준값 id => 세션에 id 값 저장 되어있음
	// 세션에서 "id" 값을 가져오기 => 변수저장
 	String id = (String) session.getAttribute("id");
	// MemberDAO 객체생성
 	UserDAO dao= new UserDAO();
	// MemberDTO dto = getMember(id) 메서드호출
 	UserDTO dto = dao.getUser(id);
	%>
			<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/my_header.jsp" />
		<!-- 헤더들어가는 곳 -->

<div id="rap">
		<div class="row">
			<div class="col-sm-12">
				<h2 class="heading-section">My Page</h2>
				<hr>
					<form method="POST" action="updateAction" name="updateForm"
						onsubmit="return updateValidate();" class="form-horizontal"
						role="form">
<!-- 						<fieldset> -->
						<!-- 이름 -->
						<label>이름</label> 
						<input type="text" name="uname" value="<%=dto.getUname()%>" readonly>

						<!-- 아이디 -->
						<label>아이디</label> 
						<input type="text" name="id" value="<%=id%>" readonly>

						<!-- 이름 -->
						<label>전화번호</label> 
						<input type="text" name="tel" value="<%=dto.getTel()%>" readonly>

						<!-- 이름 -->
						<label>이메일</label> 
						<input type="text" name="email" value="<%=dto.getEmail()%>" readonly>

						<!-- 이름 -->
						<label>주소</label> 
						<input type="text" name="adrress1" value="<%=dto.getAddress1()%>" readonly> 
						<input type="text" name="adrress2" value="<%=dto.getAddress2()%>" readonly>
<!-- 						</fieldset> -->
						
						<div id="buttons">
							<a href="MemberUpdateForm.me">
							<input type="button" name="user_modify"  value="회원정보 수정"></a> 
							<a href="MemberPwModify.me">
								<input type="button" name="pass_modify" value="비밀번호 수정"></a>
						</div>
					</form>
				</div>
			</div>
		</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>