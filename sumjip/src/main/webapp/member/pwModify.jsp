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
<script type="text/javascript" src="script/jquery-3.6.3.js"></script>
 <script type="text/javascript">
 	// jQurery 준비 => 대상.함수()
 	$(document).ready(function(){

		//submit 버튼을 클릭했을때 이벤트 onsubmit()
		// id="pass_modify" 폼태그 표시 => 전송
		$('#pass_modify').submit(function(){
			
			if($('.pass').val()==""){
				alert("비밀번호 입력하세요");
				$('.pass').focus();
				return false;
			}
			if($('.pass2').val()==""){
				alert("비밀번호 재확인 입력하세요");
				$('.pass2').focus();
				return false;
			}
			
			if($('.pass').val() != $('.pass2').val()){
				alert("비밀번호가 일치하지 않습니다.");
				$('.pass2').focus();
				return false;
			}
		});
	});
</script>

<style>
#rap {
  width: 600px;
  margin: 50px auto;
  margin-bottom: 200px;
  background-color: #fff;
  padding: 20px;
  padding-bottom: 60px; 
  border-radius: 10px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
  font-family: 'NanumSquareNeo';
}

legend {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 20px;
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
  background-color: #99b19c;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-right: 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            float: right;
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
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/my_header.jsp"/>
<!-- 헤더들어가는 곳 -->

<div id="rap">

<%

String id=(String)session.getAttribute("id");

// UserDAO dao=new UserDAO();

// UserDTO dto=dao.getUser(id);

UserDTO dto=(UserDTO)request.getAttribute("dto");
 %> 

	<form action="MemberPwModifyPro.me" name="passForm" id="pass_modify" method="post">
		<fieldset>
			<legend>비밀번호 변경</legend>
			<label>아이디</label>
			<input type="text" name="id" class="id" value="<%=id%>" readonly><br>
			<label>새 비밀번호</label> 
			<input type="password" name="pass" class="pass" ><br>
			<label>비밀번호 재확인</label> 
			<input type="password" name="pass2" class="pass2"><br>
		</fieldset>
		<div id="buttons">
			<input type="submit" value="변경" class="btn btn-outline-success" >
			<input type="reset" value="취소" class="btn btn-outline-success">
		</div>
	</form>

	


</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->	
</body>
</html>