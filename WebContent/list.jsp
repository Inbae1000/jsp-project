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
<%@ page import ="consequence.ConsequenceDTO" %>
<%@ page import = "java.util.List" %>
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
	td{
		border: 1px; solid #ddddddd;
	}
</style>
</head>
<body>

	<%
	MemberDAO memberDao = MemberDAO.getInstance();
	List<MemberDTO> list = memberDao.selectList();
	
	ConsequenceDAO consequenceDao = ConsequenceDAO.getInstance();
	List<ConsequenceDTO> list2 = consequenceDao.selectList();
	
	CompanyDAO companyDao = CompanyDAO.getInstance();
	List<CompanyDTO> list3 = companyDao.selectList(); 
	%>
	
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
<!-- 과목정보 -->
	<div>
		<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
			<tr>
				<th colspan='2'>1</th>
				<th colspan='16' style="text-align:center;">컴퓨터응용기계설계가공(CAD/CAM)A(AIG20190000253037)</th>
			</tr>
			<tr>
				<th colspan='20'>　</th>
			</tr>
			<tr>
				<th rowspan='2'>훈련과정</th>
				<th colspan='6' >컴퓨터응용기계설계가공(CAD/CAM)<br>(AIG20190000253037)</th>
				<th>훈련기간</th>
				<th>2020-07-24</th>
				<th>~</th>
				<th>관리: 2021-08-07</th>
				<th>담당교수</th>
				<th>장세동</th>
			</tr>			
		</table>
	</div>
<!-- 인원total정보 -->	
	<div style="width:auto" class = "container">
		<div style="width: auto;">
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<tr>
					<th style="background-color:#eeeeee; text-align:center;">정원</th>
					<th style="background-color:#eeeeee; text-align:center;">모집인원</th>
					<th style="background-color:#eeeeee; text-align:center;">수료인원</th>
					<th style="background-color:#eeeeee; text-align:center;">중도탈락</th>
					<th style="background-color:#eeeeee; text-align:center;">조기취업</th>
					<th style="background-color:#eeeeee; text-align:center;">이수취업</th>
					<th style="background-color:#eeeeee; text-align:center;">수료취업</th>
					<th style="background-color:#eeeeee; text-align:center;">수료미취업</th>
					<th colspan='3' style="background-color:#eeeeee; text-align:center;">산정제외</th> <!-- colspan3  -->
					<th style="background-color:#eeeeee; text-align:center;">산정인원</th>
					<th colspan='4' style="background-color:#eeeeee; text-align:center;">취업률</th> <!-- colspan4 -->
					<th style="background-color:#eeeeee; text-align:center;">고보가입</th>
					<th style="background-color:#eeeeee; text-align:center;">수료고보</th>
					<th style="background-color:#eeeeee; text-align:center;">자격취득</th>
				</tr>
				<tr>
					<td rowspan='2' style="background-color:#; text-align:center;">25</td>
					<td style="background-color:#E5FFCC; text-align:center;">17명</td>
					<td style="background-color:#E5FFCC; text-align:center;">13명</td>
					<td style="background-color:#FFFFFF; text-align:center;">2명</td>
					<td style="background-color:#FFFFFF; text-align:center;">1명</td>
					<td style="background-color:#FFFFFF; text-align:center;">0명</td>
					<td style="background-color:#FFFFFF; text-align:center;">12명</td>
					<td style="background-color:#FFFFFF; text-align:center;">2명</td>
					<td style="background-color:#eeeeee; text-align:center;">수료전</td>
					<td style="background-color:#eeeeee; text-align:center;">수료후</td>
					<td style="background-color:#eeeeee; text-align:center;">재직자</td>
					<td rowspan='2' style="background-color:#E5FFCC; text-align:center;">13명</td>
					<td style="background-color:#eeeeee; text-align:center;">목표취업률</td>
					<td style="background-color:#eeeeee; text-align:center;">평가기준</td>
					<td style="background-color:#FFCCCC; text-align:center;">14.05명</td>
					<td style="background-color:#FFCCCC; text-align:center;">108.1%</td>
					<td style="background-color:#FFFFFF; text-align:center;">11명</td>
					<td style="background-color:#FFFFFF; text-align:center;">11명</td>
					<td style="background-color:#FFFFFF; text-align:center;">11명</td>					
				</tr>
				<tr>
					<td style="background-color:#E5FFCC; text-align:center;">68.0%</td>
					<td style="background-color:#E5FFCC; text-align:center;">76.5%</td>
					<td style="background-color:#FFFFFF; text-align:center;">11.8%</td>
					<td style="background-color:#FFFFFF; text-align:center;">5.9%</td>
					<td style="background-color:#FFFFFF; text-align:center;">0.0%</td>
					<td style="background-color:#FFFFFF; text-align:center;">92.3%</td>
					<td style="background-color:#FFFFFF; text-align:center;">15.4%</td>
					<td style="background-color:#FFFFFF; text-align:center;">0명</td>
					<td style="background-color:#FFFFFF; text-align:center;">0명</td>
					<td style="background-color:#FFFFFF; text-align:center;">0명</td>
					<td style="background-color:#FFFFFF; text-align:center;">88.1%</td>
					<td style="background-color:#eeeeee; text-align:center;">직종기준</td>
					<td style="background-color:#FFFFFF; text-align:center;">14.75명</td>
					<td style="background-color:#FFFFFF; text-align:center;">113.5%</td>
					<td style="background-color:#FFFFFF; text-align:center;">73.3%</td>
					<td style="background-color:#FFFFFF; text-align:center;">84.6%</td>
					<td style="background-color:#FFFFFF; text-align:center;">64.7%</td>
				</tr>				
			</table>
		</div>	
	</div>
