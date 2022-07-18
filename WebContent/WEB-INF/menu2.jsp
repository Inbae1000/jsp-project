<%@page import="java.io.PrintWriter"%>
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



	<%		//첫화면 로그인화면으로 이동시켜 주는거 지우면 로그인 안하고 정보 볼수있음
		String userID = null;
		int admin = -1;

		if(session.getAttribute("u_email") != null){
			userID = (String) session.getAttribute("u_email");
			admin = (int)session.getAttribute("u_admin");
		}
		if(userID == null){
			PrintWriter outter = response.getWriter();
			outter.println("<script>");
			outter.println("location.href = 'login.do'");
			outter.println("</script>");	
		}
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
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
				<li><a href="home.do">검색 및 과정등록</a></li>
				<li><a href="performance.so">훈련실적현황</a></li>
				<li><a href="team.so">팀별실적</a></li>
				<%
						
					if(userID != null && admin != 0){		//user의 admin값이 1이면 보임
						PrintWriter script = response.getWriter();
						
				%>
					<li><a href="admin.do">관리자페이지</a>
				<%
					}
				%>
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