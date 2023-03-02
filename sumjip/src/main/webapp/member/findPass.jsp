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
  /* 전체 레이아웃 */
  body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
  }
  #wrap {
   width: 100%;
   max-width: 800px;
   margin: 0 auto;
   margin-bottom: 100px;
   font-family: 'NanumSquareNeo';
   border-radius: 10px;
 }
  
  /* 로고와 제목 */
  .header { 
    display: flex; 
    align-items: center; 
    justify-content: center; 
    background-color: white; 
    color: #fff; 
    height: 80px; 
    margin: 40px auto;
   }
  .heading-section { 
    font-size: 40px; 
    color: #393939; 
    line-height: 1.5;     	
    font-weight: 400; 
    font-family: "Poppins", Arial, sans-serif;  
    font-weight: bold;  
    text-align: center; 
    margin: 10px;  
   } 
  
  /* 비밀번호 찾기 폼 */
  .form-container {
    background-color: #fff;
    margin: 30px auto;
    margin-bottom: 100px;
    max-width: 600px;
    padding: 30px;
    padding-bottom: 60px;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1)
  }
  
  .form-container p {
    margin-top: 0;
    margin-bottom: 20px;
    font-size: 16px;
  }
  
  .form-container label {
    display: block;
    margin-bottom: 10px;
    font-size: 16px;
  }
  
  .form-container input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-top :30px;
    font-size: 16px;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box;
  }
  
  .form-container input[type="button"] {
    background-color: #99b19c;
    color: white;
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    float: right;
  }
  
  .form-container input[type="button"]:hover {
    background-color: #113000;
  }
</style>

<script type="text/javascript">
function pass_search() { 
	 	var frm = document.passfindscreen;

	 	if (frm.id.value.length < 1) {
		  alert("아이디를 입력해주세요");
		  return;
		 }

	 frm.method = "post";
	 frm.action = "MemberFindPassPro.me"; //넘어간화면
	 frm.submit();  
	 }
</script>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<div id="wrap">
<div class="header">
<h2 class="heading-section">비밀번호 찾기</h2>
</div>

<div class="form-container">

비밀번호를 찾고자 하는 아이디를 입력해 주세요.
<form action="MemberFindPassPro.me" name="passfindscreen" method = "POST">
	<input type="text" name="id" id="id">
	<br><br>
	<input type="button" name="enter" value="다음"  onClick="pass_search()">
<!-- 	<button>다음</button> -->
</form>
</div>
</div>
<jsp:include page="../inc/footer.jsp" />
</body>
</html>