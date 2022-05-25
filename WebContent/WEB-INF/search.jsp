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
<title>메인 겸 과목 리스트</title>
</head>
<body>
	<%@ include file ="menu2.jsp" %> 
	
		<% 
	if (request.getParameter("searchField") == "0" || request.getParameter("searchText") == null
				|| request.getParameter("searchField").equals("0")
				|| request.getParameter("searchText").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
			
	<div style="width:auto" class = "container">
		<div style="width: 1000px; margin: auto;">					
		<div style="text-align:center;">
			<form method="post" name="search" action="search.so">
				<table class="pull-right" style="margin-bottom: 20px">
						<tr>
							<td><select class="form-control" name="searchField">								
									<option value="s_name" selected>과정명</option>
									<option value="s_code">과정코드</option>
									<option value="s_professor">담당교수</option>								
							</select></td>
							<td><input type="text" class="form-control"
								placeholder="검색" name="searchText" maxlength="100"></td>
							<td><button type="submit" class="btn btn-info">검색</button></td>
						</tr>
	
					</table>
				</form>
		</div>
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
				<tr>
					<th style="background-color:#eeeeee; text-align:center;">번호</th>
					<th style="background-color:#eeeeee; text-align:center;">과정명</th>
					<th style="background-color:#eeeeee; text-align:center;">과정코드</th>
					<th style="background-color:#eeeeee; text-align:center;">과정시작</th>
					<th style="background-color:#eeeeee; text-align:center;">과정종료</th>
					<th style="background-color:#eeeeee; text-align:center;">관리</th>
					<th style="background-color:#eeeeee; text-align:center;">담당교수</th>					
				</tr>
				<%
					SubjectDAO subjectDAO = SubjectDAO.getInstance();
					ArrayList<SubjectDTO> list = subjectDAO.getSearch(request.getParameter("searchField"),
							request.getParameter("searchText"));
					if (list.size() == 0) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('검색결과가 없습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					int a = 0;
					for(SubjectDTO b : list){
						a=a+1;	
									
				%>
				<tr>
					<td><%=a %></td> 
					<th style="background-color:#FFFFFF; text-align:center;"><a href="select.do?s_id=<%=b.getS_id()%>"><%=b.getS_name() %></a></th>  <!-- 수정필요  -->
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
	
	
	 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script> -->
</body>
</html>