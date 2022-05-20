<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("u_email") != null){
			userID = (String) session.getAttribute("u_email");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
             data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
             aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home.do">수강인원 관리</a>
		</div>
		<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="home.do">메인</a></li>
				<li><a href="select.do">인원현황</a></li>
			</ul>
			<%
				if(userID ==null){
				
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class ="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.do">로그인</a></li>
						<li><a href="join.do">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				}else{
				
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">내정보<span class ="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.do">로그아웃</a></li>
					</ul>
				</li>
			</ul>			
			<%
				}
			%>
	
		</div>	
	</nav>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
	
</body>
</html>