<!-- 인원리스트  -->
	<div style="width:auto" class = "container">
		<div class = "row" >
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- 기본정보 -->
						<th style="background-color:#eeeeee; text-align:center;">번호</th>
						<th style="background-color:#eeeeee; text-align:center;">성명</th>
						<th style="background-color:#eeeeee; text-align:center;">생년월일</th>
						<th style="background-color:#eeeeee; text-align:center;">전화번호</th>
						<th style="background-color:#eeeeee; text-align:center;">지역</th>
						<th style="background-color:#eeeeee; text-align:center;">나이</th>
						<th style="background-color:#eeeeee; text-align:center;">성별</th>
						<th style="background-color:#eeeeee; text-align:center;">유형</th>
						<th style="background-color:#eeeeee; text-align:center;">구분</th>
						<th style="background-color:#eeeeee; text-align:center;">비고</th>
						<!-- 수강인원결과  -->
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
						<!-- 업체현황  -->
						<th style="background-color:#eeeeee; text-align:center;">입사일</th>
						<th style="background-color:#eeeeee; text-align:center;">고용유지기간</th>
						<th style="background-color:#eeeeee; text-align:center;">퇴사여부</th>
						<th style="background-color:#eeeeee; text-align:center;">업체명</th>
						<th style="background-color:#eeeeee; text-align:center;">주소</th>
						<th style="background-color:#eeeeee; text-align:center;">전화번호</th>
						<th style="background-color:#eeeeee; text-align:center;">취업전담제</th>
						<th style="background-color:#eeeeee; text-align:center;">산정제외</th>						
						
						
					</tr>
 				</thead>
				<tbody>
					<tr> 
					<% 
						for(MemberDTO b : list){
					%>
						<td><%=b.getM_id() %></td> 
						<td><a href="update.do?id=<%=b.getM_id()%>"><%=b.getM_name()%></a></td>
						<td><%=b.getM_birth()%></td>
						<td><%=b.getM_number()%></td>
						<td><%=b.getM_area()%></td>
						<td><%=b.getM_age1()%></td>
						<td><%=b.getM_sex()%></td>
						<td><%=b.getM_option1()%></td>
						<td><%=b.getM_option3()%></td>				
						<td><%=b.getM_note()%></td>
					<%
						}
					%>
					<%
						for(ConsequenceDTO c: list2){
					%>
						<td><%=c.getCo_result()%></td>
						<td><%=c.getCo_attend()%></td>
						<td><%=c.getCo_comple()%></td>
						<td><%=c.getCo_employ()%></td>
						<td><%=c.getCo_same()%></td>
						<td><%=c.getCo_insurance()%></td>
						<td><%=c.getCo_option1()%></td>
						<td><%=c.getCo_option2()%></td>
						<td><%=c.getCo_option3()%></td>
						<td><%=c.getCo_option4()%></td>
						<td><%=c.getCo_option5()%></td>
						<td><%=c.getCo_option6()%></td>						
						<td><%=c.getCo_asse()%></td>
						<td><%=c.getCo_porf()%></td>
						<td><%=c.getCo_certificate()%></td>
					<%
						}
					%>
					<%
						for(CompanyDTO d:list3){
					%>
						<td><%=d.getC_start()%></td>
						<td><%=d.getC_maintain()%></td>
						<td><%=d.getC_end()%></td>
						<td><%=d.getC_name()%></td>
						<td><%=d.getC_address()%></td>
						<td><%=d.getC_number()%></td>
						<td><%=d.getC_manager()%></td>
						<td><%=d.getC_excep()%></td>
					<%
						}
					%>
					</tr>									
			</tbody>				
			</table>
			<%-- <%
				if(pageNumber != 1){
			%>
				<a href="list.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				}if(memberDAO.nextPage(pageNumber + 1)){
			%>
				<a href="list.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-left">다음</a> --%>
			
			<a href ="memberAdd.jsp" class="btn btn-primary pull-right">수강인원 추가</a> <!-- 수강인원추가버튼부분 -->
		</div>
	</div>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
</body>
</html>