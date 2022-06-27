<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인</title>
</head>
<body>
	
	<%@ include file = "menu.jsp" %>
	
	<div style = " margin-top : 70px;" class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4"></div>
			<div class="jumborron" style="padding-top:20px">
				<form method="post" action="loginAction.do">
					<h3 style="text-align:cneter;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="u_email" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="u_pass" maxlength="20">
					</div>
					<input type="submit"class="btn btn-primary form-control" value="로그인">  
				</form>
			</div>
		<div class="col-lg-4"></div>
	</div>
</body>
</html>