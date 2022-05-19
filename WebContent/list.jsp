<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<!-- 인원정보  -->
<%@ page import ="member.MemberDAO" %>
<%@ page import ="member.MemberDTO" %>
<!-- 업체현황  -->
<%@ page import ="company.CompanyDAO" %>
<%@ page import ="company.CompanyDTO" %>
<!-- 인원결과  -->
<%@ page import ="consequence.ConsequenceDAO" %>
<%@ page import ="consequence.ConsequenceDAO" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>수강인원 목록</title>
<style type = "text/css">
	a,a:hover{
		color:#000000;
		text-decoration:none;
	}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("u_email") != null){
			userID = (String) session.getAttribute("u_email");
		}
		int pageNumber = 1;			//기본 페이지
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
			<a class="navbar-brand" href="main.jsp">수강인원 관리</a>
		</div>
		<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="list.jsp">인원현황</a></li>
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
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
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
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>			
			<%
				}
			%>
	
		</div>	
	</nav>
	<div class = "container">
		<div class = "row">
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">번호</th>
						<th style="background-color:#eeeeee; text-align:center;">성명</th>
						<th style="background-color:#eeeeee; text-align:center;">생년월일</th>
						<th style="background-color:#eeeeee; text-align:center;">전화번호</th>
						<th style="background-color:#eeeeee; text-align:center;">지역</th>
						<th style="background-color:#eeeeee; text-align:center;">나이</th>
						<th style="background-color:#eeeeee; text-align:center;">성별</th>
						<th style="background-color:#eeeeee; text-align:center;">유형</th>
						<th style="background-color:#eeeeee; text-align:center;">구분</th>
						<th style="background-color:#eeeeee; text-align:center;">결과</th>
						<th style="background-color:#eeeeee; text-align:center;">출석률</th>
						<th style="background-color:#eeeeee; text-align:center;">수료</th>
						<th style="background-color:#eeeeee; text-align:center;">취업</th>
						<th style="background-color:#eeeeee; text-align:center;">동일</th>
						<th style="background-color:#eeeeee; text-align:center;">고보</th>
						<th style="background-color:#eeeeee; text-align:center;">직종가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">취업가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">직종가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">취업가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">직종가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">취업가중치</th>
						<th style="background-color:#eeeeee; text-align:center;">평가기준</th>
						<th style="background-color:#eeeeee; text-align:center;">직종기준</th>
						<th style="background-color:#eeeeee; text-align:center;">자격증</th>
						<th style="background-color:#eeeeee; text-align:center;">입사일</th>
						<th style="background-color:#eeeeee; text-align:center;">고용유지기간</th>
						<th style="background-color:#eeeeee; text-align:center;">퇴사여부</th>
						<th style="background-color:#eeeeee; text-align:center;">업체명</th>
						<th style="background-color:#eeeeee; text-align:center;">주소</th>
						<th style="background-color:#eeeeee; text-align:center;">전화번호</th>
						<th style="background-color:#eeeeee; text-align:center;">취업전담제</th>
						<th style="background-color:#eeeeee; text-align:center;">산정제외</th>
						<th style="background-color:#eeeeee; text-align:center;">비고</th>
						
						
					</tr>
 				</thead>
				<tbody> 
					<% 
						MemberDAO memberDao = MemberDAO.getInstance();
						List<MemberDTO> list = memberDao.selectList();		
					%>		
					<tr>
						<td><%=member.getM_id() %></td>
						<td><a href="memberinfo.jsp?m_id=<%= list.get(i).getM_id()%>"><%= list.get(i).getM_name()%></a></td>
						<td><%= list.get(i).getM_brith()%></td>
						<td><%= list.get(i).getM_number() %></td>
						<td><%= list.get(i).getM_area() %></td>
						<td><%= list.get(i).getM_age() %></td>
						<td><%= list.get(i).getM_sex() %></td>
						<td><%= list.get(i).getM_oction2() %></td>
						<td><%= list.get(i).getM_oction() %></td>
						<td></td>
					</tr>									
			</tbody>				
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="list.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				}if(memberDAO.nextPage(pageNumber + 1)){
			%>
				<a href="list.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href ="memberAdd.jsp" class="btn btn-primary pull-right">수강인원 추가</a> <!-- 수강인원추가버튼부분 -->
		</div>
	</div>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
</body>
</html>