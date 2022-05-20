<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4"></div>
			<div class="jumborron" style="padding-top:20px">
				<form method="post" action="joinAction.do">
					<h3 style="text-align:cneter;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="u_email" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="u_pass" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="u_name" maxlength="20">
					</div>
					 <!-- <div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class = "btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class = "btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>						
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
					</div> -->
					<input type="submit"class="btn btn-primary form-control" value="회원가입">  
				</form>
			</div>
		<div class="col-lg-4"></div>
	</div>
	     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
</body>
</html>