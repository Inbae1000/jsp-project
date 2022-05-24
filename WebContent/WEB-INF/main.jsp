<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import = "subject.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file ="menu2.jsp" %>
	
		<div style="width:auto" class = "container">
		<div style="width: 1000px; margin: auto;">
		<div style="text-align:center;">
			<input type = "text" style="text-align:center; margin-bottom: 20px" placeholder="검색창" >
			<button type="submit" class="btn btn-info">검색</button>
		</div>
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<tr>
					<th style="background-color:#eeeeee; text-align:center;">번호</th>
					<th style="background-color:#eeeeee; text-align:center;">과목이름</th>
					<th style="background-color:#eeeeee; text-align:center;">과목코드</th>
					<th style="background-color:#eeeeee; text-align:center;">훈련시작</th>
					<th style="background-color:#eeeeee; text-align:center;">훈련종료</th>
					<th style="background-color:#eeeeee; text-align:center;">관리</th>
					<th style="background-color:#eeeeee; text-align:center;">담당교수</th>					
				</tr>
				<%
					SubjectDAO subjectDao = SubjectDAO.getInstance();
					List<SubjectDTO> list = subjectDao.subjectList();
					int a = 0;
					for(SubjectDTO b : list){
						a=a+1;					
				%>
				<tr>
					<td><%=a %></td> 
					<th style="background-color:#FFFFFF; text-align:center;"><a href="select.so?s_id=<%=b.getS_id()%>"><%=b.getS_name() %></a></th>  <!-- 수정필요  -->
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_code() %></th>
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_start() %></th>
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_end() %></th>
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_manage() %></th>
					<th style="background-color:#FFFFFF; text-align:center;"><%=b.getS_professor() %></th>
				</tr>
				<%
					}
				%>								
				</table>
				<a href ="insert.so" class="btn btn-primary pull-right">과목추가</a>	
			</div>
		</div>	 
	
	

</body>
</html>