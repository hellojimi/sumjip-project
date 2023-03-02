<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Loding font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">

    <!-- Custom Styles -->
    <link rel="stylesheet" type="text/css" href="css/styles.css">
<title>섬집 관리자 페이지</title>
</head>
<body>

    <div id="login-bg" class="container-fluid">

      <div class="bg-img"></div>
      <div class="bg-color"></div>
    </div>

    <!-- End Backgrounds -->

    <div class="container" id="login">
        <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="login">

            <h1>관리자 Login</h1>
            
            <!-- Loging form -->
                  <form action="AdminLoginPro.ad" id="login" method="post">
                    <div class="form-group">
                      <input type="text" name="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="아이디를 입력하세요">
                      
                    </div>
                    <div class="form-group">
                      <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="비밀번호를 입력하세요">
                    </div>
                  
                    <br>
                    <button type="submit" class="btn btn-lg btn-block btn-success" style="border:none;">로그인</button>
                  </form>
             <!-- End Loging form -->

          </div>
        </div>
        </div>
    </div>
</body>
</html>